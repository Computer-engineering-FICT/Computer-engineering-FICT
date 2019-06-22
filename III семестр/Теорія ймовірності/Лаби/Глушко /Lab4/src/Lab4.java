
public class Lab4 {

	public static double values[] = { };
	public static int INTERVALS = 3;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Pearson pearson = new Pearson4SimpsonDistribution();

		System.out.print("Simpson distribution probability is ");
		System.out.println(pearson.getPearsonProbability(values, INTERVALS));
	}

}
