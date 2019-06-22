import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * читає XML файли
 * 
 */
public class XMLReader extends Reader {
	final String SEPARATOR_NODE = ".";
	final String SEPARATOR_ATTRIBUTE = ":";

	public XMLReader(IConfiguration configuration) {
		this.configuration = configuration;
	}

	@Override
	public void load(String path) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder builderDocument = builderFactory
					.newDocumentBuilder();
			Document document = builderDocument.parse(path);

			parseNode(document.getDocumentElement(), "");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

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
			configuration.setValue(currentPath, node.getNodeValue());

		if (node.getAttributes() != null) {
			NamedNodeMap attributes = node.getAttributes();
			for (int i = 0; i < attributes.getLength(); i++) {
				Node atNode = attributes.item(i);
				if (atNode.getNodeValue() != null) {
					String attributePath = currentPath + SEPARATOR_ATTRIBUTE
							+ atNode.getNodeName();
					String nodeValue = atNode.getNodeValue();
					configuration.setValue(attributePath, nodeValue);
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
	
}