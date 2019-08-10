<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}

li a {
    display: block;
    color: green;
    padding: 8px 16px;
    text-decoration: none;
    
}

/* Change the link color on hover */
li a:hover {
    background-color: #555;
    color: white;
}
body {



 background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/sellbuy.jpg");


background-attachment: fixed;

background-position: top left;

-webkit-background-size: cover;

-moz-background-size: cover;

-o-background-size: cover;

background-size: cover;

font: 12px Arial, Tahoma, Georgia, "Times New Roman", Times, serif;

color: #000;

margin-right: 30px ;

}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    position:absolute;
    right:30px;
    top:50px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}



</style>
</head>
<body>
<%
try
{
String country = request.getParameter("country") ;
String state = request.getParameter("state") ;
String city = request.getParameter("city") ;
String area = request.getParameter("area") ;
String pincode = request.getParameter("pincode") ;

Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root" );  
PreparedStatement pst2 = con.prepareStatement("select user_id from registratio where username=?");
Cookie c[]=request.getCookies();
String username=c[0].getValue();
pst2.setString(1, username);

int key=0;
ResultSet rs=pst2.executeQuery();
if(rs.next())
{

key=rs.getInt(1);

}

PreparedStatement pst1 =(PreparedStatement) con.prepareStatement("insert into address(user_id,country,state,city,area,pincode)values( ?, ?, ?, ?, ?, ?)");

pst1.setInt(1, key);
pst1.setString(2, country);
pst1.setString(3, state);
pst1.setString(4, city);
pst1.setString(5, area);
pst1.setString(6, pincode);

int updateQuery1 = pst1.executeUpdate();

%>
<table >
<td><h1 style="color:green"><B>YOUR REGISTRATION IS COMPLETE!!</B></h1></td>
</table>

<h2>Login as</h2>

<ul>
<li><a href="sell.jsp">Seller</a></li>
<li><a href="buy.jsp">Buyer</a></li>


</ul>
<form action="login.jsp" method="post">
<button  class="button button2">Log Out</button>
</form>
<% 
}catch(Exception e){     

    System.out.println("Something went wrong !! Please try again");     
    e.printStackTrace();	
    response.sendRedirect("error.jsp");	 
}   
%>
</body>
</html>
