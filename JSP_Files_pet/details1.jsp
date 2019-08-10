<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html>
    <head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <style>
         body{
      /* background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr9pKrQ6MTXaewApvRVdpNaqOPczwjhYFVpe69T7ctuUBzZY5XfA")center fixed no-repeat ;*/

background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/background.jpg");


background-attachment: fixed;

background-position: center;




background-size: cover;

font: 12px Arial, Tahoma, Georgia, "Times New Roman", Times, serif;

color: #000;

margin-right: 30px ;
       
         
         }
       
        
.container {
    position: relative;
    font-family: Arial;
}


.text-block {
    position: absolute;
    bottom: 10px;
    right: 10px;
    background-color:black;
    color: white;
    padding-left: 10px;
    padding-right: 10px;
}
p.cursive {
    font-family: Comic Sans, Comic Sans MS, cursive;
    font-size:14px;
}
.text-block1 {
    position: absolute;
    bottom: 30px;
    left: 10px;
  
    color: black;
    padding-left: 10px;
    padding-right: 10px;
}
.checked {
    color: orange;
}
.ribbon{
position:absolute;
top:0px;
right:0px;

}
.play {
    position:absolute;
  padding: 15px 32px;
    bottom: 0px;
  left: 180px;
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
    left:650px;
    bottom:30px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>
        
    </head>
    <body>
    <% 
    try{
    	
 
    String id=request.getParameter("pic");
    //out.println(id);
    Cookie c=new Cookie("myC",id);
    response.addCookie(c);
    
    
    int uid=0;
    int aid=0;
    int bid=0;
    int age=0;
    int gid=0;
    int mid=0;
    String country=" ";
    String state=" ";
    String city=" ";
    String area=" ";
    String pincode=" ";
    String name=" ";
    String image=" ";
    String video=" ";
    String color=" ";
    float cost=0;
    String username=" ";
    String phone=" ";
    String email=" ";
    String aname=" ";
    String bname=" ";
    String gname=" ";
    String vacc=" ";
    String deworm=" ";
    String neuter=" ";
    String rabies=" ";
      Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pet_1","root","root" );  
         Statement s=conn.createStatement();
         ResultSet rs=s.executeQuery("select * from adoption where name='"+id+"'");
         while(rs.next())
         {
         	uid=rs.getInt(1);
         	aid=rs.getInt(2);
         	bid=rs.getInt(3);
         	
         	color=rs.getString(4);
         	age=rs.getInt(5);
         	gid=rs.getInt(6);
         	cost=rs.getFloat(7);
         	image=rs.getString(8);
         	image = image.replace('\\' , '/');
         	mid=rs.getInt(9);
         	video=rs.getString(10);
         	name=rs.getString(11);
         }
      //   System.out.println(bid);
         	 %>
         	
         
         
        
     <video width="800" height="450" controls autoplay>
   <source src=<%=video %> type="video/mp4">

   
 </video>
     
 <div class="ribbon">
   <img src=<%=image%> alt="Nature" style="width:550px;height:700px;" >
   </div>
   
 <%
 PreparedStatement pst1=conn.prepareStatement("select * from registratio where user_id=?");
 pst1.setInt(1,uid);
 
 ResultSet rs1 = pst1.executeQuery();     

 if(rs1.next())   
 {
 	 username=rs1.getString(2) ;
 	 phone=rs1.getString(5);
 	 email=rs1.getString(4);
 	}
System.out.println(username);
System.out.println(phone);
System.out.println(email);
 
 PreparedStatement pst2=conn.prepareStatement("select * from animal where aid=?");
 pst2.setInt(1,aid);

ResultSet rs2 = pst2.executeQuery();     
 
 if(rs2.next())   
 {
 	aname=rs2.getString(2) ;
 	}
 
 
 System.out.println(aname);
 PreparedStatement pst3=conn.prepareStatement("select * from breed where bid=? ");
 pst3.setInt(1,bid);


 ResultSet rs3 = pst3.executeQuery();     
 
 if(rs3.next())   
 {
 	bname=rs3.getString(2) ;
 	}
 
 System.out.println(bname);
 
 
 PreparedStatement pst5=conn.prepareStatement("select * from gender where gid=? ");
 pst5.setInt(1,gid);
// pst3.setInt(2,aid);

 ResultSet rs5 = pst5.executeQuery();     
 
 if(rs5.next())   
 {
 	gname=rs5.getString(2) ;
 	}
 System.out.println(gname);
 PreparedStatement pst6=conn.prepareStatement("select * from medical where mid=? ");
 pst6.setInt(1,mid);
// pst3.setInt(2,aid);

 ResultSet rs6 = pst6.executeQuery();     
 
 if(rs6.next())   
 {
 	vacc=rs6.getString(2) ;
 	deworm=rs6.getString(5) ;
 	neuter=rs6.getString(3) ;
 	rabies=rs6.getString(4) ;
 	}
 
 System.out.println(vacc);
 System.out.println(deworm);
 System.out.println(neuter);
 System.out.println(rabies);



 PreparedStatement pst7=conn.prepareStatement("select * from address where user_id=?");
 pst7.setInt(1,uid);
 
 ResultSet rs7 = pst7.executeQuery();     

 if(rs7.next())   
 {
 	 country=rs7.getString(2) ;
 	 state=rs7.getString(3);
 	 city=rs7.getString(4);
	 area=rs7.getString(5);
	 pincode=rs7.getString(6);
 	}


 %>

 <div class="text-block1">
 
<table align="left">

 <p class="cursive">
 

<tr><td><B>ANIMAL DETAILS</B>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>LOCATION DETAILS</B>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Owner DETAILS</B>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Medical DETAILS</B></td></tr>
<tr><td><B>Animal:</B><%=aname %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Country:</B><%=country %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Owner:</B><%=username %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Neuter:</B><%=neuter %></td></tr>
<tr><td><B>Breed:</B><%=bname %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>State:</B><%=state %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Phone:</B><%=phone %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Vaccination:</B><%=vacc %></td></tr>
<tr><td><B>Age:</B><%=age %> months&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>City:</B><%=city %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Email:</B><%=email %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Deworm:</B><%=deworm %></td></tr>
<tr><td><B>cost:</B><%=cost %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Area:</B><%=area %></td></tr>
<tr><td><B>Gender:</B><%=gname %>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><B>Pincode:</B><%=pincode %></td></tr>
<tr><td><B>Color:</B><%=color %>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td><B>Name:</B><%=name %>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>





</table>


 </div>
 

 <br>
 <br>
 <br>
         
<form action="delete1.jsp" method="post">
<button  class="button button2" type="submit" name="pic" value="<%=name%>">DELETE</button>
</form>
 
<%
    }catch(Exception e){
    	e.printStackTrace();
    	response.sendRedirect("error.jsp");	 
    }

%>
  

  
    </body>
</html>