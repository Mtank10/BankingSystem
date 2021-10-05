<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.green.bank.database.JDBC_Connect"%>
<%@page import="com.green.bank.model.AccountModel"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page  import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit Money</title>
<link rel="stylesheet" type="text/css" href="css/feedback.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<div class="row">
		<jsp:include page="main.jsp" />
	</div>
	<%! AccountModel ac; %>

	<%
		ac = (AccountModel) session.getAttribute("userDetails");
		int account_no = ac.getAccount_no();
		JDBC_Connect connect = new JDBC_Connect();
		Connection conn = connect.getConnection();
		DatabaseOperations operations = new DatabaseOperations();
		ac = operations.getAccountDetails(conn,account_no);
	%>
	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4"
				role="alert">
				<h4 class="alert-heading">Success!</h4>
				<p>
					<strong>Your Deposit operation is complete.</strong>
				</p>
				<p class="mb-0">
					<b>Account Number: </b>
					<%=ac.getAccount_no()%>
				</p>
				<p class="mb-0">
					<b>Total Balance: </b>
					<%=ac.getAmount()%>
				</p>
				<p class="mb-0">
					<b>Account Type: </b>
					<%=ac.getAccount_type()%>
				</p>
			<%	
		//Getting Current date
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String reg_date = df.format(new Date());%>
		<p class="mb-0">
					<b>Deposit Date: </b>
					<%=reg_date%>
				</p>
			</div>
		</div>
		<!-- Footer start here -->
		
	</div>
	<div class="footer-main">
  <footer class="container-fluid text-center">
   <div class="row">
     <div class="col-sm-4">
      <h3>Contact Us</h3>
      <br>
      <ul class="widget-title1">
			<li><i class="fa fa-map-marker"></i></li>
			<li><p>
				<span><b>Head office:</b>&nbsp;&nbsp;Road-20,Block-D, Banani,
					ranchi-1113, india</span>
			</p></li>
			<li>
			<i class="fa fa-phone"></i></li>
			<li>
			<p>
				<span>8800-80-4205</span>
			</p></li><li>
			<i class="fa fa-envelope"></i></li>
			<li>
			<p>
				<span><i>contact@eBank24.com</i></span>
			</p></li><li>
			<i class="fa fa-mobile"></i></li>
			<li>
			<p>
				<span>(+880) 231432133</span>
			</p></li>
<li><p><a href="mailto:rajshivam691@gmail" title="glorythemes">rajshivam691@gmail.com</a></p></li>
</ul>
     </div>
     <div class="col-sm-4">
        <h3>Connect</h3>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-twitter"></a>
        <a href="#" class="fa fa-google"></a>
        <a href="#" class="fa fa-linkedin"></a>
        <a href="#" class="fa fa-youtube"></a>
        </div>
        <div class="col-sm-4">
        
             <h2 class="widget-title">Our mission statements:<span></span></h2>
              <p class="font-col">To deliver great personal service and
						the best financial products to our customers and the local
						communities we serve.</p>
			  <a href="#" class="btn btn-default btn-lg">Find out More</a>
        </div>
   </div>
   </footer>
   <div class="footer-copyright">
    <div class="container">
     <div class="row">
      <div class="col-md-12 text-center">
       <p>Copyright eBank24 © 2020. All rights reserved.</p>
      </div>
    </div>
   </div>
  </div>
  </div>
	
</body>
</html>