package kpi.teorver.lab_1;

public class Lab1 {

	public static final int LENGTH = 10000;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int sequence[] = ConGenerator.random(LENGTH);
		GeneratorTests.Test1(sequence);
		GeneratorTests.Test2(sequence);
		GeneratorTests.Test3(sequence, 3);
		GeneratorTests.Test4(sequence);
	}
}
