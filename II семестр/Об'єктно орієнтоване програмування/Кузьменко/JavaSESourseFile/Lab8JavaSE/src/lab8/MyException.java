package lab8;
/**
 * ��� �������� �������� v2.0
 * @author Lenovo
 *
 */
public class MyException extends Exception {
	public MyException() {
		System.out.println("����� ��������� �������");
	}
	public MyException(String t){	
	}
	@Override
	public void printStackTrace() {
		super.printStackTrace();
	}


	
}
