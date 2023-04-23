<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
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
            String cust_id = null;

            if (session.getAttribute("customer_Id") != null) 
            {
                cust_id = (String) session.getAttribute("customer_Id");
                System.out.println("Session id is "+cust_id);

        %>
        

<%
      
        if(request.getParameter("status")!=null){
        out.println("<script>alert('Successfully Save!')</script>");
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
						<br /> <br /> <strong><font size="6">Secured
								Information</font> </strong> <br /> <br />
								
							
						<form action="sinfo" method="post">
							<table align="center" class="rcorners3" cellpadding="10" cellspacing="10">
									<tr align="center">
									<input type="hidden" name="c_id" id="c_id" value="<%=cust_id%>"/>
										<td><strong><font size="4"> 1. </font></strong></td>
										<td><select  name="que1" id="que1" style="width: 100%; height: 35px;">
												<option value="What is your UID number?">What is your UID number?</option>
												<option value="What is your PAN Card Number?">What is your PAN Card Number?</option>
												<option value="What is your Votter ID number?">What is your Votter ID number?</option>
 
										</select></td>
										<td></td>

										<td><font size="4"><b>Answer</b></font></td>


										<td><input type="password" name="ans1" id="ans2"
											style="width: 150px; height: 25px;"></input></td>
									</tr>
									<tr align="center">
										<td><strong><font size="4"> 2. </font></strong></td>
										<td><select  name="que2" id="que2" style="width: 100%; height: 35px;">
												<option value="What is your First Mobile Number?">What
													is your First Mobile Number?</option>
												<option value="What is your First Mobile Handset?">What
													is your First Mobile Handset?</option>
												<option value="Whoose your First Best Friend?">What
													is First Computer Name?</option>
										</select></td>
										<td></td>
										<td><font size="4"><b>Answer</b></font></td>
										<td><input type="password" name="ans2" id="ans2"
											style="width: 150px; height: 25px;"></input></td>
									</tr>
									<tr align="center">
										<td><strong><font size="4"> 3. </font></strong></td>
										<td><select name="que3" id="que3" style="width: 100%; height: 35px;">
												<option value="What is your Date of Birth?">What is
													your Date of Birth?</option>
												<option value="What is your Mother Date of Birth?">What
													is your Mother Date of Birth?</option>
												<option value="What is your Father Date of Birth?">What
													is your Father Date of Birth?</option>
										</select></td>
										<td></td>
										<td><font size="4"><b>Answer</b></font></td>
										<td><input type="password" name="ans3" id="ans3" 
										style="width: 150px; height: 25px;"></input></td>
									</tr>
									<tr align="right">
										<td></td>
										<td><input type="submit" class="button" value="Save & Continue" /></td>
										<td></td>
										<td></td>
										<td align="left"><input type="reset" class="button" value="Reset" /></td>
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
<%
            } else {
//               System.out.println("Else block");
            	response.sendRedirect("userReg.jsp");
            }
        %>

</html>
