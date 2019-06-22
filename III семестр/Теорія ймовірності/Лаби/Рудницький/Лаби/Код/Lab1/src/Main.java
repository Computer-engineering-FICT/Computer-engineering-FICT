import java.util.ArrayList;

public class Main {
	public static void main(String[] args) {
		int[] vyborka = new int [20000]; 
		int[] pol1 = {1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0};
		int[] pol2 = {1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0};
		int[] pol3 = {1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0};
		int[] pol4 = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0};
		int[] pol5 = {1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0};
		int[] pol6 = {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1};
		ArrayList<LFSR> lfsr = new ArrayList<LFSR>();
		lfsr.add(0, new LFSR(pol1));
		lfsr.add(1, new LFSR(pol2));
		lfsr.add(2, new LFSR(pol3));
		lfsr.add(3, new LFSR(pol4));
		lfsr.add(4, new LFSR(pol5));
		lfsr.add(5, new LFSR(pol6));
		Generator generator = new Generator();
		int s;
		for (int i = 0; i < vyborka.length; i++) {
			s = generator.generate(lfsr);
		    vyborka[i] = s;
			System.out.print(s + ".");
		}
		System.out.println("");
		System.out.println("Tests: ");
		System.out.println("1. Frequancy: " + GeneratorTester.frequancyTest(vyborka));
		System.out.println("2. XOR: " + GeneratorTester.xorFrequancyTest(vyborka));
		int[] ranks = GeneratorTester.rankTest(vyborka, 3);
		System.out.println("3. Rank: ");
		for (int i = 0; i < ranks.length; i++) {
			System.out.println((double)ranks[i]/vyborka.length);
		}
		System.out.println("4. Complexity: ");		
		GeneratorTester.complexityTest(vyborka);
	}
}
