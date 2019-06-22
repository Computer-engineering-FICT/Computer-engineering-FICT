package lab111.labwork7;

/**
 * @author Error_404
 * @version 13.10.2014
 * Realize Command design pattern. This is the concrete Command part,
 * which implements Command interface. Command which say "OK".
 */
public class GetAllOk implements Command {

    /**
     * Object, which method we will use in this command.
     */
    UserSidePart userSidePart;

    /**
     * Simple constructor
     * @param userSidePart Object, which method we will use in this command.
     */
    GetAllOk(UserSidePart userSidePart){
        this.userSidePart= userSidePart;
    }

    @Override
    public void doSmth() {
        userSidePart.sayOK();
    }
}
