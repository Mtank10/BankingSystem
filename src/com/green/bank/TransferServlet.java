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

public class TransferServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String  username, password;
	int account_no,target_acc_no;
	Connection conn;
	Statement stmt;
	boolean pass_wrong = false;
	int own_amount, transfer_amount, recipient_amount;
	String type="transfer amount";
	   String remark="transfer amount successfull";
	Random rand = new Random();
	int random_num = 100000 + rand.nextInt(20000);
	int t_no = random_num;
	
	DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	String d = df.format(new Date());
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		account_no = Integer.parseInt(request.getParameter("account_no"));

		username = request.getParameter("username");
		target_acc_no = Integer.parseInt(request.getParameter("target_acc_no"));
		password = request.getParameter("password");
		transfer_amount = Integer.parseInt(request.getParameter("amount"));

		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();

			stmt = conn.createStatement();

			ResultSet rsOwn = stmt.executeQuery("select * from customer where id='" + account_no + "' and username='"
					+ username + "' and password='" + password + "'");

			ResultSet rstTarget = stmt.executeQuery("select * from customer where id='" + target_acc_no + "'");

			if (!rsOwn.isBeforeFirst() && !rstTarget.isBeforeFirst()) {
				request.setAttribute("isPassOK", "No");
				RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
				rd.forward(request, response);
			} else {
				System.out.println("I am in");
				ResultSet rs1 = stmt.executeQuery("select * from amount where id ='" + account_no + "'");

				while (rs1.next()) {
					own_amount = rs1.getInt(2);
				}

				if (own_amount >= transfer_amount) {
					own_amount -= transfer_amount;

					ResultSet rs2 = stmt.executeQuery("select * from amount where id ='" + target_acc_no + "'");

					while (rs2.next()) {
						recipient_amount = rs2.getInt(2);
					}

					recipient_amount += transfer_amount;

					PreparedStatement ps = conn.prepareStatement("update amount set balance=? where id= ?");
					ps.setInt(1, own_amount);
					ps.setInt(2, account_no);
					ps.executeUpdate();

					PreparedStatement ps1 = conn.prepareStatement("update amount set balance=? where id= ?");
					ps1.setInt(1, recipient_amount);
					ps1.setInt(2, target_acc_no);
					ps1.executeUpdate();
					PreparedStatement ps2 = conn.prepareStatement("insert into TransactionsDB values('"
							+ t_no + "','transfer money','" + d + "','"
							+ account_no + "','" + transfer_amount + "','transfer amount successfull','" + own_amount +"')");
					
					ps2.executeUpdate();
					conn.close();
                    System.out.println("before transfer_process");
					RequestDispatcher rd = request.getRequestDispatcher("Transfer_process.jsp");
					rd.forward(request, response);
				}else{
					conn.close();
					request.setAttribute("EnoughMoney", "No");
					RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
					rd.forward(request, response);
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
