
public class Lab31 {
	// назвати проект "Test"
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer("Text messaging. " + "electronic. "
				+ "The term originally. "
				+ "and sound content known as MMS messages... " + "of a. "
				+ "has different colloquialisms depending on the region?");
		
		System.out.println(sb);
		String str = new String(" ");
		if (!(sb.substring(0).trim().equals(str.trim()))) {
		String str1 = new String("!");
		String str2 = new String("?");
		String str3 = new String(".");
		String str4 = new String ("...");
		int j = 0;
		int k = 0;
		int i;
		// пошук кількості речень
		for (i = 0; i < sb.length(); i++) {
			if ((sb.substring(i, i+1).equals(str1))|(sb.substring(i, i+1).equals(str2))|(sb.substring(i, i+1).equals(str3))) {
				k++;
				if (i+2<sb.length())
					if (sb.substring(i+1, i+2).equals(str3))
					k--;
			} else {

			}
		}
		String text[] = new String[k];
		String sentence1 = new String();
		i = 0;
		// запис кожного речення в масив
		int l2=0;boolean q;
		for (int l = 0; l < k; l++) {
			//початок пошуку
			q=true;
			l2=i;
			do {
				if ((sb.substring(l2, l2+1).equals(str1))|(sb.substring(l2, l2+1).equals(str2))|
						(sb.substring(l2, l2+1).equals(str3))) {
					q=false;
					if((l2+3<sb.length())&&(sb.substring(l2, l2+3).equals(str4)))
							l2=l2+2;
					else{}
				} else {
					l2++;
				}
				
			} while (q);
			//кінець пошуку
			sentence1 = sb.substring(i, l2+1);
			
			i = i + sentence1.length() + 1;
			text[l] = sentence1;	
		}
		for (int l = 0; l < k; l++) {
			System.out.println(text[l]);
		}
		
		}
		else System.out.println("строка пуста");
	}

	
}
