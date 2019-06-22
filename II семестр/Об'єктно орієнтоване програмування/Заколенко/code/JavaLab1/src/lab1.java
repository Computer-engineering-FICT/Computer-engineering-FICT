public class lab1 {

	public static void main(String[] args) {
		double S = 0;
		char a = 1;
		char b = 1;
		char n = 3;
		char m = 3;
		for (char i = a; i <= n; i++) {
			for (char j = b; j <= m; j++) {
				S = ((double) i + j) / (i + 2) + S;
			}
		}
		System.out.println("S=" + S);
		String j="";
		System.out.println(j.isEmpty());
	}
}
