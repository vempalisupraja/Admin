<html>
<head>
<title>Get Started</title>
<style>
.container {
  position: relative;
  margin-top: 50px;
  width: 100%;
  height: 100%;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0);
  transition: background 0.5s ease;
}
.bgpic {
background-image: url(images/getstarted.jpg);
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
.title {
  position: absolute;
  width: 750px;
  left: 400;
  top: 300px;
  font-weight: 1700;
  font-size: 30px;
  text-align: center;
  text-transform: uppercase;
  color: #291f04;
  z-index: 1;
  transition: top .5s ease;
}

.container:hover .title {
  top: 69px;
  font-size: 30px;
}

.button {
  position: absolute;
  width: 500px;
  left: 300;
  top: 250px;
  text-align: center;
  opacity: 0;
  transition: opacity 3s ease;
}

.button a {
  width: 600px;
  padding: 20px 55px;
  text-align: center;
  color: white;
  font-weight: 1700;
  font-size:40px;
  background-color:#291f04;
  border-radius: 50px;
  z-index: 1;
  text-decoration:none;
}

.container:hover .button {
  opacity: 1;
}

</style>
</head>
<body class="bgpic">
<div class="container">
  <p class="title"><b><i>Movie Ticket Booking System &#169; bookmyticket.com</i></b></p>
  <div class="button"><a href="index.jsp"> Get Started </a></div>
</div>

</body>
</html>