import java.util.Random;

public class MarkovProcess {
	private double eps = 0.001;
	private Random random;
	private int countState;
	private int currentState;
	private double[][] g;
	public double[] timeState;
	public double timeSystem;

	public MarkovProcess(double[][] g, int startState) {
		this.g = g;
		random = new Random();
		countState = g.length;
		timeState = new double[countState];
		currentState = startState;
		timeSystem = 0;
	}

	/**
	 * переход в следуеще состояние
	 * 
	 * @throws StopException
	 */
	public void next() throws StopException {
		double[] nextTimeState = new double[countState];
		for (int i = 0; i < nextTimeState.length; i++) {
			if (g[currentState][i] > eps)
				nextTimeState[i] = -Math.log(random.nextDouble())/g[currentState][i];		
			else
				nextTimeState[i] = Double.MAX_VALUE;
		}
		double minTime = Double.MAX_VALUE;
		int minIndex = -1;
		for (int i = 0; i < nextTimeState.length; i++) {
			if (nextTimeState[i] < minTime) {
				minTime = nextTimeState[i];
				minIndex = i;
			}
		}
		//если зашли в тупик
		if (minIndex == -1) {
			finalState(currentState);
			throw new StopException();
		}
		timeState[currentState] += minTime;
		timeSystem += minTime;
		currentState = minIndex;
	}
	private void finalState(int state){
		for (int i = 0; i < timeState.length; i++) {
			timeState[i]=0;
		}
		timeState[state]=timeSystem;
	}

	public double[] pState() {
		double[] result = new double[countState];
		if (timeSystem < 0.001)
			result[currentState] = 1;
		else {
			for (int i = 0; i < result.length; i++) {
				result[i] = timeState[i] / timeSystem;
			}
		}
		return result;
	}

}
