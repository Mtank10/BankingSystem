package com.green.bank;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

import com.green.bank.database.DatabaseOperations;
import com.green.bank.model.FeedbackModel;

public class FeedbackServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	int f_id,account_no;
	String email,comment,name,experience;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		email = request.getParameter("email");
		
		comment=request.getParameter("comments");
		experience=request.getParameter("experience");
        Random rand = new Random();
		int random_num = 100000 + rand.nextInt(999999);
		f_id = random_num;
		System.out.println(f_id);
		
		FeedbackModel fModel = new FeedbackModel();
		fModel.setF_id(f_id);
		
		fModel.setEmail(email);
		fModel.setComment(comment);
		fModel.setExperience(experience);
		

		try {
			DatabaseOperations operations = new DatabaseOperations();
			boolean check =  operations.insertfeedbackDetails(fModel);
			
			if(check){
				RequestDispatcher rd = request.getRequestDispatcher("Feedback_process.jsp");
				request.setAttribute("feedback_details", fModel);
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
				request.setAttribute("error", "yes");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
