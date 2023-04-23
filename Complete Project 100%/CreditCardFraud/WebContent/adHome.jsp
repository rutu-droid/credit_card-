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
		String ad_name = null;

		if (session.getAttribute("username") != null) {
			ad_name = (String) session.getAttribute("username");
			System.out.println("Session id is " + ad_name);
	%>
	<%
		if (request.getParameter("status") != null) {
				out.println("<script>alert('Login Succesfully!')</script>");
			}
		if (request.getParameter("update") != null) {
				out.println("<script>alert('Block Account Recover Succesfully!')</script>");
			}
	%>

	<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<%@ include file='logo.jsp'%>
			</div>
			<div id="menu-wrapper">
				<ul id="menu">
					<li class="current_page_item"><a href="adHome.jsp"><span>Home</span></a></li>
					<li><a href="addAccount.jsp"><span>Add Account</span></a></li>
					<li><a href="CustomerInfo.jsp"><span>Customer Details</span></a></li>
					<li><a href="BlockedAcc.jsp"><span>Blocked Account</span></a></li>
					<li><a href="index.jsp?logout"><span>Logout</span></a></li>
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
						<br /> <input type="hidden" name="ad_id"
							id="ad_id" value="<%=ad_name
							%>">
						<div class="item">
								<img style="width: 90%;height:430px" src="images/ccfd.png"
									alt="bootstrap ecommerce templates">
							</div>

						<div style="clear: both;">&nbsp;</div>
					</div>

				</div>
			</div>
		</div>
		
		<div id="content"></div>

		<div style="clear: both;">&nbsp;</div>
	</div>
	<%@ include file='footer.jsp'%>
</body>
<%
	} else {
		response.sendRedirect("adminLogin.jsp");
	}
%>
</html>
