<%-- <%@page import="com.code.customer.DateTimeDifference"%> --%>
<%@page import="java.util.HashMap"%>
<%-- <%@page import="com.code.admin.GlobalFunction"%>
<%@page import="jdk.nashorn.internal.objects.Global"%> --%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	if(request.getParameter("delete")!=null)
	{
	out.println("<script>alert('Product remove from Cart...!')</script>");	
	}
%>
<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<%@ include file='logo.jsp'%>
			</div>
			<div id="menu-wrapper">
				<ul id="menu">
					<li  class="current_page_item"><a href="uHome.jsp"><span>Home</span></a></li>
					<li><a href="userHome.jsp"><span>Purchase</span></a></li>
					<li><a href="#"><span>Add To Cart</span></a></li>
					<li><a href="#"><span>Payment Process</span></a></li>
					<li><a href="index.jsp?logout"><span>Logout</span></a></li>
				</ul>

				<script type="text/javascript">
					$('#menu').dropotron();
				</script>
				<!-- end #menu -->
				<div id="banner">
					<div class="contentbg">

						<div class="post">

							<h2>View Products in Cart</h2>
						</div>
						<br /> <br />
						</div>
					</div>
				</div>
				<br /> 
				<div class="well well-small">
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
								<form action="paymentProcess.jsp" method="post">
								<table align="center" class="rcorners3" cellpadding="10" cellspacing="10">
								<tbody>
										<tr class="techSpecRow">
											<th class="techSpecTD1">Sr.No.</th>
											<th class="techSpecTD2">Category</th>
											<th class="techSpecTD2">Product Name</th>
											<th class="techSpecTD2">Cust_Name</th>
											<th class="techSpecTD2">Base Price</th>
											<th class="techSpecTD2">Quantity</th>
											<th class="techSpecTD2">Total Price</th>
											<th class="techSpecTD2">Action</th>
										</tr>
									</tbody>
								<%
								String username=session.getAttribute("username").toString(); 
								String sql="select * from addtocart where request_by='"+username+"'";
								int srno=1;
								Connection con = DbConnection.getConnection();
								PreparedStatement ps = con.prepareStatement(sql);
								//ResultSet rs = ps.executeQuery();
								
								String quantity = "";
								String price = "";
								int total =0;
								int totalPrice = 0;
								ResultSet rs = ps.executeQuery();
								while(rs.next())
								{
									//System.out.println("prescription_for:=-"+ prescription_for);
									quantity = rs.getString("quantity");
									price = rs.getString("price");
									int q=Integer.parseInt(quantity);  
									int p=Integer.parseInt(price); 
									total = (q * p);
								%>
								
									<tr align="center">
											<td><%=srno++ %></td>
											<td><%=rs.getString("p_name") %></td>
											<td><%=rs.getString("category") %></td>
											<td><%=rs.getString("request_by") %></td>
											<td><%=rs.getString("price") %></td>
											<td><%=q %></td>
											
											<td><i class="fa fa-inr" style="font-size:14px">&nbsp;<%=total %></i></td>
											
											<td><a href="DeleteProductItem?p_id=<%=rs.getString("p_id")%>" class="btn btn-info btn">
	          									<span class="ace-icon fa fa-trash-o bigger-120"></span> Delete</a></td>
										<%
											totalPrice=totalPrice+total;
											}
										%>
									</tr>
									<tr>
										<td colspan="6" style="text-align:right"><b>Total Amount:</b></td>
										<td style="width:15%"><i class="fa fa-inr" style="font-size:14px">&nbsp;<%=totalPrice %></i></td>
									<%
										session.setAttribute("totalPrice", totalPrice);
									%>
										<td><a href="CancelOrder?request_by=<%=username%>" class="btn btn-info btn">
	          									<span class="ace-icon fa fa-trash-o bigger-120"></span> Cancel Order</a></td>
									</tr>
								</table>
								<%-- <h3>Parcel Delivered to "<u><%=session.getAttribute("address").toString()%></u>" to this address</h3><hr> --%>
								<a href="paymentProcess.jsp?email=<%=username%>"><b class="button"><u>Perform Payment</u></b></a></td>
					
					<br>
					<br /> <br />
					</form>
					
					</div>
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
</html>
