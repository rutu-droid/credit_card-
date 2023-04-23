package com.user;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AdminLogout")
public class AdminLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		try
		{
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try
		{
			HttpSession session=req.getSession();
			System.out.println("2nd session id="+session.getId());
			session.invalidate();
			session=null;
			//req.getRequestDispatcher("index.jsp").forward(req, res);
			res.sendRedirect("adminLogin.jsp");
			return;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
