<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*"
%>
<%@ page import ="java.util.*"
%>
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
     position:absolute;
    right:30px;
    top:160px;
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
    top:80px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
.place
{

   position:absolute;
    right:30px;
    top:100px;
    

}
</style>

</head>
<body>

<%
try
{
	
	 String id=request.getParameter("pic");
	    System.out.println(id);
	    Cookie c=new Cookie("myC",id);
	    response.addCookie(c);
	    float cost=0;
	    String image=" ";
	    String name=" ";
	    float admincost=0;
	    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  );  
	    int mid=0;
        PreparedStatement pst3=conn.prepareStatement("select * from adoption where name=?");
	    pst3.setString(1,id);
	   ResultSet rs=pst3.executeQuery();
	   while (rs.next())
	   {
		   mid=rs.getInt(9);
		   
		   
	   }
	    PreparedStatement pst1=conn.prepareStatement("delete from adoption where name=?");
	    pst1.setString(1,id);
	    
	  pst1.executeUpdate();
	  
	  PreparedStatement pst6=conn.prepareStatement("delete from medical where mid=?");
	    pst6.setInt(1,mid);
	    
	  pst6.executeUpdate();
	%>
	<table align="right">
<td><h1 style="color:green"><B> DATA HAS BEEN DELETED</B></h1></td>
</table> 


<form action="admin.jsp" method="post">
<button  class="button button2">GO BACK</button>
</form>

<% 




}



catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("error.jsp");	 
}



%>

</body>
</html>