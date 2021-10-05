<%@page import="com.green.bank.model.LoanModel"%>
<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="com.green.bank.model.AccountModel"%>
<%@page import="com.green.bank.database.JDBC_Connect"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loan Process</title>

<link rel="stylesheet" type="text/css" href="css/deposit.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
<%
		int account_no = Integer.parseInt(request.getParameter("account_no"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		DatabaseOperations operations = new DatabaseOperations();
		operations.UpdateAmount(account_no, amount);
	%>

	

	
	
	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4"
				role="alert">
				<h4 class="alert-heading">Success!</h4>
				<p>
					<strong>Loan Amount has been approved.</strong>
				</p>
				<p class="mb-0">
					<b>Account Number: </b>
					<%=account_no%>
				</p>
				<p class="mb-0">
					<b>Loan Amount: </b>
					<%=amount%>
				</p>
			</div>
		</div>
		<a href="loanrequest.jsp" class="btn btn-danger" >OK</a>
		</div>
</body>
</html>