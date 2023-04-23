package com.user;

import java.io.IOException;  
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

@WebServlet("/GetNumber")
public class GetNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	try{
		String bttn = request.getParameter("password");
		
		System.out.println("entered otp : "+bttn);
		
		HttpSession session = request.getSession();
		
		String email_id=(String)session.getAttribute("email_id");
		System.out.println("login for : "+email_id);

		Connection con =DbConnection.getConnection();
		Statement st = con.createStatement();
		System.out.println("l1");
		ResultSet rs = st.executeQuery("select * from user_info where email_id='"+email_id+"'");
		System.out.println("l2");
		if(rs.next()){
			System.out.println("l3");

			String customer_id = rs.getString("customer_id");
			//String fname = rs.getString("fname");
			String p = rs.getString("password");
			
			if(bttn.equalsIgnoreCase(p)){
							
				session.setAttribute("email", email_id);
				session.setAttribute("customer_id", customer_id);
				session.setAttribute("type", "user");
				response.sendRedirect("userHome.jsp?done");
				
			}else{
				
				response.sendRedirect("password1.jsp?user='incorrect'");
			}
		}

		System.out.print("button value " +bttn);
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
}
