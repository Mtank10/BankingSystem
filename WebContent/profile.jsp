<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="com.green.bank.database.JDBC_Connect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.green.bank.model.AccountModel"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%!AccountModel ac;%>
 
<%
	ac = (AccountModel) session.getAttribute("userDetails");
	int account_no = ac.getAccount_no();
	JDBC_Connect connect = new JDBC_Connect();
	Connection conn = connect.getConnection();
	DatabaseOperations operations = new DatabaseOperations();
	ac = operations.getAccountDetails(conn, account_no);
%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=ac.getFirst_name() + " " + ac.getLast_name()%></title>
<link rel="stylesheet" type="text/css" href="css/profile.css">
<link rel="stylesheet" type="text/css" href="css/deposit.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>
<body>
	<div class="row">
		<jsp:include page="main.jsp" />
	</div>

	<div class="container-fullwidth">
		<div class="jumbotron col-md-6 col-md-offset-3"
			style="margin-top: 50px">
			<div class="row">
				<div class="profile-head col-md-10 col-md-offset-1">
					<div class="col-md-4 ">
						<img class="img-circle img-responsive" alt="" src="image/user.png">
					</div>


					<div class="col-md-6 ">
						<h2><%=ac.getFirst_name() + " " + ac.getLast_name()%></h2>
						<ul>
							<li class="navli"><span
								class="glyphicon glyphicon-map-marker"></span><%=ac.getEmail()%> </li>
							<li class="navli"><span class="glyphicon glyphicon-home"></span><%=ac.getBranch()%>
								</li>
							<li class="navli"><span class="glyphicon glyphicon-phone"></span>
								<%=ac.getAddress()%></li>
							<li class="navli"><span class="glyphicon glyphicon-envelope"></span><%=ac.getPhone_number()%></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="account_details col-md-10 col-md-offset-1"
					style="margin-top: 30px;">
					<h2>Account Details</h2>
					<hr class="divider">
					<table class="table table-user-information col-md-6">
						<tbody>
							<tr>
								<td><b>First Name:</b></td>
								<td><%=ac.getFirst_name()%></td>
							</tr>
							<tr>
								<td><b>Last Name:</b></td>
								<td><%=ac.getLast_name()%></td>
							</tr>
							
							<tr>
								<td><b>Account Number:</b></td>
								<td><%=ac.getAccount_no()%></td>
							</tr>
							<tr>
								<td><b>City</b></td>
								<td><%=ac.getCity()%></td>
							</tr>
							
							<tr>
								<td><b>UserName</b></td>
								<td><%=ac.getUsername()%></td>
							</tr>
							<tr>
								<td><b>Phone Number</b></td>
								<td><%=ac.getPhone_number()%></td>
							</tr>
							<tr>
								<td><b>Email</b></td>
								<td> <a href="mailto:" +<%=ac.getEmail()%>></a></td>
							</tr>
							<tr>
								<td><b>Account Type</b></td>
								<td><%=ac.getAccount_type()%></td>
							</tr>
							<tr>
								<td><b>Gender</b></td>
								<td><%=ac.getGender()%></td>
							</tr>
							<tr>
								<td><b>Registration Date</b></td>
								<td><%=ac.getReg_date()%></td>
							</tr>
							<tr>
								<td><b>Amount</b></td>
								<td><%=ac.getAmount()%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row"></div>

		<!-- Footer start here -->
				<!-- Footer start here -->
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
	</div>
</body>
</html>