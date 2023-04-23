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
	
%>
	<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<%@ include file='logo.jsp'%>
			</div>
			<div id="menu-wrapper">
				<ul id="menu">
					<li><a href="index.jsp"><span>Home</span></a></li>
					<li class="current_page_item"><a href="userLogin.jsp"><span>User Login</span></a></li>
					<li><a href="userReg.jsp"><span>Registration</span></a></li>
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
						<br /> <br /> 
						<br /> <br />
						
		<div class="row">
			<div class="span12">
				<div class="well np">
					<div id="myCarousel" class="carousel slide homCar">
						
				</div>
				<%
					String id=request.getParameter("id");
					String totalPrice=session.getAttribute("totalPrice").toString(); 
					//String totalPrice=request.getParameter("totalPrice");
					String r_id=request.getParameter("r_id");
					
					String cust_id=(String)session.getAttribute("customer_id");
					/* if(cust_id!=null)
					{
					System.out.println("cust id is"+cust_id); */
				%>
				
				<div class="well well-small">
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
							
								<div class="item active" align="center">
									<h1>Welcome</h1>
									<hr/>
									<form action="userPurchase" method="post">
										<table style="width: 50%">
											<tr>
												<th>Amount</th>
												<td><input type="hidden" name="p_id">
												<input type="hidden" name="totalPrice" value="<%=totalPrice %>"><h3><%=totalPrice %></h3></td>
											</tr>
											<tr>
												<th>Card Number</th>
												<td><input type="text" class="form-control" name="card_no" maxlength="12" onblur="Validate()" required>
												<input type="hidden" value="<%=cust_id %>" name="cust_id" id="cust_id" /></td>
											</tr>
											<tr>
												<th>Month and Year</th>
												<td><input type="month" class="form-control" name="month_year" required></td>
											</tr>
											<tr>
												<th>CVV Number</th>
												<td><input type="text" maxlength="3" class="form-control" name="cvv" onblur="ValidateNew()" required></td>
											</tr>
											<tr>
												<td colspan="2" align="center"><button type="submit" class="button">Pay</button></td>
											</tr>
										</table>
										</form>
										</div>
										</div>
										</div>
										</div>
										</div>
										</div>
										</div></div>
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
</html>