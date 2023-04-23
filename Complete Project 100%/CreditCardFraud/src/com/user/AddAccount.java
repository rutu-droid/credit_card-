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


@WebServlet("/AddAccount")
public class AddAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	
	String credi_no,balance,cust_id;
	

	public void init(ServletConfig config) throws ServletException 
	{
		try {

			con = DbConnection.getConnection();
			System.out.println("connection is " + con);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
				credi_no = req.getParameter("card_no");
		balance = req.getParameter("balance");
		cust_id = req.getParameter("c_id");
		try {
			ps = con.prepareStatement("insert into bank_balance values('"+credi_no+"','"+balance+"')");
			int result = ps.executeUpdate();
			
			HttpSession session=req.getSession();

			if (result > 0) 
			{
				
				session.setAttribute("username", cust_id);
				
				System.out.println("Account is Add Sucess");
				res.sendRedirect("addAccount.jsp");
				
				
			
			}
			
			else 
			{
				System.out.println("Account is Not Success");
			}

			
			
		} catch (Exception e) 
		{
		
		}
		
	}

}
