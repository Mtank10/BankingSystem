<%@page import="com.green.bank.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deposit money</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/feedback.css" type="text/css">
</head>
<body>
 <div class="row">
		<jsp:include page="main.jsp" />
	</div>
	<div class="container-fullwidth main">
		<%
			AccountModel ac = null;
		%>
		<%
			ac = (AccountModel) session.getAttribute("userDetails");
			if (ac != null) {
		%>
		<div class="row" style="margin-top: 50px;">
			<div class="col-md-4 col-md-offset-4">
				<form role="form" method="post" action="DepositServlet">
					<h2 style=" text:center;">Deposit Form</h2>
					<div class="col-md-12">
						<hr class="colorgraph">
					</div>
					<label  class="col-md-4 control-label">Account No</label>
					<div class="col-sm-8 form-group">
						<input type="text" required placeholder="Enter Account No.."
							class="form-control" name="account_no"
							value="<%=ac.getAccount_no()%>">
					</div>
					<label  class="col-md-4 control-label">User Name</label>
					<div class="col-sm-8 form-group">
						<input type="text" required placeholder="Enter User Name.."
							class="form-control" name="username"
							value="<%=ac.getUsername()%>">
					</div>

					<label  class="col-md-4 control-label">Password</label>
					<div class="col-sm-8 form-group">
						<input type="password" required placeholder="Enter Password.."
							class="form-control" name="password">
					</div>
					
					<label class="col-md-4 control-label">Amount</label>
					<div class="col-sm-8 form-group">
						<input type="number" required placeholder="Enter Amount.."
							class="form-control" name="amount">
					</div>
					<label  class="col-md-4 control-label">Date</label>
					<div class="col-sm-8 form-group">
						<input type="date" required value="10/10/1998"
							class="form-control" name="date">
					</div>
					<label class="col-md-4 control-label">Choose Account type</label>
						<div class="col-sm-8 form-group">
										<div class="input-group-btn">
											<select class="form-control btn btn-default"
												name="account_type" required>
												<option>Saving Account</option>
												<option>Current Account</option>
												<option>Zero Account</option>
											</select>
										</div>
									</div>
					<div class="col-md-12">
						<hr class="colorgraph">
					</div>
					<%
						String isPassOK = (String) request.getAttribute("isPassOK");
							if (isPassOK != null && isPassOK.equals("No")) {
					%>
					<div class="col-md-12">
						<div class="alert alert-danger" role="alert">
							<strong>Sorry!</strong> Password incorrect.
						</div>
					</div>
					<%
						}
					%>
					<div class="row col-md-10 col-md-offset-1">
						<div class="col-xs-6 col-md-6">
							<input type="submit" value="Submit"
								class="btn btn-success btn-block btn-md" tabindex="7">
						</div>
						<div class="col-xs-6 col-md-6">
							<input class="btn btn-danger btn-block btn-md" type="reset"
								value="Reset">
						</div>
					</div>
				</form>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="row" style="margin-top: 150px;">
			<div class="alert alert-warning col-md-4 col-md-offset-4"
				role="alert">
				<strong>Warning!</strong> You have to login first.
			</div>
		</div>

		<%
			}
		%>

		<!-- Footer start here -->
		
	</div>
	 <!-- footer area -->
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