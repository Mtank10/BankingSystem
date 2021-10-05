package com.green.bank;
import java.io.IOException;
import java.sql.PreparedStatement;
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

import com.green.bank.database.DatabaseOperations;
import com.green.bank.database.JDBC_Connect;
import com.green.bank.model.AdminModel;



public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
            int aid = Integer.parseInt(request.getParameter("edit_id"));
			
			String username=request.getParameter("edit_username");
			String email = request.getParameter("edit_email");
			String password=request.getParameter("edit_password");
			String update_usertype=request.getParameter("update_usertype");
			String update="Customer1";
			
			int count=0;
			try {
				JDBC_Connect connect = new JDBC_Connect();
				Connection conn;
				conn = connect.getConnection();
				PreparedStatement ps = conn.prepareStatement("update admin set username=? ,password=?,email=?,usertype=? where aid= ?");
				ps.setString(1,username);
				ps.setString(2, password);
				ps.setString(3, email);
				ps.setString(4, update_usertype);
				ps.setInt(5,aid);

				count=ps.executeUpdate();
				
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(count>0) {
				System.out.println("resiger");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				request.setAttribute("success",update);
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				request.setAttribute("error", "yes1");
				rd.forward(request, response);
			
			}
	}    
   
}
