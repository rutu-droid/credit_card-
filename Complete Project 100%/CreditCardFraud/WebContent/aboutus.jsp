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
					<li><a href="index.jsp"><span>Home</span></a></li>

					<li><a href="userLogin.jsp"><span>User Login</span></a></li>
					<li><a href="userReg.jsp"><span>Registration</span></a></li>
					<li><a href="adminLogin.jsp"><span>Admin</span></a></li>

					<li class="current_page_item"><a href="aboutus.jsp"><span>About
								Us</span></a></li>

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
						<br /> <br /> <br /> <br />

						<p>
							<font size="5" color="white">Creadit Card Fraud Detection</font></p>
						<p>
							<font size="4"> Now a day the usage of credit cards has
								dramatically increased. As credit card becomes the most popular
								mode of payment for both online as well as regular purchase,
								cases of fraud associated with it are also rising. In this
								paper, we model the sequence of operations in credit card
								transaction processing using a Hidden Markov Model (HMM) and
								show how it can be used for the detection of frauds. An HMM is
								initially trained with the normal behavior of a cardholder. If
								an incoming credit card transaction is not accepted by the
								trained HMM with sufficiently high probability, it is considered
								to be fraudulent. At the same time, we try to ensure that
								genuine transactions are not rejected. We present detailed
								experimental results to show the effectiveness of our approach
								and compare it with other techniques available in the
								literature. </font>
						</p>




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
