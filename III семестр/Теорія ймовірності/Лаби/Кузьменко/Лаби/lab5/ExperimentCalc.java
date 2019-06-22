public class ExperimentCalc {
	private int n;

	public ExperimentCalc(double mas[][]) {
		n = mas.length;
		double T = 0;
		double[] stateTime = new double[n];
		int state = 0;
		double bufTimeState = 0;
		double timeState;
		int nextstate = 0;
		double z=0;
		for (int u = 0; u < 1000; u++) {
			timeState = Double.MAX_VALUE;
			for (int i = 0; i < mas[nextstate].length; i++) {
				if (mas[nextstate][i] != 0) {
					bufTimeState = -Math.log(Math.random()) / mas[nextstate][i];
					if (timeState > bufTimeState) {
						timeState = bufTimeState;
						state = i;
					}
				}
			}
			
			stateTime[nextstate] = stateTime[nextstate] + timeState;
			nextstate = state;
			T += timeState;
		}
		System.out.println("≈кспериментальний розрахунок");
		for (int i = 0; i < stateTime.length; i++) {
			System.out.printf("p" + (i + 1) + " = " + "%5.4f",
					(stateTime[i] / T));
			System.out.println();
		}

	}

}
