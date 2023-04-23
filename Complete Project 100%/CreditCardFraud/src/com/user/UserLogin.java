package com.user;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;

	String username;
	String password;

	public void init(ServletConfig config) throws ServletException 
	{
		try {
			con = DbConnection.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{

		try {

			username = req.getParameter("uname");
			password = req.getParameter("pwd");
			PrintWriter out = res.getWriter();

			System.out.println("username value. . . .. " + username);
			System.out.println("password value. . . .. " + password);

			ps = con.prepareStatement("select * from user_info where username=? and password=?");

			ps.setString(1, username);
			ps.setString(2, password);

			rs = ps.executeQuery();
			HttpSession session = req.getSession();

			if (rs.next()) 
			{
				String user_name = rs.getString("username");
				String pass_word = rs.getString("password");
				String cust_id = rs.getString("customer_id");
				
				
				String status = rs.getString("status");
				
				if (status.equals("Block")) 
				{
					System.out.println("if block");
					res.sendRedirect("userLogin.jsp?Message=Block");
				}
				else 
				{
					System.out.println("Success login");

					String username = rs.getString("username");

					System.out.println("Login successfully");

					session.setAttribute("customer_id", cust_id);
					session.setAttribute("username", username);
					res.sendRedirect("uHome.jsp?status=sucess");
				}
			} else 
			{
				System.out.println("Login failed");
				System.out.println("else 2 ");

				res.sendRedirect("userLogin.jsp?msg=LoginFailed");
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
