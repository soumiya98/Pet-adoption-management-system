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
</head>
<body>
<style>
        body{
       /*background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr9pKrQ6MTXaewApvRVdpNaqOPczwjhYFVpe69T7ctuUBzZY5XfA")center fixed no-repeat ;*/

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

<%
String msg = (String)session.getAttribute("req");
if (msg != null) {
	%>
	

	<table align="left" >
   <td> <h1 style="color:green"><%= msg %></h1></td>
   </table>


   <%
   msg=null;
}


%>

<h1 style="color:green"><br><br><br><B>ANIMALS AVAILABLE FOR ADOPTION</B><br><br></h1><B><h2 style="color:green">CLICK ON THE PICTURES TO VIEW DETAILS</B><br><br><br></h2>
<form action="login.jsp" method="post">
<button  class="button button2">Log Out</button>
</form>

<% 
try
{
	  Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  );  
      PreparedStatement pst4=conn.prepareStatement("select * from adoption  ");
     
      
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
      	
      	//out.println(im);
      	%>
      	
    
      	<td>
      	
      	<form action="details.jsp" method="post">
<td><button type="submit" name="pic" value="<%=uidr%>"><img src="<%= im %>" alt="Submit"  width="300" height="350"></button><p>Cost=<%=cos %><br></p><p>Age=<%=ag %> months<br></p></td>

</form>
      	 
      	 
      	  
      	  </td>
      	  
      	  <% 
      	  
      	  
      	}
      %>
      </table>
      
	<% 
	
	
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("error.jsp");	 
}

	%>


</body>
</html>