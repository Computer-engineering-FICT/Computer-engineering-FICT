package Automat;

public class IncorectFileException extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect data int file");
        super.printStackTrace();
    }
}
