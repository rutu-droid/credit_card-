package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

@WebServlet("/persoalInfo")
public class persoalInfo extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps, ps1, ps2;
	ResultSet rs, rs1, rs2;
	String fname;
	String lname;
	String dob;
	String gender;
	String address;
	String city;
	String email;
	String mobile;
	String c_date;

	public void init(ServletConfig config) throws ServletException {

		try {

			con = DbConnection.getConnection();
			System.out.println("connection is " + con);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		fname = req.getParameter("fname");
		lname = req.getParameter("lname");
		dob = req.getParameter("dob");
		gender = req.getParameter("gender");
		address = req.getParameter("address");
		city = req.getParameter("city");
		email = req.getParameter("email");
		mobile = req.getParameter("mobile");

		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		c_date = ft.format(dNow);

		System.out.println("Current Date: " + c_date);

		System.out
				.println("-------Catch values of patient while registration------");
		System.out.println("fname " + fname);
		System.out.println("lname " + lname);
		System.out.println("dob " + dob);
		System.out.println("gender " + gender);
		System.out.println("address " + address);
		System.out.println("city " + city);
		System.out.println("email " + email);
		System.out.println("mobile " + mobile);

		try {

			ps2 = con.prepareStatement("select email_id from personale_info where email_id='"+ email + "'");
					rs2 = ps2.executeQuery();
			System.out.println("User Registration successfull of email " + rs1);
		

			if (rs2.next()) 
			{
				
				res.sendRedirect("userReg.jsp?email=fail");
				
				String customer_Id = rs2.getString("customer_Id");
			} 
			else 
			{

				System.out.println("ankita1");
				ps = con.prepareStatement(" INSERT INTO `personale_info` (`fname`, `lame`, `dob`, `gender`, `Address`, `city`, `email_id`, `mobile`,`c_date`) VALUES ('"
						+ fname
						+ "','"
						+ lname
						+ "', '"
						+ dob
						+ "', '"
						+ gender
						+ "', '"
						+ address
						+ "','"
						+ city
						+ "', '"
						+ email
						+ "', '"
						+ mobile
						+ "','"
						+ c_date
						+ "')");
				System.out.println("ankita2");
				int result = ps.executeUpdate();

				if (result > 0) {
					System.out
							.println("User Registration successfull of email "
									+ email);

					ps1 = con
							.prepareStatement("select * from personale_info where email_id='"
									+ email + "'");
					System.out
							.println("User Registration successfull of email "
									+ ps1);
					rs1 = ps1.executeQuery();
					System.out
							.println("User Registration successfull of email "
									+ rs1);
					HttpSession session = req.getSession(true);

					if (rs1.next()) {
						String customer_Id = rs1.getString("customer_Id");
						System.out.println("Cust id is " + customer_Id);

						System.out.println("Login successfully");
						session.setAttribute("customer_Id", customer_Id);
						session.setAttribute("email", email);

						res.sendRedirect("sequrityQuestion.jsp?status=success");
					}

				} else {
					System.out.println("Ragistration failed");
					// res.sendRedirect("useregister.jsp");

				}
			}
		}

		catch (Exception e1) {
			e1.printStackTrace();
		}

	}

}
