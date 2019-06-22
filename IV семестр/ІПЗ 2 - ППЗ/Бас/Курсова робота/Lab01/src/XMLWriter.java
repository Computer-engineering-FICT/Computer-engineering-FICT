import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLWriter extends Writer {
	final String SEPARATOR_NODE = ".";
	final String SEPARATOR_ATTRIBUTE = ":";

	public XMLWriter(IConfiguration configuration) {
		this.configuration = configuration;
	}

	@Override
	public void save(String path) throws IOException,
			ParserConfigurationException {

		DocumentBuilderFactory builderFactory = null;
		try {
			builderFactory = DocumentBuilderFactory.newInstance();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		DocumentBuilder builderDocument = builderFactory.newDocumentBuilder();
		Document document = builderDocument.newDocument();

		List<String> allKey = configuration.getAllKey();
		for (String key : allKey) {
			Node highNode = document;
			String[] names = key.split("\\" + SEPARATOR_NODE);
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
					element.setAttribute(attribute, configuration.getValue(key));
				} else {
					highNode.setTextContent(configuration.getValue(key));
				}
			}
		}

		FileWriter writer = new FileWriter(new File(path));
		printDomTree(document, writer);
		writer.close();
	}

	private void printDomTree(Node node, FileWriter writer) throws IOException {
		if (node == null)
			return;
		int type = node.getNodeType();
		switch (type) {

		case Node.DOCUMENT_NODE: {
			writer.write("<?xml version=\"1.0\" ?>" + "\n");
			printDomTree(((Document) node).getDocumentElement(), writer);
			break;
		}

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

		case Node.ATTRIBUTE_NODE: {
			writer.write(" " + node.getNodeName() + "=\""
					+ ((Attr) node).getValue() + "\"");
			break;
		}

		case Node.ENTITY_REFERENCE_NODE: {
			writer.write("&");
			writer.write(node.getNodeName());
			writer.write(";");
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
		

		}
	} // printDomTree(Node)
}