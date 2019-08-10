<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
<style>
        body{
        /*background:url("https://images.pexels.com/photos/126407/pexels-photo-126407.jpeg?cs=srgb&dl=animal-pet-cute-126407.jpg&fm=jpg")no-repeat center fixed;*/
         background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/sonamma.jpg");
        background-size:cover;
         }
         table,tr, td{
         width:50%;
         margin:contain;
         table-layout:fixed;
         /*background:white;*/
         opacity:1.5;
         color:black;
         
         }
         </style>
</head>
<body>
<form method="post" action="sellsubmit.jsp">
            
            <table border="4" cellpadding="5" cellspacing="5" align="right">
                <thead>
                    <tr>
                        <th colspan="2">Enter the details of the animal</th>
                    </tr>
                </thead>
                <tbody>
 <tr>
                        <td>Animal</td>
                       <td>
                        <%
  
try
{
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root" );
String sql = "SELECT * FROM animal";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>

<select name="animal">
<%
while(rs.next())
{
String fname = rs.getString(2); 
%>
<option value="<%=fname %>"><%=fname %></option>
<%
}
%>
</select>

<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
response.sendRedirect("error.jsp");	 
}
%>
</td>
                    </tr>
                    <tr>
                        <td>Breed</td>
                        
                        <td>
                        <%
  
try
{
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root" );
String sql = "SELECT * FROM breed ";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>

<select name="breed">
<%
while(rs.next())
{
String fname = rs.getString(2); 
%>
<option value="<%=fname %>"><%=fname %></option>
<%
}
%>
</select>

<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
response.sendRedirect("error.jsp");	 
}
%>
</td>
                        
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td><input type="text" name="color" /></td>
                    </tr>
                    <tr>
                        <td>Age (months)</td>
                        <td><input type="text" name="age" /></td>
                    </tr>
                    <tr>
                        <td>Cost</td>
                        <td><input type="text" name="cost" /></td>
                    </tr>
                     <tr>
                        <td>Gender</td>
                        <td><input type="text" name="gender" /></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" /></td>
                    </tr>
                     <tr>
                     <td>Image</td>
                        <td> <input type="file" name="image" id="myFile"></td>
                  
                    </tr>
                    <tr>
                     <td>Video</td>
                        <td> <input type="file" name="video" id="myFile1"></td>
                  
                    </tr>
                   
                   
<tr><td>Neuter<br></td>
<td><input type="radio" name="neu" value="Yes">Yes <br></td>
<td><input type="radio" name="neu" value="No">No <br></td>
</tr>
<tr><td>Vaccintion<br></td>
  <td><input type="radio" name="vacc" value="Yes">Yes <br></td>
  <td>  <input type="radio" name="vacc" value="No">No <br></td>
  </tr>
   <tr><td> Rabies<br></td>
    <td><input type="radio" name="rab" value="Yes">Yes <br></td>
  <td>  <input type="radio" name="rab" value="No">No <br></td>
  </tr>
   <tr><td> Healthy<br></td>
   <td> <input type="radio" name="hel" value="Yes">Yes <br></td>
  <td>  <input type="radio" name="hel" value="No">No <br></td>
  </tr>
  <tr><td>  Deworm<br></td>
  <td>  <input type="radio" name="de" value="Yes">Yes <br></td>
   <td> <input type="radio" name="de" value="No">No <br></td>
   </tr>
                    
                    
                    
                     <tr>
                        <td colspan="2" align="center"><input type="submit" value=SUBMIT />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>         
                    </tbody>
                    </table>
                    
                    </form>  
                     <%
    String msg = (String)session.getAttribute("errorpet");
if (msg != null) {
	%>
	

	<table align="left" >
    <td> <p style="color:red"><%= msg %></p></td>
    </table>


    <%
    msg=null;
    		
}
  %>  
                    </body>
                    </html> 
     