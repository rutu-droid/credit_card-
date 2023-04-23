package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;
import com.user.EmailUtility;

//import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;


import java.util.Collections;
import java.util.Arrays;

@WebServlet("/Verify_Mail")
public class Verify_Mail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	
	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
		System.out.println("Hello");
		
		try
		{
			con=DbConnection.getConnection();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// reads form fields
		String recipient = request.getParameter("email_id");
		HttpSession session = request.getSession();
		try {
			System.out.println("username value. . . .. " + recipient);
			String sqll="SELECT * FROM user_info WHERE email_id='"+recipient+"'";

			ps = con.prepareStatement(sqll);
			rs = ps.executeQuery();
			

			if (rs.next()) 
			{
				System.out.println("Login successfully");
				String email_id = rs.getString("email_id");
				String customer_id = rs.getString("customer_id");
				String p = rs.getString("password");
			
				session.setAttribute("email_id", email_id);
				session.setAttribute("customer_id", customer_id);
				session.setAttribute("username", rs.getString("username"));
				session.setAttribute("type", "user");

			     PasswordAthenticationProtocol RN = new PasswordAthenticationProtocol();
			     String SecretKey = RN.generateRandomString();
			     session.setAttribute("Secretkey", SecretKey);
			     
			     System.out.println("secret key for login : "+SecretKey);
				
				 Integer[] arr = new Integer[10]; 

				 for (int i = 0; i < arr.length; i++) { 
				    arr[i] = i; 
				 } 

				 Collections.shuffle(Arrays.asList(arr)); 

				 for (int i = 0; i < arr.length; i++) { 
				    System.out.print(arr[i] + " "); 
				} 
				
				String str=Arrays.toString(arr);
				String str1=str.toString().replace("[", "").replace("]", "").replace(", ","");
				
				session.setAttribute("str1",str1);
				
				String alphabet = new String("0123456789"); // 9
				int n = alphabet.length(); // 10
				String result = new String();
				Random r = new Random(); // 11
				for (int i = 0; i < n; i++) // 12
				{
					result = result + alphabet.charAt(r.nextInt(n)); // 13
				}
				session.setAttribute("OTP",result);
				//System.out.println("Result is OTP " + result);
				String org_otp=result.substring(0,4);
				System.out.println("OTP is "+org_otp);

				String otp=(String)session.getAttribute("str1");

				//System.out.println("otp : "+otp);

				String otp1=otp.substring(0,1);
				String otp2=otp.substring(1,2);
				String otp3=otp.substring(2,3);
				String otp4=otp.substring(3,4);
				String otp5=otp.substring(4,5);
				String otp6=otp.substring(5,6);
				String otp7=otp.substring(6,7);
				String otp8=otp.substring(7,8);
				String otp9=otp.substring(8,9);
				String otp10=otp.substring(9,10);

				String subject = "OTP & Secret key for verification and Visual keypad";
				String content = "Your OTP is "+org_otp+" <br>"+
						" visual keypad :<br>"+
						""+otp1+" "+otp2+" "+otp3+" <br> "+
						 ""+otp4+" "+otp5+" "+otp6+" <br>"+
						" "+otp7+" "+otp8+" "+otp9+" <br>"+
						 ""+otp10+"";
			
				String resultMessage = "";
				try {
				//	EmailUtility.sendEmail(host, port, user, pass, recipient,subject, content);
				Mailer.EmailSending(recipient,subject, content);
					resultMessage = "The e-mail was sent successfully";
					session.setAttribute("Veriy_Mail",email_id);
							
					session.setAttribute("otp", org_otp);
					session.setAttribute("email_id", recipient);
					
					System.out.println("The e-mail was sent successfully");
					response.sendRedirect("get_keypad.jsp?mail=send");
				} catch (Exception ex) {
					ex.printStackTrace();
					resultMessage = "There were an error: Not Send Msg " + ex.getMessage();
				} 
			} 
			else { 
				System.out.println("Login failed");

				response.sendRedirect("password1.jsp?success=failed");
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
