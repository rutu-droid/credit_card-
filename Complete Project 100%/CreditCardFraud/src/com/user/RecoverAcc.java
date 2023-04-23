package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DbConnection;

@WebServlet("/RecoverAcc")
public class RecoverAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RecoverAcc() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String customer_id = request.getParameter("customer_id");
		System.out.println("Customer Id:= "+customer_id);
		
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps1 = con.prepareStatement("UPDATE `user_info` SET status='reg' WHERE customer_id = '"+customer_id+"'");
			ps1.executeUpdate();
			response.sendRedirect("adHome.jsp?update");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
