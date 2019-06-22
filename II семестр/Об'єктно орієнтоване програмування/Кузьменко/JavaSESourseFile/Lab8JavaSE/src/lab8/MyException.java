package lab8;
/**
 * моя виключна ситуація v2.0
 * @author Lenovo
 *
 */
public class MyException extends Exception {
	public MyException() {
		System.out.println("Невірні параметри амуніції");
	}
	public MyException(String t){	
	}
	@Override
	public void printStackTrace() {
		super.printStackTrace();
	}


	
}
