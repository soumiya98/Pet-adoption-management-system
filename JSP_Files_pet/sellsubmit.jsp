<%@ page import ="java.sql.*" %>
<head>
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
    left:10px;
    bottom:30px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>

</head>
<form action="login.jsp" method="post">
<button  class="button button2">Log Out</button>
</form>
<%
    try{
    	String image=" ";
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root"  );    
        String animal = request.getParameter("animal") ;
     //   out.println(animal);
        String breed = request.getParameter("breed") ;
      //  out.println(breed);
        String color = request.getParameter("color") ;
     //   out.println(color);
        String age = request.getParameter("age");
      //  out.println(age);
        int agee=Integer.parseInt(age);
      //  out.println(agee);
        String cost = request.getParameter("cost");
       // out.println(cost);
        int co=Integer.parseInt(cost);
     //   out.println(co);
        String gender = request.getParameter("gender");
      //  out.println(gender);
         image= request.getParameter("image");
     //   out.println(image);
        String neu = request.getParameter("neu");
      //  out.println(neu);
        String vacc = request.getParameter("vacc");
    //    out.println(vacc);
        String deworm = request.getParameter("de");
     //   out.println(deworm);
        String rab = request.getParameter("rab");
     //   out.println(rab);
        String health = request.getParameter("hel");
      //  out.println(health);
        Cookie c[]=request.getCookies();
        String user=c[0].getValue();
      //  out.println(user);
        String video = request.getParameter("video");
      //  out.println(video);
        String name = request.getParameter("name");
      //  out.println(name);
        
         
       
      
        
        PreparedStatement pst1=conn.prepareStatement("select user_id from registratio where username=?");
        pst1.setString(1,user);
        int uid=0;
        ResultSet rs1 = pst1.executeQuery();     
        
        if(rs1.next())   
        {
        	uid=rs1.getInt(1) ;
        	}
       // out.println(uid);
        
        PreparedStatement pst4 = conn.prepareStatement("insert into medical (vaccination,neuter,rabies,deworm,healthy)values(?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
     //   pst4.setInt(1,uid);
        pst4.setString(1,vacc);
        pst4.setString(2,neu);
        pst4.setString(3,rab);
        pst4.setString(4,deworm);
        pst4.setString(5,health);
        

        pst4.executeUpdate();  
        int id=0;
        ResultSet result = pst4.getGeneratedKeys();
        if (result.next())
             id = result.getInt(1);
       // out.println(id);
    PreparedStatement pst2=conn.prepareStatement("select * from animal where aname=?");
        pst2.setString(1,animal);
        int aid=0;
       ResultSet rs2 = pst2.executeQuery();     
        
        if(rs2.next())   
        {
        	aid=rs2.getInt(1) ;
        	}
       // out.println(aid);
        
       
        PreparedStatement pst3=conn.prepareStatement("select bid from breed where bname=? ");
        pst3.setString(1,breed);
       // pst3.setInt(2,aid);
        int bid=0;
        ResultSet rs3 = pst3.executeQuery();     
        
        if(rs3.next())   
        {
        	bid=rs3.getInt(1) ;
        	}
        
       // out.println(bid);
        
        
        PreparedStatement pst5=conn.prepareStatement("select gid from gender where gname=? ");
        pst5.setString(1,gender);
       // pst3.setInt(2,aid);
        int gid=0;
        ResultSet rs5 = pst5.executeQuery();     
        
        if(rs5.next())   
        {
        	gid=rs5.getInt(1) ;
        	}
        
       // out.println(gid);

        
        
        PreparedStatement pst = conn.prepareStatement("insert into adoption (userid,aid1,bid,color,age,gid,cost,image,mid,video,name)values(?, ?, ?, ?, ?, ?, ? ,?, ?, ?,?)");
        pst.setInt(1,uid);
        pst.setInt(2,aid);
        pst.setInt(3,bid);
        pst.setString(4,color);
        pst.setInt(5,agee);
        pst.setInt(6,gid);
        pst.setInt(7,co);
        pst.setString(8,image);
        pst.setInt(9,id);
        pst.setString(10,video);
        pst.setString(11,name);
        
        
     
       
         pst.executeUpdate();   
       %>
       <center>
         <table>
         <td><h1 style="color:green"><B>THANK YOU! YOUR DATA HAS BEEN SUCCESSFULLY ADDED</B></h1></td>
        </table>
        </center>
        <br>
        <br>
       <%
       
       PreparedStatement pst7=conn.prepareStatement("select * from adoption  ");
       
       
       ResultSet rs7 = pst7.executeQuery();     
       String str;
       %>
       <table>
       <tr>
       <% 
       String uidr;
       while(rs7.next())   
       {
       	String im=rs7.getString(8);
       	float cos=rs7.getFloat(7);
       	int ag=rs7.getInt(5);
       	im = im.replace('\\' , '/');
       	 uidr=rs7.getString(11);
       	
       //	out.println(im);
       	%>
       	<td>
       	
       	<form action="details.jsp" method="post">
 <td><button type="submit" name="pic" value="<%=uidr%>"><img src="<%= im %>" alt="Submit"  width="300" height="350"></button><p>Cost=<%=cos %><br></p><p>Age=<%=ag %><br></p></td>

 </form>
       	 
       <%
    }
       %>
       <%
    }	catch(Exception e){
    	
        	e.printStackTrace();
        	if (e.getMessage().equalsIgnoreCase( "Pet name already exists"))
       	 {
        		session.setAttribute("errorpet", "PET NAME ALREADY EXISTS!!!!");
	    		response.sendRedirect("sell.jsp");
       	 }
        	else
        		
        	{
        	//out.println("something wrong");
        	response.sendRedirect("error.jsp");	 
        	}
        	}
        %>