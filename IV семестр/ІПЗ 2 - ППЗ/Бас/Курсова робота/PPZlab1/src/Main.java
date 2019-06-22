import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

public class Main {
	public static void main(String[] args) throws ParserConfigurationException,
			IOException {
		String inFile = "sonnet.xml";
		String outFile = "sonetOut.xml";
		ApplicationConfiguration appConfig = ApplicationConfiguration
				.getInstance();
		XMLReader reader = new XMLReader(appConfig);
		reader.load(inFile);
		XMLWriter writer=new XMLWriter(appConfig);
		writer.save(outFile);
		System.out.println(appConfig.out());
		

	}
}
