<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><%@ include file='title.jsp'%></title>
<link href="http://fonts.googleapis.com/css?family=Abel|Arvo"
	rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="jquery.slidertron-1.0.js"></script>
<style>
.rcorners3 { 
  border-radius: 15px 50px 30px;
  background: url(./images/Paper11.jpg);
  padding: 20px; 
  width: 200px;
  height: 150px;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
  border-radius: 12px;
}
.button1:hover {
  background-color: #4CAF50;
  color: white;
}
.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
  border-radius: 12px;
}
.button2:hover {
  background-color: #008CBA;
  color: white;
}

table, th, td {
  border: 1px solid black;
  border-radius: 10px;
  
}
th, td {
  padding-top: 5px;
  padding-bottom: 15px;
  padding-left: 25px;
  padding-right: 35px;
  border-style: ridge;
  font-size: 18px;
}
tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}

th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
</style>
<%
	if(request.getParameter("user")!=null){
	   out.println("<script>alert('Incorrect login details...'); document.ulogin.email.focus();</script>"); 
	}
	if (request.getParameter("mail") != null) {
		out.println("<script>alert('Please Check your email ID for OTP!')</script>");
	}
	if (request.getParameter("Number") != null) {
		out.println("<script>alert('You have Entered Number Wrong OTP! please try again')</script>");
	}
	if (request.getParameter("login") != null) {
		out.println("<script>alert('Log in Successfully!')</script>");
	}
%>

<%
	String otp=(String)session.getAttribute("str1");
	//System.out.println("otp : "+otp);
	String otp1=otp.substring(0,1);
	String otp2=otp.substring(1,2);
	String otp3=otp.substring(2,3);
	String otp4=otp.substring(3,4);
	String otp5=otp.substring(4,5);
	String otp6=otp.substring(5,6);
	String otp7=otp.substring(6,7);
	String otp8=otp.substring(7,8);
	String otp9=otp.substring(8,9);
	String otp10=otp.substring(9,10);
	System.out.println("visual keypad : "+otp1+" "+otp2+" "+otp3+" "+otp4+" "+otp5+" "+otp6+" "+otp7+" "+otp8+" "+otp9+" "+otp10);
%>
</head>
<body>

	<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<%@ include file='logo.jsp'%>
			</div>
			<div id="menu-wrapper">
				<ul id="menu">
					<li><a href="uHome.jsp"><span>Home</span></a></li>
					<li class="current_page_item"><a href="userHome.jsp"><span>Purchase</span></a></li>
					<li><a href="AddToCart_Product.jsp"><span>Add To Cart</span></a></li>
					<li><a href="userlog"><span>Logout</span></a></li>
					<li><a href="aboutus.jsp"><span>About Us</span></a></li>
				</ul>
				<script type="text/javascript">
			$('#menu').dropotron();
		</script>
				<!-- end #menu -->
				<div id="banner">
					<div class="contentbg">
						<div class="post">
							<h2 class="title"></h2>
						</div>
						<br /> <br /> 
						<br /> <br />
    
				<div class="login"><br>
					<form action="GetKeypad" name="GetKeypad" method="post" onsubmit="return validation()">
					<table class="rcorners3" cellspacing="1" cellpadding="5" style="width:30%; margin-left:auto;margin-right:auto;" align="center" bordar="5">
					<tr align="center">
						<td><b><font color="black">Enter OTP to Visualize Keypad</font></b></td>
					</tr>
					<tr align="center">
						<td style="width: 80px"><input type="text" class="text" name="otp" id="otp" style="width: 60%;width: 60%" placeholder="Enter OTP Here..." required></td>
					</tr>
					<tr align="center">
						<td><input type="submit" name="Click to Login" value="Submit" style="height:45px" style="weight:50px"></input></td>
					</tr>
					</table>
					</form>
					</div>
					</div>
					</div>
					</div>
					<div style="clear: both;">&nbsp;</div>
					</div>

		<div id="content"></div>
		<div style="clear: both;">&nbsp;</div>
	</div>
	<%@ include file='footer.jsp'%>
</body>
</html>
