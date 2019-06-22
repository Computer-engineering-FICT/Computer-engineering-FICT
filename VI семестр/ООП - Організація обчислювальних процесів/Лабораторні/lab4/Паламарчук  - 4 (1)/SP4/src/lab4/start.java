package lab4;

import java.util.ArrayList;

public class start {
	static mFrame f;

	public static void main(String[] args) {
		run(10);
	}

	start(int index) {
		run(index);
	}

	public static void run(int size) {
		f = new mFrame();
		matrBuilder m = new matrBuilder(size);
		m.run();
		ArrayList<Double> percent = m.getPercent();
		ArrayList<Double> probability = m.getProbability();
		f.addChart(percent, probability, "N = " + size, "Proc (%)", "Prob");
		f.setVisible(true);
	}
}
