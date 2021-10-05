package com.green.bank;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.green.bank.database.DatabaseOperations;
import com.green.bank.database.JDBC_Connect;
import com.green.bank.model.AccountModel;
import com.green.bank.model.AdminModel;



public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

Connection conn;
Statement stmt;
AdminModel am = null;
boolean pass_wrong = false;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           System.out.println(email);
   		System.out.println(password);

   		try {
   			// Getting database connection
   			JDBC_Connect connect = new JDBC_Connect();
   			conn = connect.getConnection();

   			stmt = conn.createStatement();

   			ResultSet rs = stmt.executeQuery(
   					"select * from admin where password='" + password + "'" + "and email='" + email + "'");
   			
   			if (!rs.isBeforeFirst()) {
				request.setAttribute("isPassOK", "No");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
   			else {
   				while (rs.next()) {
				pass_wrong = true;
				// Setting all variables to model class
				
				
				am = new AdminModel();
				am.setUsername(rs.getString(2));
				am.setEmail(rs.getString(4));
				
				am.setPassword(rs.getString(3));
				if(rs.getString(6)=="user")
				{
					HttpSession session=request.getSession();
					session.setAttribute("loginDetails", am);
					RequestDispatcher rd=request.getRequestDispatcher("header.jsp");
				}
				// Setting Session variable for current User
				HttpSession session = request.getSession();
				session.setAttribute("loginDetails", am);

				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
	
			}
   			}
   		}catch(Exception e)
   		{
   			e.printStackTrace();
   		}
   		
	}    
   
}
