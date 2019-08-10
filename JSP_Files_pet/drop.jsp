<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drop Downlist</title>
</head>
<body>

<form action="#">
<%
  
try
{
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root" );
String sql = "SELECT username FROM registratio";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>
<p>Select Name :
<select>
<%
while(rs.next())
{
String fname = rs.getString("username"); 
%>
<option value="<%=fname %>"><%=fname %></option>
<%
}
%>
</select>
</p>
<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
</form>
</body>
</html>