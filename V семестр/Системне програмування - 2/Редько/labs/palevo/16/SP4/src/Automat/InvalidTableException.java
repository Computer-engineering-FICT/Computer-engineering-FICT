package Automat;

public class InvalidTableException  extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect table");
        super.printStackTrace();
    }
}