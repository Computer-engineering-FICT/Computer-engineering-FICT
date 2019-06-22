import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

public class Main {
    public static void main(String[] args) throws ParserConfigurationException,
            IOException {

        JSONParser parser = new JSONParser();
        String s = "[0,{\"1\":{\"2\":{\"3\":{\"4\":[5,{\"6\":7}]}}}}]";
        try {
            Object obj = parser.parse(s);
            JSONArray array = (JSONArray) obj;
            System.out.println("The 2nd element of array");
            System.out.println(array.get(1));
            System.out.println();

            JSONObject obj2 = (JSONObject) array.get(1);
            System.out.println("Field \"1\"");
            System.out.println(obj2.get("1"));

            s = "{}";
            obj = parser.parse(s);
            System.out.println(obj);

            s = "[5,]";
            obj = parser.parse(s);
            System.out.println(obj);

            s = "[5,,2]";
            obj = parser.parse(s);
            System.out.println(obj);
        } catch (ParseException pe) {
            System.out.println("position: " + pe.getPosition());
            System.out.println(pe);
        }

/*
        String inFile = "sonnet.xml";
		String outFile = "sonetOut.xml";
		ApplicationConfiguration appConfig = ApplicationConfiguration
				.getInstance();
		XMLReader reader = new XMLReader(appConfig);
		reader.load(inFile);
		XMLWriter writer=new XMLWriter(appConfig);
		writer.save(outFile);
		System.out.println(appConfig.out());
*/


    }
}
