import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class LabDM3 {

	public static void main(String[] args) {
		String word=null;
		Scanner sc = new Scanner(System.in);
		System.out.println("Введення з клавіатури - 1");
		System.out.println("Введення з файла - 2");
		boolean q = true;
		int k=0;
		do {
			int h = sc.nextInt();
			switch (h) {
			case 1:
				System.out.println("Введіть слово");
				word=sc.nextLine();
				System.out.println("Генерація сполучень з <"+ word.length()+"> по k у лексикографічному порядку. Введіть k");
				k=sc.nextInt();
				q = false;
				break;
			case 2:
				try {
					FileReader fr = new FileReader("C:\\Users\\Lenovo\\Desktop\\word.txt");
					BufferedReader br = new BufferedReader(fr);
					k=Integer.parseInt(br.readLine());
					word=br.readLine();
					System.out.println("Генерація сполучень з n="+ word.length()+" по k="+k+" у лексикографічному порядку");
					System.out.println(word);
					fr.close();
					}catch (IOException e1) {
						e1.printStackTrace();
					}
				q = false;
				break;
			default:
				word="";
				q = true;
				System.out.println("input again");
				break;
			}
		} while (q);
		if (word!=null){
		char[] ch = word.toCharArray();
		ch = delateDoubleWord(ch);
		ch = sortWord(ch);
		int n = ch.length;
		
		int i;
		int a[] = new int[k + 1];
		for (i = 1; i <= k; i++) {
			a[i] = i;
		}
		int p = k;
		while (p >= 1) {
			for (int j = 1; j <= a.length - 1; j++) {
				System.out.print(ch[a[j]-1] );
			}
			if (a[k] == n)
				p--;
			else
				p = k;
			if (p >= 1)
				for (i = k; i >= p; i--)
					a[i] = a[p] + i - p + 1;
			System.out.println();
		}
		}
	}

	private static void swap(char[] ch, int i, int j) {
		char buf = ch[i];
		ch[i] = ch[j];
		ch[j] = buf;
	}

	public static char[] sortWord(char[] ch) {
		for (int i = ch.length - 1; i > 0; i--) {
			for (int j = 0; j < i; j++) {
				if (ch[j] > ch[j + 1]) {
					swap(ch, j, j + 1);
				}

			}
		}
		return ch;
	}

	public static char[] delateDoubleWord(char[] ch) {
		int charcounter = 0;
		String str = new String(String.valueOf(ch));
		StringBuffer sb = new StringBuffer(str);
		for (int i = 0; i < sb.length(); i++) {
			charcounter = 0;
			for (int j = 0; j < sb.length(); j++) {
				if (sb.charAt(i) == sb.charAt(j)) {
					charcounter++;
					if (charcounter >= 2) {
						sb.deleteCharAt(j);
					}
				}
			}
		}
		char[] ch_new = new char[sb.length()];
		sb.getChars(0, sb.length(), ch_new, 0);
		return ch_new;
	}
}