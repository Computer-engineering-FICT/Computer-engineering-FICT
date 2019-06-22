package Minimization;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class BoolForm {
	
	private static int NOR = 2;
	private static int AND = 3;
	private static ArrayList<String> hm = new ArrayList<String>();//список всех выражений
	public static ArrayList<ArrayList<String>> thesame
	= new ArrayList<ArrayList<String>>();//
	private static String type = "A";
	public static int countWas = 0;
	public static int countIs = 0;
	public static int indexOfLastFunc = 0;
	private static ArrayList<String> index = new ArrayList<String>();
	
	//получает "101-v1001"
	public static String getANDNOR(String s, String func) {

		
		//формируем все термы под записью.
		StringTokenizer st = new StringTokenizer(s, "v");
		int count = st.countTokens();
		
		String pair1 = "";
		//обработка всего выражения
		for (int i = 0; i < count; i++) {
			String term0 = st.nextToken();
			
			if (pair1 != "") pair1 += "v ";			
			pair1 += parseANDTerm(term0);
		}
		
		//в pair1 лежит переработанная вершина!
		String pair2 = parseNORTerm(pair1);
		
		if (count >= 3)
			pair1 = parseANDTerm(pair2);
		//перевод функций в чтото там!
		String code = makeSimpleFunction();
		
		countWas = countIs;
		countIs = hm.size();
		
		if (indexOfLastFunc < hm.size() - 1) {
			thesame.get(index.indexOf(indexOfLastFunc+"")).add(func);
		} else {
			ArrayList<String> lol = new ArrayList<String>();
			lol.add(func);
			index.add(indexOfLastFunc+"");
			thesame.add(lol);
		}
		
		return code;
	}
	
	private static String parseNORTerm(String pair1) {
		StringTokenizer st = new StringTokenizer(pair1, " v ");
		int count = st.countTokens();
		boolean flag = true;
		String buff = "";
		String buff2 = "";
		String main = "";
		for (int i = 0; i < count; i++) {
			if (flag) {
				buff2 = st.nextToken();
				if (buff2.contains("!")) {
					buff2 = buff2.substring(1);
					buff2 = buff2 + " v " + buff2;
					if (hm.contains(buff2)) {
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					} else {
						hm.add(buff2);
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					}
				}
				buff = buff2;
				flag = false;
			} else {
				buff2 = st.nextToken();
				if (buff2.contains("!")) {
					buff2 = buff2.substring(1);
					buff2 = buff2 + " v " + buff2;
					if (hm.contains(buff2)) {
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					} else {
						hm.add(buff2);
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					}
				}
				buff += " v " + buff2;
				flag = true;
				if (hm.contains(buff)) {
					indexOfLastFunc = hm.indexOf(buff);
					buff = type + hm.indexOf(buff) + " ";
				} else {
					hm.add(buff);
					indexOfLastFunc = hm.indexOf(buff);
					buff = type + hm.indexOf(buff) + " ";
				}
				
				if (main != "") main += " ";
				main += buff;
			}
		}
		
		//остался непарный терм! в ИЛИ! Мы сохраняем его как (он ИЛИ-НЕ он)
		if (!flag) {
			if (buff2.contains("!")) {
				buff2 = buff2.substring(1);
				buff2 = buff2 + " v " + buff2;
				if (hm.contains(buff2)) {
					indexOfLastFunc = hm.indexOf(buff2);
					buff2 = type + hm.indexOf(buff2) + " ";
				} else {
					hm.add(buff2);
					indexOfLastFunc = hm.indexOf(buff2);
					buff2 = type + hm.indexOf(buff2) + " ";
				}
			}
			buff += " v " + buff2;
			if (hm.contains(buff)) {
				indexOfLastFunc = hm.indexOf(buff);
				buff = type + hm.indexOf(buff) + " ";
			} else {
				hm.add(buff);
				indexOfLastFunc = hm.indexOf(buff);
				buff = type + hm.indexOf(buff) + " ";
			}
			if (main != "") main += " ";
			main += buff;
		}
		
		return main;
	}

	private static String makeSimpleFunction() {
		String toDo = "";
		String Result = hm.get(indexOfLastFunc);
		boolean flagtoend = false;
		
		while(!flagtoend) {
			StringTokenizer st = new StringTokenizer(Result, " ");
			int count = st.countTokens();
			flagtoend = true;
			for (int j = 0; j < count; j++) {
				String buff = st.nextToken();
				if (buff.contains("v")) {
					toDo += " v ";
				} else if (buff.contains(type)) {
					flagtoend = false;
					String newstr = buff.substring(1);
					newstr = hm.get(Integer.parseInt(newstr));
					if (newstr.contains("v")) toDo += "!";
					toDo += "( " + newstr + " ) ";
				} else {
					toDo += buff + " ";
				}
			}
			Result = toDo;
			toDo = "";
		}
		
		return Result;
	}

	public static int getBit(int num, int place) {
    	return (num >> place - 1) & 1;
    }
	
	//для И термов
	public static String parseANDTerm(String term) {
		StringTokenizer st = new StringTokenizer(term, " ");
		int count = st.countTokens();
		
		String buff = "";
		if (count == 1) {
			buff = st.nextToken() + " ";
			String lol = buff;
			if (lol.contains("!")) {
				lol = lol.substring(1);
				lol = lol + " v " + lol;
				if (hm.contains(lol)) {
					indexOfLastFunc = hm.indexOf(lol);
					lol = type + hm.indexOf(lol) + " ";
				} else {
					hm.add(lol);
					indexOfLastFunc = hm.indexOf(lol);
					lol = type + hm.indexOf(lol) + " ";
				}
			}
			buff = lol;
			buff += lol;
			buff += lol;
		} else if (count == 2) {
			buff = st.nextToken() + " ";
			if (buff.contains("!")) {
				buff = buff.substring(1);
				buff = buff + " v " + buff;
				if (hm.contains(buff)) {
					indexOfLastFunc = hm.indexOf(buff);
					buff = type + hm.indexOf(buff) + " ";
				} else {
					hm.add(buff);
					indexOfLastFunc = hm.indexOf(buff);
					buff = type + hm.indexOf(buff) + " ";
				}
			}
			String lol = st.nextToken() + " ";
			if (lol.contains("!")) {
				lol = lol.substring(1);
				lol = lol + " v " + lol;
				if (hm.contains(lol)) {
					indexOfLastFunc = hm.indexOf(lol);
					lol = type + hm.indexOf(lol) + " ";
				} else {
					hm.add(lol);
					indexOfLastFunc = hm.indexOf(lol);
					lol = type + hm.indexOf(lol) + " ";
				}
			}
			buff += lol;
			buff += lol;
		} else {
			//три первых символа
			for (int i = 0; i < AND & i < count; i++) {
				String buff2 = st.nextToken();
				if (buff2.contains("!")) {
					buff2 = buff2.substring(1);
					buff2 = buff2 + " v " + buff2;
					if (hm.contains(buff2)) {
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					} else {
						hm.add(buff2);
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					}
				}
				buff += buff2 + " ";
			}
		}
		
		if (hm.contains(buff)) {
			indexOfLastFunc = hm.indexOf(buff);
			buff = type + hm.indexOf(buff) + " ";
		} else {
			hm.add(buff);
			indexOfLastFunc = hm.indexOf(buff);
			buff = type + hm.indexOf(buff) + " ";
		}
		
		String buff2 = ""; 
		int cc = count - AND;
		boolean flag = true;
		for (int i = 0; i < cc; i++) {
			if (flag) {
				buff2 = st.nextToken() + " ";
				if (buff2.contains("!")) {
					buff2 = buff2.substring(1);
					buff2 = buff2 + " v " + buff2;
					if (hm.contains(buff2)) {
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					} else {
						hm.add(buff2);
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					}
				}
				buff += buff2;
				flag = false;
			} else {
				buff2 = st.nextToken();
				if (buff2.contains("!")) {
					buff2 = buff2.substring(1);
					buff2 = buff2 + " v " + buff2;
					if (hm.contains(buff2)) {
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					} else {
						hm.add(buff2);
						indexOfLastFunc = hm.indexOf(buff2);
						buff2 = type + hm.indexOf(buff2) + " ";
					}
				}
				buff += buff2 + " ";
				flag = true;
				if (hm.contains(buff)) {
					indexOfLastFunc = hm.indexOf(buff);
					buff = type + hm.indexOf(buff) + " ";
				} else {
					hm.add(buff);
					indexOfLastFunc = hm.indexOf(buff);
					buff = type + hm.indexOf(buff) + " ";
				}
			}
		}
		if (!flag) {
			if (buff2.contains("!")) {
				buff2 = buff2.substring(1);
				buff2 = buff2 + " v " + buff2;
				if (hm.contains(buff2)) {
					indexOfLastFunc = hm.indexOf(buff2);
					buff2 = type + hm.indexOf(buff2) + " ";
				} else {
					hm.add(buff2);
					indexOfLastFunc = hm.indexOf(buff2);
					buff2 = type + hm.indexOf(buff2) + " ";
				}
			}
			buff += buff2;
			if (hm.contains(buff)) {
				indexOfLastFunc = hm.indexOf(buff);
				buff = type + hm.indexOf(buff) + " ";
			} else {
				hm.add(buff);
				indexOfLastFunc = hm.indexOf(buff);
				buff = type + hm.indexOf(buff) + " ";
			}
		}
		
		return buff;
	}
	
	public static void codess_out() {
		
		for (int i = 0; i < hm.size(); i++) {
			System.out.println(hm.get(i) + " : A" + i);
		}
		System.out.println();
	}
	
	public static void same_func_out() {
		
		for (int i = 0; i < thesame.size(); i++) {
			System.out.print("Same functions: ");
			for (int j = 0; j < thesame.get(i).size(); j++) {
				System.out.print(thesame.get(i).get(j) + ", ");
			}
			System.out.println();
		}
		System.out.println();
	}
	
	public static ArrayList<String> getTerms() { return hm; }
	
}
