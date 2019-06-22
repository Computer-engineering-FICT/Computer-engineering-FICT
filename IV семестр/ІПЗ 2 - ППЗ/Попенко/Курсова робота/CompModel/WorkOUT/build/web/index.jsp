<%-- 
    Document   : index
    Created on : Mar 23, 2015, 11:58:03 AM
    Author     : Rus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="pack.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert in table Profile</h1>
        <%
            Connect connect=new Connect ();   
        %>
        <form action="index.jsp" method="POST">
            <br>ProfileID= <input type="text" name="ID"/></br>           
            <br>Name <input type="text" name="name" /></br>
            <br>Photo <input type="text" name="photo" /></br>
            <br>e-mail <input type="text" name="e-mail" /></br>
            <br>Contacts <input type="text" name="contacts"/></br>
            <br>UserCat=<input type="text" name="UsCat"/></br>
            <br><input type="submit" value="insert" name="ins"></input></br>
            <%
            if (request.getParameter("ins")!=null){
             int ProfileID=0, UsersCategID=0;
            String name, photo, eMail, contacts; 
            try {
            ProfileID=Integer.parseInt(request.getParameter("ID"));
            name=request.getParameter("name");
            photo=request.getParameter("photo");
            eMail=request.getParameter("e-mail");
            contacts=request.getParameter("contacts");
            UsersCategID=Integer.parseInt(request.getParameter("UsCat"));
            JOptionPane.showMessageDialog(null, "Done");
            String query = "insert into `compDB`.`profile`(`profileID`, `name`, `photo`, `eMail`, `contacts`, `usersCategID`) "
                    + "VALUES ('"+ProfileID+"',"
                    + "'"+name+"',"
                    + "'"+photo+"',"
                    + "'"+eMail+"',"
                    + "'"+contacts+"',"
                    + "'"+UsersCategID+"')";
            connect.update(query);
            } catch (Exception e2){
                JOptionPane.showMessageDialog(null, "NotDone");
            }
            }
            %>
            
        </form>    
        <form action="profile.jsp" method="POST">  
            <br><input type="submit" value="SeeTable" name="SeeTable" /></br>
        </form>    
        
        
    </body>
</html>
