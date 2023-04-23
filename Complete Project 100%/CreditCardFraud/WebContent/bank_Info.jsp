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
  padding-top: 3px;
  padding-bottom: 10px;
  padding-left: 25px;
  padding-right: 35px;
  border-style: ridge;
  font-size: 15px;
}
tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}

th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
</style>

	<script language="Javascript">
	
	function validation(){
		var ccno=document.ureg.credit_card.value;
		var accno=document.ureg.acc_no.value;
		var cifno=document.ureg.cif_no.value;
		var brnch=document.ureg.branch_code.value;
		var ifscno=document.ureg.ifsc_no.value;
		
	
	 if(ccno != "") {
             if(ccno.length < 10) {
               alert("Error: Credit card Number must contain at least 10 Digit!");
               document.ureg.credit_card.focus();
               return false;
             }
             if(accno != "") {
                 if(accno.length < 8) {
                   alert("Error: Account Number must contain at least 8 Digit!");
                   document.ureg.acc_no.focus();
                   return false;
                 }
                 if(cifno != "") {
                     if(cifno.length < 6) {
                       alert("Error: CIF Number must contain at least 6 Digit!");
                       document.ureg.cif_no.focus();
                       return false;
                     }
                     if(brnch != "") {
                         if(brnch.length < 6) {
                           alert("Error: Branch Code must contain at least 6 Digit!");
                           document.ureg.branch_code.focus();
                           return false;
                         }
                         if(ifscno != "") {
                             if(ifscno.length < 4) {
                               alert("Error: IFSC must contain at least 4 Digit!");
                               document.ureg.ifsc_no.focus();
                               return false;
                             }
	 }
	</script>
	
	<script type="text/javascript">
	function ValidateAccNumber(acc_no) {
		var fld1 = document.getElementById(acc_no);

		if (isNaN(fld1.value)) {
			alert("The Account number contains illegal characters.");
			fld1.value = "";
			fld1.focus();
			return false;
		}
	}
	</script>
	
	<script type="text/javascript">
	
	function ValidateIFSCNumber(ifsc_no) {
		var fld2 = document.getElementById(ifsc_no);

		if (isNaN(fld2.value)) {
			alert("The IFSC number contains illegal characters.");
			fld2.value = "";
			fld2.focus();
			return false;
		}
	}
	</script>
	
	<script type="text/javascript">
	
	function ValidateCIFNumber(cif_no) {
		var fld2 = document.getElementById(cif_no);

		if (isNaN(fld2.value)) {
			alert("The CIF number contains illegal characters.");
			fld2.value = "";
			fld2.focus();
			return false;
		}
	}
	</script>
	
	<script type="text/javascript">
	
	function ValidateCreditNumber(credit_card) {
		var fld3 = document.getElementById(credit_card);

		if (isNaN(fld3.value)) {
			alert("The Credit Card number contains illegal characters.");
			fld3.value = "";
			fld3.focus();
			return false;
		}
	}
	</script>
	
	<script type="text/javascript">
	function ValidateBranchNumber(branch_no) {
		var fld4 = document.getElementById(branch_no);

		if (isNaN(fld4.value)) {
			alert("The Branch Code number contains illegal characters.");
			fld4.value = "";
			fld4.focus();
			return false;
		}
	}
	</script>
	
</head>
<body>
	<%
		String cust_id = null;
		if (session.getAttribute("customer_Id") != null) {
			cust_id = (String) session.getAttribute("customer_Id");
			System.out.println("Session id is " + cust_id);
	%>
	<%
		if (request.getParameter("status") != null) {
				out.println("<script>alert('Successfully Save!')</script>");
			}
	%>
	<%
		if (request.getParameter("credit_no") != null) {
				out.println("<script>alert('Invalid Credit Card Number!')</script>");
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
						<br /> <strong><font size="6">Bank Information</font> </strong> <br />
						<form action="binfo" name="ureg" method="post" onsubmit="return validation()">
							<table align="center" class="rcorners3" cellpadding="10" cellspacing="10">
									<tr align="center">
										<input type="hidden" name="c_id" id="c_id"
											value="<%=cust_id%>" />
										<td></td>
										<td><font size="5">Credit Card No.</font></td>
										<td></td>
										<td><input type="text" name="credit_card"  id="credit_card" style="width: 150px; 
										height: 25px;" onblur="return ValidateCreditNumber('credit_card')"  required></input></td>
									</tr>
									<tr align="center">
										<td></td>
										<td><font size="5">Account Number</font></td>
										<td></td>
										<td><input type="text" name="acc_no" id="acc_no" style="width: 150px;
											height: 25px;" onblur="return ValidateAccNumber('acc_no')" required></input></td>
									</tr>
									<tr align="center">
										<td></td>

										<td><font size="5">CIF Number</font></td>
										<td></td>
										<td><input type="text" name="cif_no" id="cif_no" style="width: 150px;
											height: 25px;" onblur="return ValidateCIFNumber('cif_no')" required></input></td>
									</tr>
									<tr align="center">
										<td></td>
										<td><font size="5">Branch Code</font></td>
										<td></td>
										<td><input type="text" name="branch_code" id="branch_code" style="width: 150px;
											height: 25px;" onblur="return ValidateBranchNumber('branch_code')" required></input></td>
									</tr>
									<tr align="center">
										<td></td>
										<td><font size="5">IFSC Number</font></td>
										<td></td>
										<td><input type="text" name="ifsc_no" id="ifsc_no" style="width: 150px;
											height: 25px;" onblur="return ValidateIFSCNumber('ifsc_no')" required></input></td>
									</tr>
									<tr>
									<td></td>
									<td align="right"><input type="submit" class="button" value="Save & Continue" /></td>
									<td></td>
									<td><input type="reset" value="Reset" class="button" /></td>
									<tr></tr>
								</table>
						</form>
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
<%
	} else {
		//System.out.println("Else block");
		response.sendRedirect("userReg.jsp");
	}
%>

</html>