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

@WebServlet("/userPurchase")
public class userPurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	String input;

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
		
			int v1, v2, v3, v4;
			v1 = v2 = v3 = v4 = 0;

			String ch1 = req.getParameter("ch1");
			String ch2 = req.getParameter("ch2");
			String ch3 = req.getParameter("ch3");
			String ch4 = req.getParameter("ch4");
			
			String cust_id = req.getParameter("cust_id");
			
			HttpSession session=req.getSession();
			session.setAttribute("customer_id", cust_id);
			System.out.println("user name is purchase "+cust_id);
			
			if (ch1 != null) {
				v1 = Integer.parseInt(ch1);
			}
			if (ch2 != null) {
				v2 = Integer.parseInt(ch2);
			}

			if (ch3 != null) {
				v3 = Integer.parseInt(ch3);
			}
			if (ch4 != null) {
				v4 = Integer.parseInt(ch4);
			}

			int total = v1 + v2 + v3 + v4;
			System.out.println("c value. . . .. " + total);
			System.out.println("c value. . . .. " + v1);
			System.out.println("c value. . . .. " + v2);
			System.out.println("c value. . . .. " + v3);
			System.out.println("c value. . . .. " + v4);
			// System.out.println("c value. . . .. " +total);

			System.out.println("ch1 value. . . .. " + ch1);
			System.out.println("ch2 value. . . .. " + ch2);
			System.out.println("ch3 value. . . .. " + ch3);
			System.out.println("ch4 value. . . .. " + ch4);
			
			res.sendRedirect("sequrityAnswer1.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
