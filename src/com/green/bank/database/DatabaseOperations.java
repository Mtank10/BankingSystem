package com.green.bank.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.green.bank.model.AccountModel;
import com.green.bank.model.AdminModel;
import com.green.bank.model.FeedbackModel;
import com.green.bank.model.LoanModel;
import com.green.bank.model.FixedDepositModel;


public class DatabaseOperations {
	Connection conn;
	int count1, count2;

	public boolean insertAccountDetails(AccountModel model) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps1 = conn.prepareStatement("insert into customer(id,f_name,l_name,address,city,"
					+ "branch,username,password,phone,email,account_type,gender,reg_date) values('" + model.getAccount_no()
					+ "','" + model.getFirst_name() + "','" + model.getLast_name() + "','" + model.getAddress() + "','"
					+ model.getCity() + "','" + model.getBranch() + "','" + model.getUsername()
					+ "','" + model.getPassword() + "','" + model.getPhone_number() + "','" + model.getEmail() + "','"
					+ model.getAccount_type() + "','" + model.getGender() + "','"+ model.getReg_date() + "')");
			count1 = ps1.executeUpdate();
			System.out.println("Inserted " + count1 + " row");

			PreparedStatement ps2 = conn.prepareStatement("insert into amount(id,balance,interest,account_type,c_id) values('"
					+ model.getAccount_no() + "','"+ model.getAmount() + "','" + model.getAmount() + "','" + model.getAccount_type()  +"','"+ model.getAccount_no() + "')");
			count2 = ps2.executeUpdate();

			System.out.println("Inserted " + count2 + " row");
             conn.commit();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("rolling back data here...");
			try {
				if(conn!=null)
					conn.rollback();
			}catch(SQLException e1)
			{
				e1.printStackTrace();
			}
		}

		return ((count1 > 0) && (count2 > 0));
	}

	public boolean insertLoanDetails(LoanModel model) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps1 = conn
					.prepareStatement("insert into loan(lid,amount,status,first_name,last_name,address,email,id) values('"
							+ model.getL_id() + "','" + model.getLoan_amount() + "','" + model.getStatus() + "','"
							+ model.getFirst_name() + "','" + model.getLast_name() + "','" + model.getAddress() + "','"
							+ model.getEmail() + "','" + model.getAccount_no() +"')");
			count1 = ps1.executeUpdate();

			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return (count1 > 0);
	}

	public boolean insertfeedbackDetails(FeedbackModel model) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps1 = conn
					.prepareStatement("insert into feedback(fid,email,experience,comments) values('"
							+ model.getF_id() + "','" + model.getEmail() + "','" + model.getExperience() + "','"
							+ model.getComment()  +"')");
			count1 = ps1.executeUpdate();

			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return (count1 > 0);
	}

	public boolean insertAdminDetails(AdminModel model) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps1 = conn.prepareStatement("insert into admin values('"
							+ model.getA_id() + "','" + model.getUsername() + "','" + model.getPassword() + "','"
							+ model.getEmail() + "','" + model.getConfirmPassword() + "','" + model.getUsertype() +"')");
			count1 = ps1.executeUpdate();

			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return (count1 > 0);
	}

	public boolean updateAdminDetails(AdminModel model1,int aid) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps = conn.prepareStatement("update admin set username=? ,password=?,email=? where aid= ?");
			ps.setString(1, model1.getUsername());
			ps.setString(2, model1.getPassword());
			ps.setString(3, model1.getEmail());
			ps.setInt(4,aid);

			count1=ps.executeUpdate();
			
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return (count1 > 0);
	}


	
	public boolean insertFixedDeposit(FixedDepositModel model) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();

			

			PreparedStatement ps1 = conn
					.prepareStatement("insert into fixed(ffid,year,interest,amount,deposit_date,id) values('"
							+ model.getF_id() + "','" + model.getYear() + "','" + model.getInterest_rate() + "','"
							+ model.getAmount() + "','" + model.getDeposit_date()+ "','" + model.getAccount_no() + "')");
			count1 = ps1.executeUpdate();
			System.out.println("Inserted " + count1 + " row");

			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ((count1 > 0));
	}

	public AccountModel getAccountDetails(Connection conn, int Account_no) throws Exception {
		AccountModel am = new AccountModel();

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from customer where id ='" +Account_no + "'");
		while (rs.next()) {

			// Setting all variables to model class
			am = new AccountModel();
			am.setAccount_no(rs.getInt(1));
			am.setFirst_name(rs.getString(2));
			am.setLast_name(rs.getString(3));
			am.setAddress(rs.getString(4));
			am.setCity(rs.getString(5));
			am.setBranch(rs.getString(6));
			am.setUsername(rs.getString(7));
			am.setPassword(rs.getString(8));
			am.setPhone_number(rs.getString(9));
			am.setEmail(rs.getString(10));
			am.setAccount_type(rs.getString(11));
			am.setGender(rs.getString(12));
			am.setReg_date(rs.getString(13));
		}
		ResultSet rs1 = stmt.executeQuery("select * from amount where id ='" + am.getAccount_no() + "'");
		while (rs1.next()) {
			am.setAccount_no(rs1.getInt(1));
			am.setAmount(rs1.getInt(2));
		}
		return am;
	}
	

	public AdminModel getAdminDetails(Connection conn , int aid) throws Exception{
		AdminModel am=new AdminModel();
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select * from admin where aid='" +aid+"'");
		while(rs.next()) {
			am=new AdminModel();
			am.setA_id(rs.getInt(1));
			am.setUsername(rs.getString(2));
			am.setEmail(rs.getString(4));
		}
		return am;
	}
	
	public void UpdateAmount(int account_no, int loan_amount) throws SQLException {
		int current_amount = 0;
		JDBC_Connect connect = new JDBC_Connect();
		Connection conn = connect.getConnection();

		Statement stmt = conn.createStatement();
		ResultSet rs1 = stmt.executeQuery("select * from amount where id ='" + account_no + "'");

		while (rs1.next()) {
			current_amount = rs1.getInt(2);

		}

		current_amount += loan_amount;

		// Updating Loan amount
		PreparedStatement ps = conn.prepareStatement("update amount set balance=? where id= ?");
		ps.setInt(1, current_amount);
		ps.setInt(2, account_no);
		ps.executeUpdate();

		PreparedStatement ps1 = conn.prepareStatement("update loan set status=? where id= ?");
		ps1.setString(1, "success");
		ps1.setInt(2, account_no);
		ps1.executeUpdate();

		conn.close();

	}
	
}
