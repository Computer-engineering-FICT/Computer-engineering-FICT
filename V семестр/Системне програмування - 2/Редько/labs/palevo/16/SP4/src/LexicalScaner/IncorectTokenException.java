package LexicalScaner;

public class IncorectTokenException  extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect token");
        super.printStackTrace();
    }
}
