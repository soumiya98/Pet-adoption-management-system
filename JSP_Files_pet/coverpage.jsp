<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to world of Animals</title>
<style>

        body{
    /*background: url("https://wishbonepetrescue.org/wp-content/uploads/sites/45/2014/10/Wishbone-Adopt-homepg-2.jpg")center fixed no-repeat ;*/
    background-image:url("file:///C:/Users/sukum_000/eclipse-workspace/pet_1/WebContent/coverpage.jpg");
         background-size:cover;
          height: 650px; 
          background-position: center ; /* Center the image */
  background-repeat: no-repeat; 





font: 12px Arial, Tahoma, Georgia, "Times New Roman", Times, serif;

color: #000;

margin-right: 30px ;
       
         
         }



body {margin:0;}

.navbar {
  overflow: hidden;
  background-color: #333;  
  position: fixed;
  bottom: 0;
  width: 100%;
}

.navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.navbar a:hover {
  background-color: #ddd;
  color: black;
}

.navbar a.active {
  background-color: #4CAF50;
  color: white;
}

.navbar .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .navbar a:not(:first-child) {display: none;}
  .navbar a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .navbar.responsive .icon {
    position: absolute;
    right: 0;
    bottom:0;
  }
  .navbar.responsive a {
    float: none;
    display: block;
    text-align: left;
  }

}
</style>
</head>

<body  >
<script>
function myFunction() {
    var x = document.getElementById("myNavbar");
    if (x.className === "navbar") {
        x.className += " responsive";
    } else {
        x.className = "navbar";
    }
}
</script>


<h1 style="text-align:center;color:black;"><B>Welcome to the world of Animals</B></h1>




<div class="navbar" id="myNavbar">
  <a href="#home" class="active">Home</a>
  <a href="login.jsp">Admin Login</a>
  <a href="login.jsp">Login</a>
  <a href="regis.jsp">Register</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>

<div style="padding-left:16px">

</body>
</html>