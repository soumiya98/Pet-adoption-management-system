<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
<style>
        body{
       /* background:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9DXfoHtBfpdT_KePksxwdCHrqtjyvdFY07s3ijWLm7Qw_iYPp")no-repeat center fixed;*/
        background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/buy.jpg");


background-attachment: fixed;

background-position: center;

        
         background-size:cover;
         
         }
         table,tr, td{
         width:50%;
         margin:contain;
         table-layout:fixed;
         /*background:black;*/
         /*opacity:0.7;*/
         color:white;
         
         }
         </style>
</head>
<body>
<form method="post" action="buysubmit.jsp">
            <center>
            <table border="4" cellpadding="5" cellspacing="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter the requirements</th>
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
 
System.out.println(sqe);
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
	 
System.out.println(sqe);
response.sendRedirect("error.jsp");	
}
%>
</td>
                        
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
                        <td colspan="2" align="center"><input type="submit" value=SUBMIT />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>    
                   
                    </tbody>
                    </table>
                    </center>
                    <center>
                    <table>
                    </form>  
                    
                      <form method="post" action="viewall.jsp"> 
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value=VIEWALL />
                            &nbsp;&nbsp;
                            
                        </td>                        
                    </tr>  
                    
                    
                    </form>
</table>     
</center> 
                    </body>
                    </html> 
     
            </center>
            
        </form>
    </body>
</html>

 
