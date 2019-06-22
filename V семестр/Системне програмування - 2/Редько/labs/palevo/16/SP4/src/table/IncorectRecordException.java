package table;

public class IncorectRecordException extends Exception{
    public void printStackTrace(){
        System.out.println("Exception in calling method with incorect record");
        super.printStackTrace();
    }
}
