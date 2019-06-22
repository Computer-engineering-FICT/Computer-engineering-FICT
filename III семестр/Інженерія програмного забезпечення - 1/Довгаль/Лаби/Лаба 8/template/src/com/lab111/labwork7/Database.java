package lab111.labwork7;

/**
 * @author Error_404
 * @version 13.10.2014
 * Realize Command design pattern. This is the Invoker part.
 */
public class Database {

    //two commands for later work
    private Command command1;
    private Command command2;

    Database(Command command1, Command command2){
        this.command1= command1;
        this.command2= command2;
    }

    /**
     * Do action in Command command1
     */
    public void doFirstCommand(){
        command1.doSmth();
    }

    /**
     * Do action in Command command2
     */
    public void doSecondCommand(){
        command2.doSmth();
    }

}
