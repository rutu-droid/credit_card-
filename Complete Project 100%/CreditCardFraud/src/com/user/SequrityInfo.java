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

@WebServlet("/SequrityInfo")
public class SequrityInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	String que1;
	String que2;
	String que3;
	String ans1;
	String ans2;
	String ans3;
	String cust_id;

	public void init(ServletConfig config) throws ServletException {
		try {

			con = DbConnection.getConnection();

		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException 
	{
		que1 = req.getParameter("que1");
		que2 = req.getParameter("que2");
		que3 = req.getParameter("que3");
		ans1 = req.getParameter("ans1");
		ans2 = req.getParameter("ans2");
		ans3 = req.getParameter("ans3");
		cust_id = req.getParameter("c_id");

		System.out.println("que1" + que1);
		System.out.println("ans1`" + ans1);
		System.out.println("que2" + que2);
		System.out.println("ans2`" + ans2);
		System.out.println("que3" + que3);
		System.out.println("ans3`" + ans3);

		System.out
				.println("-------Catch values of patient while registration------");
		System.out.println("cust id session is" + cust_id);

		try {

			System.out.println("cust id is" + cust_id);

			ps = con.prepareStatement("insert into sequrity_que values('"
					+ cust_id + "','" + que1 + "','" + ans1 + "','" + que2
					+ "','" + ans2 + "','" + que3 + "','" + ans3 + "')");

			int result = ps.executeUpdate();
			System.out.println("ankita2");
			if (result > 0) {
				System.out.println("User Registration successfull");
				System.out.println("cust id is " + cust_id);
				res.sendRedirect("bank_Info.jsp?status=success");
			} else {
				System.out.println("Ragistration failed");
				// res.sendRedirect("useregister.jsp");
			}
		}

		catch (Exception e1) {
			e1.printStackTrace();
		}

	}

}
