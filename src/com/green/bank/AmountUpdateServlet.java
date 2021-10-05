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



public class AmountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
            int id = Integer.parseInt(request.getParameter("amountedit_id"));
			
            int balance=Integer.parseInt(request.getParameter("edit_balance"));
			int interest = Integer.parseInt(request.getParameter("edit_interest"));
			String accountType=request.getParameter("edit_accountType");
		  
			String update="Customer1";

			int count=0;
			try {
				JDBC_Connect connect = new JDBC_Connect();
				Connection conn;
				conn = connect.getConnection();
				PreparedStatement ps = conn.prepareStatement("update amount set balance=?,interest=? where id= ?");
				ps.setInt(1,balance);
				ps.setInt(2, interest);
				
				ps.setInt(3,id);

				count=ps.executeUpdate();
				
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(count>0) {
				System.out.println("resiger");
				RequestDispatcher rd = request.getRequestDispatcher("AmountView.jsp");
				request.setAttribute("success",update);
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("AmountView.jsp");
				request.setAttribute("error", "yes1");
				rd.forward(request, response);
			
			}
	}    
   
}
