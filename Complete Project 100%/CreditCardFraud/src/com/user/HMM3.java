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


@WebServlet("/HMM3")
public class HMM3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	String ans1,ans2,ans3;
	String cust_id;


	public void init(ServletConfig config) throws ServletException 
	{
		try {
			con = DbConnection.getConnection();

		} catch (Exception e1) {
			e1.printStackTrace();

		}

	}

	protected void hmm3(HttpServletRequest req,HttpServletResponse res)
	{
		
		
		try {
			ans1=req.getParameter("ans1");
			ans2=req.getParameter("ans2");
			ans3=req.getParameter("ans3");
			cust_id = req.getParameter("c_id");
			
			System.out.println("ans1 " + ans1);
			System.out.println("ans2 " + ans2);
			System.out.println("ans3 " + ans3);
			System.out.println("hmm3 cust_id " + cust_id);

			ps = con.prepareStatement("Select * from sequrity_que where customer_id='"+ cust_id + "'");
			rs = ps.executeQuery();

			String ans_1 = null;
			String ans_2 = null;
			String ans_3 = null;
			if (rs.next()) 
			{
				ans_1 = rs.getString("ans1");
				ans_2 = rs.getString("ans2");
				ans_3 = rs.getString("ans3");
				if (ans3.equals(ans_3)) 
				{
					System.out.println("3 answer is Correct");
										
					res.sendRedirect("password1.jsp?Done=done");

				} 
				else 
				{
					ps = con.prepareStatement("update user_info set status='Block' where customer_id='"+cust_id+"'");
					
					int result = ps.executeUpdate();
					if(result>0)
					{
						System.out.println("Your account is Block");
						res.sendRedirect("userLogin.jsp?Block=true");
						
					}


				}

			}

			
		} catch (Exception e) {
			// TODO: handle exception
		}

		
		
	}

	
	
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		
		
		
		try {

			ans1 = req.getParameter("ans1");
			ans2 = req.getParameter("ans2");
			ans3 = req.getParameter("ans3");

			cust_id = req.getParameter("c_id");

			HttpSession session = req.getSession();
			session.setAttribute("customer_id", cust_id);

			System.out.println("cust id is" + cust_id);

			if(ans1!=null && ans2!=null && ans3!=null)
			{
				hmm3(req,res);
			}


		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
