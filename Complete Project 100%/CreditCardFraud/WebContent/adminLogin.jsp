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
</head>
<body>

	<%
		if (request.getParameter("msg") != null) {
				out.println("<script>alert('Wrong Username OR Password!')</script>");
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
					<li><a href="userLogin.jsp"><span>User
								Login</span></a></li>
					<li><a href="userReg.jsp"><span>Registration</span></a></li>
					<li  class="current_page_item"><a href="adminLogin.jsp"><span>Admin</span></a></li>
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
						<h3><font size="6">Admin Login</font></h3>
								<br/>

						<form action="adlog" method="post">
							<table align="center">
								
								<tr>
									<td><font size="5">Username</font></td>
									<td><input type="text" name="uname" id="uname" style="width: 150px; height: 25px;"/></td>
									
								</tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								
								<tr>
									<td><font size="5">Password</font></td>
									<td><input type="password" name="pwd" id="pwd" style="width: 150px; height: 25px;"/></td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								
								<tr>
									<td></td>
									<td><input type="Submit" value="Login" style="width: 100px; height: 50px;"/></td>
								</tr>
							</table>
						</form>


						<br /> <br /> <br /> <br />
						<p></p>




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
