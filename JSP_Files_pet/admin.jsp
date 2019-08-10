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

        body{
    /*   background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrP0Z4uBtgL8cMPuFXDN0BkSXjIxEKXbe14r-DClEEFqcgl4gd")center fixed no-repeat ;*/


background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/background2.jpg");


background-attachment: fixed;

background-position: center;




background-size: cover;

font: 12px Arial, Tahoma, Georgia, "Times New Roman", Times, serif;

color: #000;

margin-right: 30px ;
       
         
         }
p.cursive {
    font-family: Comic Sans, Comic Sans MS, cursive;
    font-size:14px;
}

.text-block1 {
    position: absolute;
    bottom: 30px;
    left: 10px;
    background-color: white;
    color: black;
    padding-left: 10px;
    padding-right: 10px;
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
    top:30px;
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
<h1 style="color:green"><B>WELCOME ADMIN!!!</B></h1>
</center>
<h2 style="color:green"><br><br><B>ANIMALS AVAILABLE FOR ADOPTION</B><br><br></h2><B><h2 style="color:green">CLICK ON THE PICTURES TO VIEW DETAILS</B><br><br><br></h2>

<form action="login.jsp" method="post">
<button  class="button button2">LOG OUT</button>
</form>
<% 

try
{
	  Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  ); 
	  
     String query="{call login (?, ?, ?)}";
     CallableStatement cstmt = conn.prepareCall(query) ; 
          
         cstmt.registerOutParameter(1, java.sql.Types.FLOAT); 

         cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);  

         cstmt.registerOutParameter(3, java.sql.Types.INTEGER);  
        ResultSet rs4= cstmt.executeQuery();  
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
      	
      	<form action="details1.jsp" method="post">
<td><button type="submit" name="pic" value="<%=uidr%>"><img src="<%= im %>" alt="Submit"  width="300" height="350"></button><p>Cost=<%=cos %><br></p><p>Age=<%=ag %> months<br></p></td>


</form>
      	 
      	 
      	  
      	  </td>
      	  
      	  <% 
      	  
      	  
      	}
      %>
      </table>
      
	<% 
	
	 PreparedStatement pst3=conn.prepareStatement("select * from profile");
   float cost=0;
   String image=" ";
   String name=" ";
   float admincost=0;
   ResultSet rs=pst3.executeQuery();
  %>
   <p class="cursive">
	
	<tr><td><h1 style="color:green"><B>ADMIN MONITORING</B></td></tr></h1>
<% 
   while (rs.next())
   {
	   cost=rs.getFloat(3);
	   image=rs.getString(2);
	   name=rs.getString(4);
	   admincost=rs.getFloat(5);
	   
	   %>
		
	<table align="left">
		
		
		<tr><td><B><img src="<%= image %>" alt="Submit"  width="300" height="350"></B></tr></tr>
		<tr><td><B>Cost=<%=cost %></B></td></tr>
			<tr><td><B>Admin Cost=<%=admincost %></B></td></tr>
				<tr><td><B>Name=<%=name %></B></td></tr>
				
				</table>
		
		
		<% 
	   
   }
   
	
	
}catch(Exception e){
	
	e.printStackTrace();
	response.sendRedirect("error.jsp");	 
}

	%>


</body>
</html>