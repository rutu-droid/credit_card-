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
</head>
<body>
	<%
		if (request.getParameter("email") != null) {
			out.println("<script>alert('Email id is Already Exist!')</script>");
		}
	%>
	<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<%@ include file='logo.jsp'%>
			</div>
			<div id="menu-wrapper">
				<ul id="menu">
					<li><a href="index.jsp"><span>Home</span></a></li>

					<li><a href="userLogin.jsp"><span>User Login</span></a></li>
					<li class="current_page_item"><a href="userReg.jsp"><span>Registration</span></a></li>
					<li><a href="adminLogin.jsp"><span>Admin</span></a></li>
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
						<strong><font size="6">Personal Information</font> </strong> <br />
						<form name="ureg" action="pinfo" method="post" onsubmit="return validation()">
							 <table align="center" class="rcorners3" cellpadding="10" cellspacing="10">
									<tr>
										<td><strong><font size="4">First Name</font></strong></td>
										<td><input type="text" name="fname" id="fname" style="height:30px" onkeyup="AllowAlphabet()" required></input></td>
										<td><strong><font size="4">Last Name</font></strong></td>
										<td><input type="text" name="lname" id="lname" style="height:30px" onkeyup="AllowAlphabet()" required></input></td>
									</tr>
									<tr>
										<td><strong><font size="4">Date of Birth</font></strong></td>
										<td><input type="date" name="dob" id="dob" style="height:30px" required></input></td>
										<td><strong><font size="4">Gender</font></strong></td>
										<td>&nbsp;<font size="3">Male</font>&nbsp;<input
											type="radio" name="gender" id="gender" value="male"></input>
											&nbsp;<font size="3">Female</font>&nbsp;<input type="radio"
											name="gender" id="gender" value="female"></input></td>
									</tr>
									<tr>
										<td><strong><font size="4">Address</font></strong></td>
										<td><input type="text" name="address" id="address"
										style="height:30px" onkeyup="AllowAlphabet()" required></input></td>
										<td><strong><font size="4">City</font></strong></td>
										<td><input type="text" name="city" id="city"
											style="height:30px" required></input></td>
									</tr>
									<tr>
										<td><strong><font size="4">Email Id</font></strong></td>
										<td><input type="text" name="email" id="email" style="height:30px" required></input></td>
										<td><strong><font size="4">Mobile No.</font></strong></td>
										<td><input type="text" name="mobile" maxlength="10" id="txtMB"
										style="height:30px"	onblur="return ValidateMobNumber('txtMB')" required></input></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="submit" class="button" value="Save & Continue" /></td>
										<td></td>
										<td><input type="reset" class="button" value="Reset" /></td>
									</tr>
								</table>
								</form>

							<div style="clear: both;">&nbsp;</div>
					</div>

				</div>
			</div>
		</div>
		<!-- end #header -->
		<!--<div id="page">-->
		<div id="content"></div>

		<!-- end #sidebar -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end #page -->
	<!--</div>-->
	<%@ include file='footer.jsp'%>
	<!-- end #footer -->
</body>
</html>
