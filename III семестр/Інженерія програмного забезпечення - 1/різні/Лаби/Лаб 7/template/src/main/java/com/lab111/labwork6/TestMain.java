package com.lab111.labwork6;
/**
 * Test class
 * @author Nightingale
 *
 */
public class TestMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	
		MyHandler b[]=new MyHandler[3];
		/**
		 * create an array of components
		 */
		b[0]=new Button_Leaf();
		b[0].SetHelp("First Button");
		b[1]=new Button_Leaf();
		/**
		 * create one more array of components
		 */
		MyHandler b1[]=new MyHandler[1];
		b1[0]=new Button_Leaf();
		b[2]=new Panel_Component(b1);
		b[2].SetHelp("First Pannel");
		/**
		 * Creating the main panel
		 */
		Panel_Component p=new Panel_Component(b);
		p.SetHelp("Help in the main panel");
		System.out.println("Leading to the main panel");
		p.Focuse();
		System.out.println("Focus all the components belonging to it");
		p.HandleDown();
		System.out.println("Obtain a certificate suggestive for the 2nd button (for it help is not given)");
		b[2].HandleUp();
		/**
		 * when we lead to the component - everything else is also focusing
		 */
		System.out.println("When floods, in any components, all is focusing");
		b[1].TotalFocus();
	}

}
