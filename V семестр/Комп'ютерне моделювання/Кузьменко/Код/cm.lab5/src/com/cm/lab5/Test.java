package com.cm.lab5;

// TODO: Auto-generated Javadoc
/**
 * The Class Test.
 */
public class Test {

	/**
	 * The main method.
	 *
	 * @param args the arguments
	 */
	public static void main(String[] args) {
		int [][] testmas = {
				//   0 1 2 3 4 5 6 7 8
			/**0*/	{0,5,0,0,0,0,0,0,0},
			/**1*/	{0,0,2,0,3,0,0,0,0},
			/**2*/	{0,0,0,0,0,7,0,0,0},
			/**3*/	{5,0,0,0,4,0,0,0,0},
			/**4*/	{0,0,0,0,0,3,0,2,0},
			/**5*/	{0,0,0,0,0,0,0,0,4},
			/**6*/	{0,0,0,2,0,0,0,5,0},
			/**7*/	{0,0,0,0,0,0,0,0,3},
			/**8*/	{0,0,0,0,0,0,0,0,0}
				};
		GraphUtil util = new GraphUtil(testmas,0,8);
		util.buildGraf();
		util.calcPricesNodes();
		
		System.out.println("\nGraf");
		
		util.printGraph();
		util.calcReturnTrack();

	}

}
