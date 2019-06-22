package LexicalScaner;

public class IncorectLexicalAnalizatorException extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect lexical analizator");
        super.printStackTrace();
    }
}