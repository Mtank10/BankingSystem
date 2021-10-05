<%@page import="com.green.bank.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String value = request.getParameter("value");
%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Fixed Deposit</title>
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
		<div class="row scheme-plan">
			<div class="col-md-6 col-md-offset-3">
				<h3><%=value%>
					Fixed Deposit
				</h3>
				<p style="margin-left: 30px;">Introducing the new Bronze Deposit
					Scheme linked pricing for your Mortgage Loan. The interest rate for
					your Mortgage Loan will be calculated based on the sum of the FDR
					and a fixed margin.</p>
				<h3 style="margin-top: 50px;">Eligibility</h3>
				<ul>
					<%
						if (value.equals("Bronze")) {
					%>
					<li>1 year</li>
					<li>Interest: 8%</li>
					<%
						} else if (value.equals("Silver")) {
					%>
					<li>3 year</li>
					<li>Interest: 10%</li>
					<%
						} else if (value.equals("Gold")) {
					%>
					<li>5 year</li>
					<li>Interest: 12%</li>
					<%
						}
					%>
				</ul>
			</div>
           <%
				AccountModel ac = null;
				ac = (AccountModel) session.getAttribute("userDetails");
			%>
           
			


			<div class="form col-md-6 col-md-offset-3" style="margin-top: 50px;">
				<div class="form-group">
					<div style="padding-top: 5px; padding-left: 15px">
						<label>Deposit Amount</label>
					</div>
					<div class="col-md-4" style="margin-top: 10px;">
						<form action="FixedDepositServlet" method="post">
							<%
								if (ac != null) {
							%>
							<input type="hidden" name="account_no"
								value="<%=ac.getAccount_no()%>" />
                              <%
								if (value.equals("Bronze")) {
							%>
							
							<input type="hidden" name="year" value="1" /> <input
								type="hidden" name="interest_rate" value="8" />
								<input type="hidden" name="value" value="" /> 
							<select class="form-control btn btn-default"
								name="deposit_amount" required>
								<option selected disabled>Choose Deposit amount</option>
								<option>500000</option>
								<option>1000000</option>
								<option>1500000</option>
							</select>
							<%
								} else if (value.equals("Silver")) {
							%>
							<input type="hidden" name="year" value="3" /> <input
								type="hidden" name="interest_rate" value="10" />
								<input type="hidden" name="value" value="" /> 
							<select class="form-control btn btn-default"
								name="deposit_amount" required>
								<option selected disabled>Choose Deposit amount</option>
								<option>500000</option>
								<option>1000000</option>
								<option>1500000</option>
							</select>
							<%
								} else if (value.equals("Gold")) {
							%>
							<input type="hidden" name="year" value="5" /> <input
								type="hidden" name="interest_rate" value="12" />
								<input type="hidden" name="value" value="" /> 
							<select class="form-control btn btn-default"
								name="deposit_amount" required>
								<option selected disabled>Choose Deposit amount</option>
								<option>500000</option>
								<option>1000000</option>
								<option>1500000</option>
							</select>
							<%
								}
							%>

							<%
								}
							%>
							
							<%
								if (ac != null) {
							%>
							<%
								String Not_Enough = (String) request.getAttribute("Not_Enough");
									if (Not_Enough != null && Not_Enough.equals("Yes")) {
							%>
							<div class="col-md-12" style="margin-top:10px;">
								<div class="alert alert-danger" role="alert">
									<strong>Sorry!</strong> You do not have enough money.
								</div>
							</div>
							<%
								}
							%>
							<div class="row" style="margin-top: 20px; margin-left: 2px">
								<input type="submit" value="Deposit"
									class="btn btn-lg btn-success" />
							</div>
							<%
								} else {
							%>

							<div class="row">
								<div class="alert alert-warning" role="alert"
									style="margin-top: 20px;">
									<strong>Warning!</strong> You have to login first.
								</div>
							</div>
                         <%
								}
							%>
							
						</form>
					</div>
				</div>
			</div>
		</div>

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