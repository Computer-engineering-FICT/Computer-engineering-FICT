package LexicalScaner;

public class InvalidLine extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect line");
        super.printStackTrace();
    }
}
