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

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;

	String username;
	String password;

	public void init(ServletConfig config) throws ServletException {
		try {
			con = DbConnection.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		try {

			username = req.getParameter("uname");
			password = req.getParameter("pwd");

			System.out.println("username value. . . .. " + username);
			System.out.println("password value. . . .. " + password);
			
			//ps = con.prepareStatement("select * from admin where username=? and password=?");

			ps = con.prepareStatement("select * from admin where username='"+username+"' and password='"+password+"'");
			//ps.setString(1, username);
			//ps.setString(2, password);

			rs = ps.executeQuery();
			HttpSession session = req.getSession();

			if (rs.next()) {
				System.out.println("Success login");
				String username = rs.getString("username");

				System.out.println("Login successfully");

				session.setAttribute("username", username);
				res.sendRedirect("adHome.jsp?status=succes");
			}

			else {
				System.out.println("Login failed");

				res.sendRedirect("adminLogin.jsp");
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
