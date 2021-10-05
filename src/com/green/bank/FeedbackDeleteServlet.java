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



public class FeedbackDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
				int fid = Integer.parseInt(request.getParameter("delete_id"));
				String delete="Customer";
				int n=0;
				try {
					JDBC_Connect connect = new JDBC_Connect();
					Connection conn;
					conn = connect.getConnection();
					Statement s=conn.createStatement();
					 n=s.executeUpdate("DELETE  from feedback where fid='"+fid+"'");
					conn.close();

				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				if(n>0) {
					System.out.println("resiger");
					request.setAttribute("delete",delete);
					RequestDispatcher rd = request.getRequestDispatcher("FeedbackView.jsp");
					
					rd.forward(request, response);
				}
				else{
					RequestDispatcher rd = request.getRequestDispatcher("FeedbackView.jsp");
					request.setAttribute("error", "yes");
					rd.forward(request, response);
				
				}
			
	}    
   
}
