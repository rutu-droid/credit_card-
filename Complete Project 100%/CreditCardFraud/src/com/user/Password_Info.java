package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

@WebServlet("/Password_Info")
public class Password_Info extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	String uname, pwd, c_pwd, cust_id, email_id;

	public void init(ServletConfig config) throws ServletException {
		try {

			con = DbConnection.getConnection();

		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		uname = req.getParameter("u_name");
		pwd = req.getParameter("password");
		c_pwd = req.getParameter("c_password");
		cust_id = req.getParameter("c_id");
		email_id = req.getParameter("email_id");
		HttpSession session=req.getSession();
		String email=session.getAttribute("email").toString();

		System.out.println("uname " + uname);
		System.out.println("pass1 " + pwd);
		System.out.println("pass2 " + c_pwd);
		System.out.println("cust id " + cust_id);
		System.out.println("Email id " + email_id);

		try {

			if (pwd.equalsIgnoreCase(c_pwd)) 
			{
				ps = con.prepareStatement("insert into user_info values('"+ uname + "','" + pwd + "','reg','"+cust_id+"','"+email+"')");

				int result = ps.executeUpdate();
				System.out.println("ankita2");
				if (result > 0) {
					System.out.println("User Registration successfull");

					res.sendRedirect("userLogin.jsp?status=success");
				} else {
					System.out.println("Ragis"
							+ "tration failed");
				}
			} else {
				res.sendRedirect("passwordInfo.jsp?status1=fail");
			}
		}

		catch (Exception e1) {
			e1.printStackTrace();
		}

	}

}
