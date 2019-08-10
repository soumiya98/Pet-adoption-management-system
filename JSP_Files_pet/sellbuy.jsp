<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
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
    top:50px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
         

</style>
</head>
<body >
<h1 style="color:green">Choose whether to sell or buy an animal</h1>
<ul>
  <li><a href="sell.jsp">To sell</a></li>
  <li><a href="buy.jsp">To buy</a></li>
  <li><a href="profile.jsp">View your Profile</a></li>
  
</ul>
<form action="login.jsp" method="post">
<button  class="button button2">Log Out</button>
</form>

</body>
</html>