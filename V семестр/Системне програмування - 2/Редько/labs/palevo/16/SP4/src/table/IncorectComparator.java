package table;

public class IncorectComparator extends Exception {
    public void printStackTrace(){
        System.out.println("Exception in calling method with incorect comparatorn");
        super.printStackTrace();
    }
}
