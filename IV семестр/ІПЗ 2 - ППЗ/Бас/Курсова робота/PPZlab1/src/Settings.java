import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.Map.Entry;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * ���� ��� ��������� ������������
 * 
 */
public class Settings {
	String SEPARATOR_NODE = ".";
	String SEPARATOR_ATTRIBUTE = ":";
	private HashMap<String, String> map;

	/**
	 * @param inputFile
	 *            -XML ���� � �������������
	 */
	public Settings(String inputFile) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder builderDocument = builderFactory
					.newDocumentBuilder();
			Document document = builderDocument.parse(inputFile);

			map = new HashMap<String, String>();
			parseNode(document.getDocumentElement(), "");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	/**
	 * ������� �����
	 * 
	 * @param node
	 *            - �����
	 * @param path
	 *            - ������ �� �����
	 */
	private void parseNode(Node node, String path) {
		String nodeName = node.getNodeName();
		String currentPath;
		if ("".equals(path)) {
			currentPath = nodeName;
		} else {
			if (!nodeName.equals("#text"))
				currentPath = path + SEPARATOR_NODE + nodeName;
			else
				currentPath = path;
		}
		if (node.getNodeValue() != null)
			map.put(currentPath, node.getNodeValue());

		if (node.getAttributes() != null) {
			NamedNodeMap attributes = node.getAttributes();
			for (int i = 0; i < attributes.getLength(); i++) {
				Node atNode = attributes.item(i);
				if (atNode.getNodeValue() != null) {
					String attributePath = currentPath + SEPARATOR_ATTRIBUTE
							+ atNode.getNodeName();
					String nodeValue = atNode.getNodeValue();
					map.put(attributePath, nodeValue);
				}
			}
		}
		if (node.getChildNodes() != null) {
			NodeList childList = node.getChildNodes();
			for (int i = 0; i < childList.getLength(); i++) {
				parseNode(childList.item(i), currentPath);
			}
		}
	}

	public void save(String outFile) throws ParserConfigurationException,
			IOException {
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory
				.newInstance();
		DocumentBuilder builderDocument = builderFactory.newDocumentBuilder();
		Document document = builderDocument.newDocument();
		// Node firstNode = document.getDocumentElement();

		Set<Entry<String, String>> setMap = map.entrySet();
		for (@SuppressWarnings("rawtypes")
		Iterator iterator = setMap.iterator(); iterator.hasNext();) {
			@SuppressWarnings("unchecked")
			Entry<String, String> entry = (Entry<String, String>) iterator
					.next();
			// Node currentNode=firstNode;
			Node highNode = document;
			String key = entry.getKey();
			String[] names = key.split("\\" + SEPARATOR_NODE);
			int k = 0;
			if (names[0].equals("test"))
				k++;
			if (names.length > 0) {
				// ���� �������� �������
				String lastElement = names[names.length - 1];
				boolean hasAttribute = false;
				String attribute = null;
				if (lastElement.indexOf(SEPARATOR_ATTRIBUTE) > 0) {
					String[] attributes = lastElement
							.split(SEPARATOR_ATTRIBUTE);
					hasAttribute = true;
					names[names.length - 1] = attributes[0];
					attribute = attributes[1];
				}
				for (int i = 0; i < names.length; i++) {
					Node currentNode = null;
					NodeList childList = highNode.getChildNodes();
					if (childList != null)
						for (int j = 0; j < childList.getLength(); j++)
							if (childList.item(j).getNodeName()
									.equals(names[i])) {
								currentNode = childList.item(j);
								break;
							}
					if (currentNode == null) {
						Element newElement = document.createElement(names[i]);
						try {
							highNode.appendChild(newElement);
						} catch (Exception e) {
						}

						currentNode = newElement;
					}
					highNode = currentNode;
				}
				if (hasAttribute) {
					Element element = (Element) highNode;
					element.setAttribute(attribute, entry.getValue());
				} else {
					highNode.setNodeValue(entry.getValue());
				}
			}
		}

		FileWriter writer = new FileWriter(new File(outFile));
		printDomTree(document, writer);
		writer.close();
	}

	public void printDomTree(Node node, FileWriter writer) throws IOException {
		int type = node.getNodeType();
		switch (type) {
		// print the document element
		case Node.DOCUMENT_NODE: {
			writer.write("<?xml version=\"1.0\" ?>" + "\n");
			printDomTree(((Document) node).getDocumentElement(), writer);
			break;
		}

		// print element and any attributes
		case Node.ELEMENT_NODE: {
			writer.write("<");
			writer.write(node.getNodeName());
			if (node.getNodeValue() != null)
				writer.write(node.getNodeValue());
			NamedNodeMap attrs = node.getAttributes();
			for (int i = 0; i < attrs.getLength(); i++)
				printDomTree(attrs.item(i), writer);

			writer.write(">" + "\n");

			if (node.hasChildNodes()) {
				NodeList children = node.getChildNodes();
				for (int i = 0; i < children.getLength(); i++)
					printDomTree(children.item(i), writer);
			}

			writer.write("</");
			writer.write(node.getNodeName());
			writer.write('>' + "\n");

			break;
		}

		// Print attribute nodes
		case Node.ATTRIBUTE_NODE: {
			writer.write(" " + node.getNodeName() + "=\""
					+ ((Attr) node).getValue() + "\"");
			break;
		}

		// handle entity reference nodes
		case Node.ENTITY_REFERENCE_NODE: {
			writer.write("&");
			writer.write(node.getNodeName());
			writer.write(";");
			break;
		}

		// print cdata sections
		case Node.CDATA_SECTION_NODE: {
			writer.write("<![CDATA[");
			writer.write(node.getNodeValue());
			writer.write("]]>");
			break;
		}

		// print text
		case Node.TEXT_NODE: {
			writer.write(node.getNodeValue());
			break;
		}

		case Node.COMMENT_NODE: {
			writer.write("<!--");
			writer.write(node.getNodeValue());
			writer.write("-->");
			break;
		}

		// print processing instruction
		case Node.PROCESSING_INSTRUCTION_NODE: {
			writer.write("<?");
			writer.write(node.getNodeName());
			String data = node.getNodeValue();
			{
				writer.write(" ");
				writer.write(data);
			}
			writer.write("?>");
			break;
		}
		}
	} // printDomTree(Node)

	public String getValue(String key) {
		return map.get(key);
	}

	public void setValue(String key, String value) {
		map.put(key, value);
	}

	public HashMap<String, String> getMap() {
		return map;
	}
}
