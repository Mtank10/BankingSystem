package com.green.bank;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.bank.database.DatabaseOperations;
import com.green.bank.model.AdminModel;

/**
 * Servlet implementation class AdminRegServlet
 */
public class AdminRegServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int a_id;
	String email,username,password,cpassword,usertype;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		username=request.getParameter("username");
		email = request.getParameter("email");
		password=request.getParameter("password");
		cpassword=request.getParameter("confirmpassword");
		usertype=request.getParameter("usertype");
        Random rand = new Random();
		int random_num = 100000 + rand.nextInt(999999);
		a_id = random_num;
		System.out.println(a_id);
		
		AdminModel fModel = new AdminModel();
		fModel.setA_id(a_id);
		fModel.setEmail(email);
		fModel.setUsername(username);
		fModel.setPassword(password);
		fModel.setConfirmPassword(cpassword);
		fModel.setUsertype(usertype);

		try {
			DatabaseOperations operations = new DatabaseOperations();
			boolean check =  operations.insertAdminDetails(fModel);
			
			if(check){
				System.out.println("resiger");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				request.setAttribute("Admin_details", fModel);
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				request.setAttribute("error", "yes");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
