

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function ConfirmDelete()
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
      return true;
  else
    return false;
}
</script>
<style>
 body{
    /*   background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr9pKrQ6MTXaewApvRVdpNaqOPczwjhYFVpe69T7ctuUBzZY5XfA")center fixed no-repeat ;*/
background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/background.jpg");


background-attachment: fixed;

background-position: center;





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
<center>
<h1 style="color:green"><B>SELECT THE PET TO BE DELETED</B></h1>
</center>
<form action="login.jsp" method="post">
<button  class="button button2">Log Out</button>
</form>
<%
try
{
	 Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  );
     Cookie c[]=request.getCookies();
     String user=c[0].getValue();
    // out.println(user);
     PreparedStatement pst1=conn.prepareStatement("select user_id from registratio where username=?");
     pst1.setString(1,user);
     int uid=0;
     ResultSet rs1 = pst1.executeQuery();     
     
     if(rs1.next())   
     {
     	uid=rs1.getInt(1) ;
     	}
     
     
     PreparedStatement pst4=conn.prepareStatement("select * from adoption where userid=? ");
    pst4.setInt(1,uid);
     
     ResultSet rs4 = pst4.executeQuery();     
     String str;
     %>
     <table>
     <tr>
     <% 
     String uidr;
     while(rs4.next())   
     {
     	String im=rs4.getString(8);
     	float cos=rs4.getFloat(7);
     	int ag=rs4.getInt(5);
     	im = im.replace('\\' , '/');
     	 uidr=rs4.getString(11);
     	
     //	out.println(im);
     	%>
     	<td>
     <form action="delete.jsp" method="post">	
     	
<td><button Onclick="return ConfirmDelete();" type="submit" name="pic" value="<%=uidr%>"><img src="<%= im %>" alt="Submit"  width="300" height="350"></button><p>Cost=<%=cos %><br></p><p>Age=<%=ag %> months<br></p></td>

</form>
	<% 
}
     
     %>
     </tr>
     </table>
     <% 
}catch(Exception e ){
	e.printStackTrace();
	response.sendRedirect("error.jsp");	 
}





%>
</body>
</html>