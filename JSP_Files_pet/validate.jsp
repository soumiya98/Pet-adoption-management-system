<%@ page import ="java.sql.*" %>
<head>
<style>
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
    bottom:30px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 10;
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
.place
{

   position:absolute;
    right:30px;
    top:100px;
    

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
</style>


</head>
<body >
<%
    try{
        String username = request.getParameter("uname");   
        String password = request.getParameter("psw");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  );    
        Cookie c=new Cookie("user_name", username);
    	response.addCookie(c);
    	
        PreparedStatement pst = conn.prepareStatement("Select username,password from registratio where username=? and password=?");
      
        pst.setString(1, username);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();     
       
        if(rs.next())   
        {
        	
        	if(rs.getString(1).equals("admin")&& rs.getString(2).equals("admin123"))
        	{
        		response.sendRedirect("admin.jsp");
        	}
        	else
        	{
        		%>
        		
        <
         <table align="right">
         <td><h1 style="color:green"><B>LOGIN IS SUCCESSFULL!!</B></h1></td>
        </table>
      
        
<% 
        	}
        	
        	
        	
        	
        	%>
        	
        	
        	<form action="login.jsp" method="post">
<button  class="button button2">Log Out</button>
</form>
        	
        	<html>




<div class="place">
<h1 style="color:green"><B>Choose whether to sell or buy an animal</B></h1>
</div>

<ul>
  <li><a href="sell.jsp"><B>To sell</B></a></li>
  <li><a href="buy.jsp"><B>To buy</B></a></li>
  <li><a href="profile.jsp"><B>View your profile</B></a></li>
  
</ul>




      <%  }
         
        else
        {
           out.println("Invalid login credentials"); 
           response.sendRedirect("invalid.jsp");
           
        }
   }
   catch(Exception e){       
       System.out.println("Something went wrong !! Please try again"); 
       response.sendRedirect("error.jsp");	 
   }   

%>

</body>
</html>

