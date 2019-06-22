public class Lab5 {

	public static void main(String[] args) {
		double[][] mas = { {0,5,0}, {0,0,1}, {1,0,0}};
		TeoteticalCalc calc = new TeoteticalCalc(mas);
		ExperimentCalc experimentCalc = new ExperimentCalc(mas);
	}

}
