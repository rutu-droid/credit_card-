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

import com.util.DbConnection;

@WebServlet("/Bank_Info")
public class Bank_Info extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps, ps1;
	ResultSet rs, rs1;
	String credit_card;
	String acc_no;
	String cif_no;
	String branch_code;
	String ifsc_no;
	String cust_id;

	public void init(ServletConfig config) throws ServletException {
		try {

			con = DbConnection.getConnection();

		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		credit_card = req.getParameter("credit_card");
		acc_no = req.getParameter("acc_no");
		cif_no = req.getParameter("cif_no");
		branch_code = req.getParameter("branch_code");
		ifsc_no = req.getParameter("ifsc_no");

		cust_id = req.getParameter("c_id");

		System.out.println("credit card " + credit_card);
		System.out.println("acc number " + acc_no);
		System.out.println("cif number " + cif_no);
		System.out.println("Branch Code " + branch_code);
		System.out.println("ifsc number " + ifsc_no);

		System.out
				.println("-------Catch values of patient while registration------");
		System.out.println("cust id session is" + cust_id);

		try {

			ps1 = con.prepareStatement("select credit_card_no from bank_balance where credit_card_no='"	+ credit_card + "'");
			rs1 = ps1.executeQuery();

			if (rs1.next()) 
			{

				System.out.println("cust id is" + cust_id);

				ps = con.prepareStatement("insert into bank_info values('"+ cust_id + "','" + credit_card + "','" + acc_no
						+ "','" + cif_no + "','" + branch_code + "','"
						+ ifsc_no + "')");

				int result = ps.executeUpdate();
				System.out.println("ankita2");
				if (result > 0) 
				{
					System.out.println("Data Store successfull");
					System.out.println("cust id is " + cust_id);
					res.sendRedirect("passwordInfo.jsp?status=success");
				}
				else 
				{
					System.out.println("Data not Save");
					// res.sendRedirect("useregister.jsp");
				}

				// String customer_Id = rs1.getString("customer_Id");
			} else {
				res.sendRedirect("bank_Info.jsp?credit_no=fail");
			}
		}

		catch (Exception e1) {
			e1.printStackTrace();
		}

	}

}
