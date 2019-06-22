package Minimization;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class VHDLGenerator {
	
	private static ArrayList<String> all_signal = new ArrayList<String>();
	private static ArrayList<String> it_was = new ArrayList<String>();
	private static int j = 0;
	
	public static String getHeader(String[] header, String[] func, 
			int xCount, int count1, int count2) {
		String s = "library ieee; use ieee.std_logic_1164.all;\n" +
				   "entity APCS_Lab8 is\n" +
				   "port(\n";
		
		boolean flag = false;
		for (int i = 0; i < count1; i++) {
			String f = BoolFunctionsText.generateWithOut('(', ')', header[i]);
			if (!flag) flag = true;
			else s += ";\n";
			s += "   " + f + " : in STD_LOGIC";
		}
		for (int i = count1 * 2; i < xCount + count1 * 2; i++) {
			String f = BoolFunctionsText.generateWithOut('(', ')', header[i]);
			s += ";\n   " + f + " : in STD_LOGIC";
		}
		for (int i = 0; i < func.length; i++) {
			String f = BoolFunctionsText.generateWithOut('(', ')', func[i]);
			s += ";\n   " + f + " : out STD_LOGIC";
		}
		s += "\n);\n";
		s += "end APCS_Lab8;\n";
		s += "architecture FULL of APCS_Lab8 is\n";
		s += "component NOR2 is\n";
		s += "port (\n";
		s += "    I0, I1 : in std_logic;\n";
		s += "    O : out std_logic\n";
		s += ");\n";
		s += "end component;\n";
		s += "\n";
		s += "component AND3\n";
		s += "port (\n";
		s += "    I0, I1, I2 : in std_logic;\n";
		s += "    O : out std_logic\n";
		s += ");\n";
		s += "end component;\n";

		return s;
	}
	
	public static String getSignal() {
		String s = "";
		
		for (int i = 0; i < all_signal.size(); i++) {
			if (s != "") s += ", ";
			s += all_signal.get(i);
		}
		s += " : STD_LOGIC;\n";
		s += "begin\n";
		return "signal " + s;
	}
	
	public static String getTypeeElements(ArrayList<String> hm, 
			int plac, String function) {
		String str = "", buff = "";
		
		int place = plac;

		ArrayList<String> terms = new ArrayList<String>();
		terms.add("A" + place);

		if (!all_signal.contains("A" + place)) 
			if (place != plac)
				all_signal.add("A" + place);
		
		while(!terms.isEmpty()) {			
			buff = terms.get(0);
			terms.remove(0);
			
			place = Integer.parseInt(buff.substring(1));
			buff = hm.get(Integer.parseInt(buff.substring(1)));

			System.out.println(buff);
			str += "Term"+j +": ";
			if (buff.contains("v")) {
				StringTokenizer buf = new StringTokenizer(buff, " v ");
				String next1 = buf.nextToken();
				if (next1.contains("A")) {
					if (!it_was.contains(next1)) {
						terms.add(next1);
						it_was.add(next1);
					}
				}
				str += " NOR2 port map( I0 => " + next1 + ", ";
				next1 = buf.nextToken();
				if (next1.contains("A")) {
					if (!it_was.contains(next1)) {
						terms.add(next1);
						it_was.add(next1);
					}
				}
				str += "I1 => " + next1 + ", O => ";
				if (place == plac) str += function;
				else str += "A"+place;
				str += ");\n";
			} else {
				StringTokenizer buf = new StringTokenizer(buff, " ");
				String next1 = buf.nextToken();
				if (next1.contains("A")) {
					if (!it_was.contains(next1)) {
						terms.add(next1);
						it_was.add(next1);
					}
				}
				str += " AND3 port map( I0 => " + next1 + ", ";
				next1 = buf.nextToken();
				if (next1.contains("A")) {
					if (!it_was.contains(next1)) {
						terms.add(next1);
						it_was.add(next1);
					}
				}
				str += "I1 => " + next1 + ", ";
				next1 = buf.nextToken();
				if (next1.contains("A")) {
					if (!it_was.contains(next1)) {
						terms.add(next1);
						it_was.add(next1);
					}
				}
				str += "I2 => " + next1 + ", O => ";
				if (place == plac) str += function;
				else str += "A"+place;
				str += ");\n";
			}
			j++;
			
			if (!all_signal.contains("A" + place)) 
				if (place != plac)
					all_signal.add("A" + place);
		}
		
		return str + "\n";
	}
	
	public static String getEnd() { return "end FULL;"; }
}
