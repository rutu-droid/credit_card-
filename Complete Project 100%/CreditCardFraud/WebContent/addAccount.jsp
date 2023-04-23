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

		<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<%@ include file='logo.jsp'%>
			</div>
			<div id="menu-wrapper">
				<ul id="menu">
					<li><a href="adHome.jsp"><span>Home</span></a></li>
					<li  class="current_page_item"><a href="addAccount.jsp"><span>Add Account</span></a></li>
					<li><a href="CustomerInfo.jsp"><span>Customer Details</span></a></li>
					<li><a href="adlogout"><span>Logout</span></a></li>
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
						
						<strong><font size="6">Add Account</font> </strong>
						<br /> <br />
						<form action="adacount" method="post">
							<center>
								<table>
									<tr>
										<td><strong><font size="4">Credit card Number</font></strong></td>
										<td><input type="text" name="card_no" id="card_no"></input>&nbsp;&nbsp;&nbsp;</td>

										
									</tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>


																	
									<tr>
									
										<td><strong><font size="4">Balance</font></strong></td>
										<td><input type="text" name="balance" id="balance"></input>&nbsp;&nbsp;&nbsp;</td>
									
									</tr>
									<tr></tr>
									<tr></tr>



									<tr>

									</tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<tr>

									<td><input type="submit" value="Submit" style="width: 100px; height: 35px;" /> </td>
									
									
									<td><input type="reset" value="Reset" style="width: 100px; height: 35px;"/> </td>
									</tr>
									
								</table>
							</center>







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
