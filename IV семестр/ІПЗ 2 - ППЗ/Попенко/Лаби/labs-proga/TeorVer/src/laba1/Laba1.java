/**
 * 
 */
package laba1;

/**
 * @author Ruslan Popenko
 *
 */
public class Laba1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
        TestSequence test = new TestSequence();
		System.out.println("Частотний тест");
		System.out.println(test.Test1());
		
		System.out.println("Диференціальний тест");
		System.out.println(test.Test2());
		test.Test3(3);
		System.out.println("Нелінійна складність");
	    
	    
	    System.out.println(test.Test4());
		

	}

}
