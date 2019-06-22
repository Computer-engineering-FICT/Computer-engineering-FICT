/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.sql.ResultSet;

/**
 *
 * @author Rus
 */
public class test {
    public static void main(String[] args) {
        Connect con=new Connect();
        String query = "insert into `compDB`.`profile`(`profileID`, `name`, `photo`, `eMail`, `contacts`, `usersCategID`) "
                    + "VALUES ('"+5+"',"
                    + "'"+"vas"+"',"
                    + "'"+"wdwddq"+"',"
                    + "'"+"efwqdfqw"+"',"
                    + "'"+"wdwqdwq"+"',"
                    + "'"+"2"+"')";
        ResultSet rs=con.getRS(query);
    }
    
}
