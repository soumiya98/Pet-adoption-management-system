<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*"
%>
<%@ page import ="java.util.*"
%>

<html>


<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

 body{
   /*    background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr9pKrQ6MTXaewApvRVdpNaqOPczwjhYFVpe69T7ctuUBzZY5XfA")center fixed no-repeat ;*/

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
    position:relative;
    right:30px;
    top:50px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

.place
{
position:absolute;
top:20px;
left:20px;

}
.place1
{
position:absolute;
top:100px;
left:20px;

}

</style>
</head>
<body>

        
<form action="login.jsp" method="post">
<button  class="button button2">Log Out</button>
</form>


<% 
try{
    	String image=" ";
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  );    
        String animal = request.getParameter("animal") ;
      //  out.println(animal);
        String breed = request.getParameter("breed") ;
      //  out.println(breed);
       
      //  String age = request.getParameter("age");
       // out.println(age);
      //  int agee=Integer.parseInt(age);
     //   out.println(agee);
        String cost = request.getParameter("cost");
       // out.println(cost);
        int co=Integer.parseInt(cost);
      //  out.println(co);
        String gender = request.getParameter("gender");
      //  out.println(gender);
      //  Cookie c[]=request.getCookies();
     //   String user=c[0].getValue();
      //  out.println(user);
        
        
     //   PreparedStatement pst1=conn.prepareStatement("select user_id from registratio where username=?");
    //    pst1.setString(1,user);
    //    int uid=0;
    //    ResultSet rs1 = pst1.executeQuery();     
        
    //    if(rs1.next())   
    //    {
     //   	uid=rs1.getInt(1) ;
     //   	}
      //  out.println(uid);
        
        PreparedStatement pst6=conn.prepareStatement("select * from animal where aname=?");
        pst6.setString(1,animal);
        int aid=0;
       ResultSet rs6 = pst6.executeQuery();     
        
        if(rs6.next())   
        {
        	aid=rs6.getInt(1) ;
        	}
      //  out.println(aid);
        
       
        PreparedStatement pst3=conn.prepareStatement("select bid from breed where bname=? ");
        pst3.setString(1,breed);
       // pst3.setInt(2,aid);
        int bid=0;
        ResultSet rs3 = pst3.executeQuery();     
        
        if(rs3.next())   
        {
        	bid=rs3.getInt(1) ;
        	}
        
      //  out.println(bid);
        
        PreparedStatement pst5=conn.prepareStatement("select gid from gender where gname=? ");
        pst5.setString(1,gender);
       // pst3.setInt(2,aid);
        int gid=0;
        ResultSet rs5 = pst5.executeQuery();     
        
        if(rs5.next())   
        {
        	gid=rs5.getInt(1) ;
        	}
        
     //   out.println(gid);

        
        
        PreparedStatement pst4=conn.prepareStatement("select * from adoption where aid1=? and bid=? and gid=? and cost=? ",ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
        pst4.setInt(1,aid);
        pst4.setInt(2,bid);
       pst4.setInt(3,gid);
       
        //pst4.setString(5,gender);
        pst4.setFloat(4,co);
      //  pst4.setFloat(5,(co+1000));
        
        ResultSet rs4 = pst4.executeQuery();   
        if(!rs4.next())
        {
        	 System.out.println("no data");
       	 session.setAttribute("req", "SORRY ! NO PET MATCHES YOUR REQUIREMENT");
       	response.sendRedirect("viewall.jsp");
       }
        else
        	
        {
        	  System.out.println("error");
        	rs4.previous();
        System.out.println("error");
        String str;
        %>
        <div class="place1">
        <table>
        <tr>
        <% 
        String uidr;
        while(rs4.next())   
        {
        	System.out.println("error");
        	String im=rs4.getString(8);
        	float cos=rs4.getFloat(7);
        	int ag=rs4.getInt(5);
        	im = im.replace('\\' , '/');
        	 uidr=rs4.getString(11);
        	
        //	out.println(im);
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
         </div>
     <div class="place">
        <h1 style="color:green"><B>PET AS PER YOUR REQUIREMENT!! </B></h1>
       </div>
        <% }
    
       
   //   PreparedStatement pst2=conn.prepareStatement("select * from registratio where uid=?");
    //    pst2.setInt(1,uid);
        
     //   ResultSet rs2 = pst2.executeQuery();     
        
      //  if(rs2.next())   
      //  {
       // 	 out.println(rs2.getString(2) +" \n" + rs2.getString(4)+ " \n"+ rs2.getString(5));
        //	}
       
        
}
catch(Exception e){
e.printStackTrace();
System.out.println("something wrong");
response.sendRedirect("error.jsp");	 
}
        %>
</body>
</html>


 
