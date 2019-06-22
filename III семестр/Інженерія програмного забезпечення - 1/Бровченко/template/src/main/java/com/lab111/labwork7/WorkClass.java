package com.lab111.labwork7;

/**
 * Only workclass.
 *
 * @author Anastasia Brovchenko
 */
public class WorkClass {
    public static void main(String[] args) {

        //create receiver
        UserSidePart usp= new UserSidePart();

        //create different commands
        Command getOK= new GetAllOk(usp);
        Command request= new GetRequest(usp);

        //create invoker
        Database db= new Database(getOK, request);

        //lets play !
        db.doFirstCommand();
        db.doSecondCommand();

    }
}
