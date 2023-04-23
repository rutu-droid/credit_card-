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

@WebServlet("/GetKeypad")
public class GetKeypad extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	try{
		String bttn =request.getParameter("otp");
		
		System.out.println("entered otp : "+bttn);
		
		HttpSession session = request.getSession();
		String org_otp=(String)session.getAttribute("otp");
		System.out.println("orignl otp is "+org_otp);
		
		String fst_otp=org_otp.substring(0, 4);
		System.out.println("fst_otp "+fst_otp);
		
		System.out.print("button value    " +bttn);
		if(bttn.equals(org_otp))
	{
		System.out.println("OTP verified successfully");
		response.sendRedirect("show_opt.jsp?Numb=otp");	
	}
	else
	{
		System.out.println("OTP is Wrong");
		response.sendRedirect("get_keypad.jsp?Number=wrong");		
	}		
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
}
