<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

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
<link href="bootstrap.css" rel="stylesheet" />
<link href="stylee.css" rel="stylesheet" />
	
</head>

<body>
	<%
		if (request.getParameter("status") != null) {
			out.println("<script>alert('Login Successfully!')</script>");
		}
	%>
	<%
		if (request.getParameter("done") != null) {
			out.println("<script>alert('Your Transaction is Succesfully Domne.....!')</script>");
		}
	%>
	<%
		if (request.getParameter("Block") != null) {
			out.println("<script>alert('Your Account is Block!')</script>");
		}
	
		if (request.getParameter("Done") != null) {
			out.println("<script>alert('User Credit Card Verification is done!')</script>");
		}
		
		if (request.getParameter("add") != null) {
			out.println("<script>alert('Your Product Add To Cart Done!')</script>");
		}
	%>

	
	<%
	String cust_id=(String)session.getAttribute("customer_id");
	if(cust_id!=null)
	{
	System.out.println("cust id is"+cust_id);
	
	
	%>

	<div id="wrapper">
		<div id="header-wrapper">
		<br /> <br /> <br /> <br />
			<%-- <div id="header">
				<%@ include file='logo.jsp'%>
			</div> --%>
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
						

						<%-- <form action="userPurchase" method="post">
							<table align="center">
								<tr>
									<td><img src="images/q1.jpg" alt="aa" width="50%"
										height="50%" /></td>
									<td><img src="images/q2.jpg" alt="aa" width="50%"
										height="50%" /></td>
									<td><img src="images/q3.jpg" alt="aa" width="50%"
										height="50%" /></td>
									<td><img src="images/q4.jpg" alt="aa" width="50%"
										height="50%" /></td>
								</tr>
								<tr>
									<td><font size="3">Price: 500 $</font></td>
									<td><font size="3">Price: 1000 $</font></td>
									<td><font size="3">Price: 2000 $</font></td>
									<td><font size="3">Price: 2000 $</font></td>
									<td><input type="hidden" value="<%=cust_id %>"
										name="cust_id" id="cust_id" /></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="ch1" value="500" /></td>
									<td><input type="checkbox" name="ch2" value="1000" /></td>
									<td><input type="checkbox" name="ch3" value="2000" /></td>
									<td><input type="checkbox" name="ch4" value="2000" /></td>
									<td><input type="submit" name="one" value="Add Card" /></td>
								</tr>
								<tr>
								</tr>
							</table>
						</form> --%>
					<div class="row">
			<div class="span12">
				<!-- <div class="well np">
					<div id="myCarousel" class="carousel slide homCar">
						<div class="carousel-inner">

							<h3 align="center">View Products</h3>
						</div>
					</div>
				</div> -->
				<div class="well well-small">
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
								<form action="CustViewProducts.jsp" method="post">
									<!-- <table>
										<tr>
											<td><input type="text" name="search" required="required"></td>
											<td><input type="submit" value="Search"></td>
										</tr>
									</table> -->
								</form>
								</div>
							</div>
						</div>
					</div>
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
									<ul class="thumbnails">

										<%
											String sql="select * from product_details where status='Not_Sell'";
											if(request.getParameter("search")!=null)
											{
												String search=request.getParameter("search");
												System.out.print("Search is "+search);												
												sql="select * from product_details where category='"+search+"' AND status='Not_Sell'";
											}
											
											String username = session.getAttribute("username").toString();
											System.out.print("username " + username);
	
											Connection con = DbConnection.getConnection();
											PreparedStatement ps = con.prepareStatement(sql);
											ResultSet rs = ps.executeQuery();
											int count=0;
											while (rs.next()) {
												count=count+1;
												String file_name = rs.getString("file_name");
												String id = rs.getString("id");
												String category = rs.getString("category");
												String p_name = rs.getString("p_name");
												//String base_price = rs.getString("base_price");
												
										%>
										<li class="span3">
											<div class="thumbnail">
												<div class="caption cntr">
												<form action="AddToCart">
													<h4><%=rs.getString("category")%></h4>
													<img src="products/<%=file_name%>" alt="bootstrap-ring">
													<p><%=rs.getString("p_name")%></p>

													<p>
														<img alt="" src="products/r.jpg" style="width: 20%"><strong>&nbsp;<%=rs.getString("price")%></strong>
														<input type="number" style="width:29px;height:19px;" name="quantity" required>
													</p>
													
													<h4>
														<input type="hidden" name="id" value="<%=id%>">
														<input type="hidden" name="req_type" value="W">
														<input type="submit" class="shopBtn" value="AddToCart"><%--  <a class="shopBtn" href="AddToCart?id=<%=id%>&req_type=W" title="add to cart"> Add To Cart</a> --%>
														<!-- <input type="submit" class="shopBtn" value="Add to Cart"> -->
													</h4>
													
													<hr />
													</form>
													<br class="clr">
												</div>
											</div>
										</li>
										<%
											int rsl=count%4;
										System.out.println("RSL "+rsl);
											if(rsl==0)
											{
												%>
												</ul>
												<hr/>
												<%
											}
										
										%>

										<%
											}
										%>
									</ul>
								</div>
							</div>
							<a class="left carousel-control" href="#newProductCar"
								data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
								href="#newProductCar" data-slide="next">&rsaquo;</a>
						</div>
					</div>
					</div>
					</div>
					</div>
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
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
	}
	else
	{
		System.out.println("else block");
		response.sendRedirect("userLogin.jsp");
	}
%>
</html>