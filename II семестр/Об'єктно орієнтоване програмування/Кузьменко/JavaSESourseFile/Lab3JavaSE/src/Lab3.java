public class Lab3 {
	
	public static void main(String[] args) {
		String t = "";
		String sr = new String("");
		System.out.println(sr);
		StringBuilder sb = new StringBuilder (sr.trim());
		if (!(sb.substring(0).trim().equals(t))) {//перевірка на пусту строку
			String str = " ";
			String buf = new String();
			String word1 = new String();
			String word2 = new String();
			sb.insert(sb.length(), " ");
			
			//видалення знаків пунктуації
			for (int i = 0; i < sb.length(); i++) {
				if (sb.substring(i, i+1).equals("-")){
					if((i-1==-1)&(sb.substring(0,i+2).equals("- "))) sb.delete(0, i+2);
					else if((sb.substring(sb.length()-3, sb.length()-1).equals(" -"))) sb.delete(sb.length()-3, sb.length()-1);
					else if ((sb.substring(i-1, i+2)).equals(" - ")) sb.delete(i-1, i+2);
				}
				if((sb.substring(i, i+1).equals("!"))|(sb.substring(i, i+1).equals("?"))|(sb.substring(i, i+1).equals("."))|(sb.substring(i, i+1).equals(";"))
						|(sb.substring(i, i+1).equals(":"))|(sb.substring(i, i+1).equals(","))){
					sb.delete(i, i+1);
				}
				
			}
			char tab = ' ';
			int n = 0;
			
			//пошук кількості слів у тексті
			for (int k1 = 0; k1 < sb.length(); k1++) {
				if (sb.charAt(k1) == tab)
					n++;
			}
			int nlet1;
			int nlet2;
			int i = 0;
			
			//сортування бульбашкою
			for (int j2 = 0; j2 < n - 1; j2++) {
				i = 0;
				for (int i2 = 1; i2 < (n - j2); i2++) {
					word1 = (sb.substring(i, sb.indexOf(str, i)))
							.trim();//і-те слово
					nlet1 = find(word1);
					word2 =(sb.substring(word1.length() + i,
							sb.indexOf(str, word1.length() + i + 1))).trim();
					nlet2 = find(word2);//і+1 слово
					if (nlet1 > nlet2) {
						buf = word1;
						sb.replace(i, word1.length() + i, word2);
						i += word2.length() + 1;
						sb.replace(i, i + word2.length(), buf);
					} else
						i = sb.indexOf(str, i) + 1;
				}
			}
			System.out.println(sb);
		} else
			System.out.println("строка пуста");
	}

	public static int find(String s) {
		int k = 0;
	//	char word [] = new char [s.length()];
		s = s.toLowerCase();
		for (int i = 0; i < s.length(); i++) {
			if ((s.charAt(i)=='a')|(s.charAt(i)=='e')|(s.charAt(i)=='y')|(s.charAt(i)=='u')|(s.charAt(i)=='o')|(s.charAt(i)=='i'))
				k++;
		}
		return k;
	}	
}
