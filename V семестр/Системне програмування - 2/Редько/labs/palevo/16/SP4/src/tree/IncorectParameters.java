package tree;

public class IncorectParameters extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect parametrs");
        super.printStackTrace();
    }
}
