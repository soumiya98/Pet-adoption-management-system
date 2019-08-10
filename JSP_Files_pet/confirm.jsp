<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
<style>
        body{
               background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/confirm.jpg");
         background-size:cover;
          background-position: center; /* Center the image */
  background-repeat: no-repeat; 
         }
         table,tr, td{
         width:50%;
         margin:contain;
         table-layout:fixed;
         background:black;
         opacity:0.7;
         color:white;
         
         }
         </style>
</head>
<body>
<form method="post" action="address.jsp">
          
            <table border="4" cellpadding="5" cellspacing="5" align="left">
            
                <thead>
                    <tr>
                        <th colspan="2">Enter your location Here</th>
                    </tr>
                </thead>
                <tbody>
 <tr>
                        <td>Country</td>
                        <td><input type="text" name="country" /></td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td><input type="text" name="state" /></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><input type="text" name="city" /></td>
                    </tr>
                    <tr>
                        <td>Area</td>
                        <td><input type="text" name="area" /></td>
                    </tr>
                    <tr>
                        <td>Pin code</td>
                        <td><input type="text" name="pincode" /></td>
                    </tr>
                    
                   
                        <td colspan="2" align="center"><input type="submit" value=SUBMIT" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>         
                    </tbody>
                    </table>
               
                    </form>  
                    </body>
                    </html> 
          <%
         
          
    try{
        String username = request.getParameter("username") ;
        String password = request.getParameter("password") ;
        String email = request.getParameter("email") ;
      
        String phone_no = request.getParameter("phone_no");
        int length = String.valueOf(phone_no).length();
        Cookie user_name = new Cookie("user_name", username);
        response.addCookie(user_name);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root" );  
        
        PreparedStatement pst = con.prepareStatement("insert into registratio(username,password,email,phone_no)values( ?, ?, ?, ?)");
       
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, email);
        pst.setString(4, phone_no);
        
        pst.executeUpdate(); 
        System.out.println("Error");
    
        if((email.indexOf('@')==-1) && (email.indexOf('.')==-1) )
        {
        	
        	PreparedStatement pst3=con.prepareStatement("delete from registratio where username=?");
        	pst3.setString(1,username);
        	 pst3.executeUpdate(); 
        	 session.setAttribute("error", "EMAIL ID NOT VALID!!");
	    		response.sendRedirect("regis.jsp");
        }
        if(length!=10)
        {

        	PreparedStatement pst4=con.prepareStatement("delete from registratio where username=?");
        	pst4.setString(1,username);
        	 pst4.executeUpdate(); 
        	session.setAttribute("error", "PROVIDE VALID PHONE NUMBER!!");
    		response.sendRedirect("regis.jsp");
        }
        
        
       
       
    
    }catch(Exception e){   
    	 if (e.getMessage().equalsIgnoreCase( "Username already exists"))
    	 {
    		 String email=request.getParameter("email");
    		 String phone_no = request.getParameter("phone_no");
    	        int length = String.valueOf(phone_no).length();
    	      if( (email.indexOf('@')==-1) && (email.indexOf('.')==-1) &&(length!=10)  )
       		 {
       			 session.setAttribute("error", "PLEASE ENTER VALID DETAILS and USERNAME ALREADY EXISTS");
     	    		response.sendRedirect("regis.jsp"); 
       		 }
    	      else if( (email.indexOf('@')==-1) && (email.indexOf('.')==-1)  )
    		 {
    			 session.setAttribute("error", "USERNAME already exists and EMAIL ID is invalid!");
 	    		response.sendRedirect("regis.jsp"); 
    		 }
    		 
    		 else
    		 {
	    	  session.setAttribute("error", "USERNAME ALREADY EXISTS!!! PLEASE TRY ANOTHER USERNAME!");
	    		response.sendRedirect("regis.jsp");
	    		//out.println(e.getMessage());
    		 }
    	 }
    	 else
    	 {
    	
    System.out.println("Something went wrong !! Please try again"); 
    response.sendRedirect("error.jsp");	 
   // out.println(e.getMessage());
		   
    	 }
    e.printStackTrace();	
}   
            %>

