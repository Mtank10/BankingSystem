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



public class FixedUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
            int fid = Integer.parseInt(request.getParameter("amountedit_id"));
			
            int balance=Integer.parseInt(request.getParameter("edit_amount"));
			String interest = request.getParameter("edit_interest");
			String year=request.getParameter("edit_year");
			String deposit_date=request.getParameter("edit_deposit_date");
		  
			String update="Customer1";

			int count=0;
			try {
				JDBC_Connect connect = new JDBC_Connect();
				Connection conn;
				conn = connect.getConnection();
				PreparedStatement ps = conn.prepareStatement("update fixed set amount=?,interest=?,year=?,deposit_date=? where ffid= ?");
				ps.setInt(1,balance);
				ps.setString(2, interest);
				ps.setString(3, year);
				ps.setString(4,deposit_date);
                 ps.setInt(5, fid);
				count=ps.executeUpdate();
				
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(count>0) {
				System.out.println("resiger");
				RequestDispatcher rd = request.getRequestDispatcher("fixeddepositview.jsp");
				request.setAttribute("success",update);
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("fixeddepositview.jsp");
				request.setAttribute("error", "yes1");
				rd.forward(request, response);
			
			}
	}    
   
}
