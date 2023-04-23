<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
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

		<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<%@ include file='logo.jsp'%>
			</div>
			<div id="menu-wrapper">
				<ul id="menu">
					<li><a href="adHome.jsp"><span>Home</span></a></li>
					<li><a href="addAccount.jsp"><span>Add Account</span></a></li>
					<li class="current_page_item"><a href="CustomerInfo.jsp"><span>Customer Details</span></a></li>
					<!-- <li><a href="#"><span>Blocked Account</span></a></li> -->
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
						<br /> <br /> 
						
						<strong><font size="6">Add Account</font> </strong>
						<br /> <br />
						<table class="table table-striped">
								<tbody>
										<tr class="techSpecRow">
											<th class="techSpecTD1">Sr.No.</th>
											<th class="techSpecTD2">Customer Name</th>
											<th class="techSpecTD2">Contact No.</th>
											<th class="techSpecTD2">Address</th>
											<th class="techSpecTD2">Email Id</th>
											<th class="techSpecTD2">Status</th>
										</tr>
									</tbody>
								<%
								Connection con=DbConnection.getConnection();
								PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `personale_info`");
								ResultSet rs1 = ps1.executeQuery();
								int i=0;
								
								while (rs1.next()) 
								{
									i=i+1;
									//String id=rs1.getString("id");
									
								%>
										<tr class="techSpecRow">
											<td class="techSpecTD1"><%=i %></td>
											<td class="techSpecTD2"><%=rs1.getString("fname")%>&nbsp;<%=rs1.getString("lame")%></td>	
											<td class="techSpecTD2"><%=rs1.getString("mobile") %></td>
											<td class="techSpecTD2"><%=rs1.getString("Address")%>,&nbsp;<%=rs1.getString("City")%></td>
											<td class="techSpecTD2"><%=rs1.getString("email_id") %></td>
											<td class="techSpecTD2"><b>Active</b></td>
										</tr>
								<%} %>	
								</table>
								
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
