package table;

public class IncorectPatern extends Exception{
    public void printStackTrace(){
        System.out.println("Exception in calling method with incorect patern");
        super.printStackTrace();
    }
}
