package com.green.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 import java.text.DateFormat;
 import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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
import com.green.bank.model.FixedDepositModel;

//import oracle.net.aso.b;
//import oracle.net.aso.d;

public class FixedDepositServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String  interest_rate,deposit_amount, value,year,deposit_date;
	int account_no,  amount,f_id;
	Connection conn;
	Statement stmt;
	boolean pass_wrong = false;
     String type="fixed Deposit ";
     String remark="fixedDeposit successfully";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		account_no = Integer.parseInt(request.getParameter("account_no"));
		year = request.getParameter("year");
		interest_rate = request.getParameter("interest_rate");
		deposit_amount = request.getParameter("deposit_amount");
		value = request.getParameter("value");

		if (deposit_amount.equals("100000")) {
			amount = 100000;
		} else if (deposit_amount.equals("300000")) {
			amount = 300000;

		} else if (deposit_amount.equals("500000")) {
			amount = 500000;
		}
		Random rand = new Random();
		int random_num = 100000 + rand.nextInt(999999);
		f_id = random_num;
		System.out.println(f_id);
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String reg_date1 = df.format(new Date());
		FixedDepositModel dpModel = new FixedDepositModel();
		dpModel.setF_id(f_id);
		dpModel.setAccount_no(account_no);
		dpModel.setYear(year);
		dpModel.setDeposit_date(reg_date1);
		dpModel.setInterest_rate(interest_rate);
		dpModel.setAmount(amount);
		dpModel.setValue(value);

		try {
			JDBC_Connect connect = new JDBC_Connect();
			Connection conn = connect.getConnection();
			DatabaseOperations operations = new DatabaseOperations();


			Random rand1 = new Random();
			int random_num1 = 100000 + rand1.nextInt(20000);
			int t_no = random_num;
			
			
				
				boolean allRight = operations.insertFixedDeposit(dpModel);
				DateFormat df1 = new SimpleDateFormat("dd/MM/yyyy");
				String d = df1.format(new Date());
					PreparedStatement ps2 = conn.prepareStatement("insert into TransactionsDB values('"
							+ t_no + "','fixed deposit ','" + d + "','"
							+ account_no + "','" + amount + "','fixedDeposit amount successfull','" + amount +"')");
					
					ps2.executeUpdate();
				if(allRight) {
				request.setAttribute("fixedDeposit", dpModel);
				RequestDispatcher rd = request.getRequestDispatcher("fixed_deposit_process.jsp");
				rd.forward(request, response);}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
