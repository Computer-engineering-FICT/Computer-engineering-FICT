package tree;

public class IncorectNodeException  extends Exception {
    public void printStackTrace(){
        System.out.println("Exception Incorect node");
        super.printStackTrace();
    }
}
