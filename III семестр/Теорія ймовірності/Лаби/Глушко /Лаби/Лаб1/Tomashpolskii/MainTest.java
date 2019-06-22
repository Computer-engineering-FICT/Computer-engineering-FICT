package com.teorver.lab_1;

public class MainTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int n = 60000;
		int res[] = ConGenerator.random(n);
		Tester.Test1(res);
		Tester.Test2(res);
		Tester.Test3(res,3);
		Tester.Test4(res);
	}
}
