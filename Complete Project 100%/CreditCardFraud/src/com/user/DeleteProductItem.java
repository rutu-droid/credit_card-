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

//@WebServlet(name = "DeleteProductItem", urlPatterns = { "/DeleteProductItem" })
@WebServlet("/DeleteProductItem")
public class DeleteProductItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteProductItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	String p_id=request.getParameter("p_id");
	
	try {
		Connection con = DbConnection.getConnection();
		PreparedStatement ps=con.prepareStatement("DELETE FROM `addtocart` WHERE p_id = '"+p_id+"'");
		int i=ps.executeUpdate();
	    if(i>0)
	    {
	    	response.sendRedirect("AddToCart_Product.jsp?delete");
	    }
	    else{
	    	response.sendRedirect("AddToCart_Product.jsp?fail=delete");
	    }    	
	    }
	catch(Exception e)
	{
		System.out.println(e);
	}	
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
