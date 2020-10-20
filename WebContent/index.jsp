<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {box-sizing: border-box;}


body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
li {
	float: left;
}
li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	width: 200px;
	font-size: 80%;
}
.header {
  overflow: hidden;
  background-color: #291f04;
  padding: 13px 10px;
}

.header a {
  float: left;
  color: white;
  text-align: center;
  padding: 10px;
  text-decoration: none;
  font-size: 30px; 
  line-height: 35px;
  border-radius: 4px;
}

img{
  width:25%;
  float:left;
  display: inline-block;
}
/*.header a:hover {
  background-color: #ddd;
  color: black;
}*/

.header-right a:hover {
  float: right;
  right:55px;
  background-color: #ddd;
  color: black;
}
.header-right {
float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  } 
}
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	color: white;
	background-color: #291f04;
	margin-top: 100%;
	width: 100%;
	height: 5%;
	font-size: 20px;
	text-align: center;
}
body {
 background-image:url('images/background.jpg');
 height: 100vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
.loginform {
	margin-top: 10%;
	background: #a89e8a;
	width: 26%;
	height: 50%;
	border-radius: 7%;
	opacity: 0.8;
	color: white;
	align: center;
	margin-left: 35%;
	display: none;
	position: absolute;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0
		rgba(0, 0, 0, .19);
	border: 3px solid #f1f1f1;
}
.input {
	width: 170px;
	height: 30px;
	border-radius: 10px;
	background: rgba(255, 255, 255, .1);
	font-size: 15px;
}
.button {
	align-content: center;
	align: center;
	font-size: 12px;
	width: 140px;
	height: 40px;
	margin-left: -50px;
	margin-top: 40px;
	cursor: pointer;
	padding: 15px 20px;
	border-radius: 25px;
	color: black;
	
	text-align: center;
}
.img {
	width: 5%;
	height: 5%;
	margin-left: 95%;
	border-radius: 10%;
	position: relative;
	cursor: pointer;
}
.cross-button {
	width: 50px;
}
.caption {
	font-style: italic;
	font-size: 30px;
	margin-bottom: 20px;
	margin-top: 10px;
}
.caption-image {
	position: absolute;
	width: 20%;
	height: 20%;
	border-radius: 20%;
	left: 40%;
	top: -11%;
}
table {
	width: 50%;
	margin-left: 20%;
	margin-top: 15%;
}
#header ul li {
    display:block;
    padding:20px;
}
.errormessage {
	color: red;
	position: absolute;
	top: 20%;
	left: 40%;
	font-size: 150%;
}
</style>
<script type="text/javascript">
    function login() {
		document.getElementById("log").style.display = "block";
    }
    
	function cross() {
		document.getElementById("log").style.display = "none";
	}
	
</script>
</head>
<body>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  %> 
  <% if (session != null) {
         if (session.getAttribute("username") != null) {
            int id = (Integer)session.getAttribute("username");
         }
      } 
%>
<div class="header">
  <a class="logo"><img src="images/loggo.PNG" ></img></a>
  <ul>
  <div class="header-right">
				<% if (session.getAttribute("username") == null) {
			            %> <li><a  href="register.jsp" >Register</a></li> <%
					}  else {%>
					 <% }%>
				<% if (session.getAttribute("username") != null) {
			            int id = (Integer)session.getAttribute("username");
			            System.out.println("session id "+ id); 
					%><li><a href="./LogoutServlet" id="logout"> Logout</a></li><%
					}  else {%>
					<li><a href="#" onclick="login()" id="login">Login
					 <% }%>
					</a></li>
    <li><a href="about.html">About</a></li>
  </div>
  </ul>
</div>
<% if(request.getAttribute("logout")!=null) {%>
<h1 style="color:Green;"><%=request.getAttribute("logout") %></h1>
<%} %>
<% if(request.getAttribute("errormessage")!=null) {%>
<h1 style="color:Red;"><%=request.getAttribute("errormessage") %></h1>
<%} %>
<% if(request.getAttribute("message") != null){ %>
<h1 style="color:Red;"><%=request.getAttribute("message") %></h1>
<%} %>
<div class="loginform" id="log">
		<img src="images/cross.png" class="img" onclick="cross()">

		<table style="margin-top: 30%;">
			<caption>
				<img src="images/caption1.png" class="caption-image">
			</caption>
			<br>
			<form action="./LoginServlet" method="post">
				<tr>
					<td><b>UserId:</b></td>
					<td><input type="number" name="user" class="input" maxlength="4" pattern = [0-9]{4}></td>
				</tr>

				<tr>
					<td><b>Password:</b></td>
					<td><input type="Password" name="pass" class="input" required></td>
				</tr>

				<tr>
					<td></td>
					<td><button type="submit" class="button">
							<b>Login</b>
						</button></td>
				</tr>
			</form>
		</table>

	</div>
<div class="footer">
  <span style="font-size: 15px">&#9400;</span> Copyrights Capgemini
		India Ltd.
</div>

</body>
</html>