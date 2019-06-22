package table;

public class IncorectEnumerationValue extends Exception{
    public void printStackTrace(){
        System.out.println("Exception in calling method with incorect enumration");
        super.printStackTrace();
    }
}
