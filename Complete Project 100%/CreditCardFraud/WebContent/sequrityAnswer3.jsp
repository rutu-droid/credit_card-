<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN"
	dir="ltr">
<head profile="http://gmpg.org/xfn/11">

<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

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
		String cust_id = null;

		if (session.getAttribute("customer_Id") != null) {
			cust_id = (String) session.getAttribute("customer_Id");
			System.out.println("Session id is " + cust_id);
	%>
	<%
      
        if(request.getParameter("ans2")!=null){
        out.println("<script>alert('Your Answer is Correct!')</script>");
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
					<li><a href="#"><span>Logout</span></a></li>
					<li><a href="#"><span>About Us</span></a></li>
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
								Answer</font> </strong> <br /> <br />





						<%
							Connection con = DbConnection.getConnection();
							//String Userid = (String) session.getAttribute("username");
							//	System.out.println("User id Is " + Userid);
							Statement st = con.createStatement();
							ResultSet rs = st
									.executeQuery("select * from sequrity_que where customer_Id='"+cust_id+"'");
							String que1, que2, que3;
							que1 = que2 = que3 = null;
							String ans1 = null, ans2 = null;
							while (rs.next()) {

								que1 = rs.getString("que1");
								que2 = rs.getString("que2");
								que3 = rs.getString("que3");
								ans1 = rs.getString("ans1");
								ans2 = rs.getString("ans2");

								String custmr_id = rs.getString("customer_id");

								System.out.println("Customer id is" + custmr_id);
								System.out.println("que1 is" + que1);
								System.out.println("que2 is" + que2);
								System.out.println("que3 is" + que3);
								System.out.println("ans1 is" + ans1);
								System.out.println("ans2 is" + ans2);

							}
						%>

						<form action="hmm3" method="post">
							<center>
								<table>
									<tr>
										<td><font size="4"><strong>1</strong></font></td>
										<td><input type="text" name="que1" id="que1" value='<%=que1%>' style="width: 200px; height: 30px" /></td>
										<td>
										<input type="hidden" name="c_id" id="c_id" value="<%=cust_id %>" /></td>
										<td><font size="4"><strong>Answer</strong></font></td>
										<td><input type="password" name="ans1" id="ans1" value='<%=ans1%>' style="width: 200px; height: 30px" /></td>
										<td><img src="images/correct.JPG"
											style="width: 30px; height: 30px"></img></td>


									</tr>
									<tr>
										<td><font size="4"><strong>2</strong></font></td>
										<td><input type="text" name="que2" id="que2"
											value='<%=que2%>' style="width: 200px; height: 30px" /></td>
										<td></td>
										<td><font size="4"><strong>Answer</strong></font></td>
										<td><input type="password" name="ans2" id="ans2"
											value='<%=ans2%>' style="width: 200px; height: 30px" /></td>

										<td><img src="images/correct.JPG"
											style="width: 30px; height: 30px"></img></td>


									</tr>
									<tr>
										<td><font size="4"><strong>3</strong></font></td>
										<td><input type="text" name="que1" id="que3"
											value='<%=que3%>' style="width: 200px; height: 30px" /></td>
										<td></td>
										<td><font size="4"><strong>Answer</strong></font></td>
										<td><input type="password" name="ans3" id="ans3"
											style="width: 200px; height: 30px" /></td>
										<td><input type="submit" value="Verify" /></td>


									</tr>




								</table>
							</center>



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
		//               System.out.println("Else block");
		response.sendRedirect("userReg.jsp");
	}
%>

</html>