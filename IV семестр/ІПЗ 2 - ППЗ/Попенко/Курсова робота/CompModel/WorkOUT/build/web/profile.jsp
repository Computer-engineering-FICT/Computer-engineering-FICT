<%-- 
    Document   : profile
    Created on : Mar 23, 2015, 6:04:49 PM
    Author     : Rus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pack.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <h1>Profile Table</h1>
        <%
            Connect connect=new Connect();
            String query = "select*from profile";
            ResultSet rs=connect.getRS(query);            
        %>
        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
                <TH>Name</TH>
                <TH>Photo</TH>
                <TH>E-mail</TH>
                 <TH>Contacts</TH>
                <TH>UserCatID</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getInt(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                <TD> <%= rs.getInt(6) %></TD>
            </TR>
            <% } %>
        </TABLE>
        
    </body>
</html>
