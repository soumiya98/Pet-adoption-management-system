<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Registration</title>
        <style>
        body{
        background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/regis.jpg");



background-size: cover;

font: 12px Arial, Tahoma, Georgia, "Times New Roman", Times, serif;

color: #000;

margin-right: 30px ;
       
         
         }
         table,tr, td{
         width:50%;
         margin:auto;
         table-layout:fixed;
         background:black;
         opacity:0.9;
         color:white;
         position:relative;
         margin-right: 30px ;
         }
         tr, td
         {
         opacity=1.5;
         }
         </style>
</head>
    
  <body>
  
           
        <form method="post" action="confirm.jsp">
         
            <table border="4" cellpadding="5" cellspacing="5" align="left" >
                <thead>
                    <tr>
                        <th colspan="2">Register Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><B>Username</B></td>
                        <td><input type="text" name="username"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" required/></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="phone_no" required/></td>
                    </tr>
                   
                        <td colspan="2" align="center"><input type="submit" value=SUBMIT />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            
  
        </form>
    </body>
    <%
    String msg = (String)session.getAttribute("error");
if (msg != null) {
	%>
	

	<table align="left" >
    <td> <p style="color:red"><%= msg %></p></td>
    </table>


    <%
    msg=null;
    		
}
  %>  
</html>
