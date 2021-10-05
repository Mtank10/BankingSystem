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

import com.green.bank.database.JDBC_Connect;
import com.green.bank.model.AccountModel;

public class WithdrawServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String  username, password;
	Connection conn;
	Statement stmt;
	boolean pass_wrong = false;
	int account_no,current_amount, withdraw_amount;
   String type="withdraw amount";
   String remark="withdraw mount successfull";
	Random rand = new Random();
	int random_num = 100000 + rand.nextInt(20000);
	int t_no = random_num;
	DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	String d = df.format(new Date());
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		account_no = Integer.parseInt(request.getParameter("account_no"));
		username = request.getParameter("username");
		password = request.getParameter("password");
		withdraw_amount = Integer.parseInt(request.getParameter("amount"));
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();

			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customer where id='" + account_no + "' and username='"
					+ username + "' and password='" + password + "'");

			if (!rs.isBeforeFirst()) {
				request.setAttribute("isPassOK", "No");
				RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
				rd.forward(request, response);
			} else {
				System.out.println("I am in");
				ResultSet rs1 = stmt.executeQuery("select * from amount where id ='" + account_no + "'");

				while (rs1.next()) {
					current_amount = rs1.getInt(2);

					System.out.println(current_amount);
				}

				if (current_amount >= withdraw_amount) {
					current_amount -= withdraw_amount;

					PreparedStatement ps = conn.prepareStatement("update amount set balance=? where id= ?");
					ps.setInt(1, current_amount);
					ps.setInt(2, account_no);
					ps.executeUpdate();
					PreparedStatement ps1 = conn.prepareStatement("insert into TransactionsDB values('"
							+ t_no + "','withdraw money','" + d + "','"
							+ account_no + "','" + withdraw_amount + "','withdraw amount successfull','" + current_amount +"')");
					
					ps1.executeUpdate();
					conn.close();

					RequestDispatcher rd = request.getRequestDispatcher("Withdraw_process.jsp");
					rd.forward(request, response);
				} else {
					conn.close();
					request.setAttribute("EnoughMoney", "No");
					RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
					rd.forward(request, response);
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
