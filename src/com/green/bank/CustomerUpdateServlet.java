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



public class CustomerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
            int id = Integer.parseInt(request.getParameter("customeredit_id"));
			
            String f_name=request.getParameter("edit_firstname");
			String l_name = request.getParameter("edit_lastname");
			String address=request.getParameter("edit_address");
		  
			String city=request.getParameter("edit_city");
			String branch = request.getParameter("edit_branch");
			
		  
			String username=request.getParameter("edit_username");
			String password=request.getParameter("edit_password");
			String phone=request.getParameter("edit_phone");
			String email = request.getParameter("edit_email");
			String account_type=request.getParameter("edit_accountType");
			String gender = request.getParameter("edit_gender");
			String reg_date=request.getParameter("edit_reg");
		  
            String update="Customer1";
			int count=0;
			try {
				JDBC_Connect connect = new JDBC_Connect();
				Connection conn;
				conn = connect.getConnection();
				PreparedStatement ps = conn.prepareStatement("update customer set f_name=? , l_name=? ,address=?,city=?,branch=?,username=? ,password=?,phone=?,email=?,account_type=?,gender=?,reg_date=? where id= ?");
				ps.setString(1,f_name);
				ps.setString(2, l_name);
				ps.setString(3, address);
				ps.setString(4, city);
				ps.setString(5,branch);
				ps.setString(6,username);
				ps.setString(7,password);
				ps.setString(8,phone);
				ps.setString(9,email);
				ps.setString(10,account_type);
				ps.setString(11,gender);
				ps.setString(12,reg_date);
				ps.setInt(13,id);

				count=ps.executeUpdate();
				
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(count>0) {
				System.out.println("resiger");
				request.setAttribute("success",update);
				RequestDispatcher rd = request.getRequestDispatcher("ViewCustomerDetails.jsp");
				
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("ViewCustomerDetails.jsp");
				request.setAttribute("error", "yes1");
				rd.forward(request, response);
			
			}
	}    
   
}
