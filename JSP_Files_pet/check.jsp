<%@ page import ="java.sql.*" %>

<%
    try{
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  );    
        PreparedStatement pst = conn.prepareStatement("Select * from animal");
     
       
        ResultSet rs = pst.executeQuery();     
       
        if(rs.next())   
        {
        	out.println(rs.getString(1)+rs.getString(2)) ;
        	}
    }
        	catch(Exception e){
        	e.printStackTrace();
        	}
        	%>