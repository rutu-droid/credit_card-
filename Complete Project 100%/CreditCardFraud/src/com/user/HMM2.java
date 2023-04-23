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

@WebServlet("/HMM2")
public class HMM2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	String ans1, ans2, ans3;
	String cust_id;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			con = DbConnection.getConnection();

		} catch (Exception e1) {
			e1.printStackTrace();

		}
	}

	
	protected void hmm2(HttpServletRequest req, HttpServletResponse res) {
		try {
			ans1 = req.getParameter("ans1");
			ans2 = req.getParameter("ans2");
			cust_id = req.getParameter("c_id");

			System.out.println("ans1 " + ans1);
			System.out.println("ans2 " + ans2);

			System.out.println("2 cust_id " + cust_id);

			ps = con.prepareStatement("Select * from sequrity_que where customer_id='"+ cust_id + "'");
			rs = ps.executeQuery();
			String ans_1 = null;
			String ans_2 = null;
			if (rs.next()) {
				ans_1 = rs.getString("ans1");
				ans_2 = rs.getString("ans2");

				if (ans2.equals(ans_2)) {
					System.out.println("2 answer is Correct");
					res.sendRedirect("sequrityAnswer3.jsp?ans2=true");
				} else {
					ps = con.prepareStatement("update user_info set status='Block' where customer_id='"
							+ cust_id + "'");

					int result = ps.executeUpdate();

					if (result > 0) {
						System.out.println("Your account is Block");
						res.sendRedirect("userLogin.jsp?Block=true");
					}
				}
			}
		} catch (Exception e) {

		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		try {

			ans1 = req.getParameter("ans1");
			ans2 = req.getParameter("ans2");
			ans3 = req.getParameter("ans3");

			cust_id = req.getParameter("c_id");

			HttpSession session = req.getSession();
			session.setAttribute("customer_id", cust_id);

			System.out.println("cust id is" + cust_id);

			if (ans1 != null && ans2!= null) {
				hmm2(req, res);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
