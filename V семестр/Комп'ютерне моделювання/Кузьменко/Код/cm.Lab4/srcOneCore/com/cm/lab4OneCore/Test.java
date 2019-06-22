package com.cm.lab4OneCore;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long startTime = System.currentTimeMillis();
		Graf g = new Graf();
		g.config();
		g.buildTree();
		g.calcPropability(g.buildBalansSystem(g.buildDuskrGraf(g.buildUnceasingGraf(), 0.1)));
		g.calcLoadingDevice();
		long timeSpent = System.currentTimeMillis() - startTime;
		System.out.println("программа выполнялась " + timeSpent + " миллисекунд");
	}

}
