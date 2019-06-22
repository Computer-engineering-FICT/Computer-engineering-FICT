package LexicalScaner;

public class IncorectAnalizeException extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect data then analize is failed");
        super.printStackTrace();
    }
}
