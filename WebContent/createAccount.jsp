<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create new account</title>
<link rel="stylesheet" href="css/createAccount.css" type="text/css">
<link rel="stylesheet" href="main.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>

<!-- header area -->
	<div class="row">
		<jsp:include page="main.jsp"></jsp:include>
   
   </div>
 <!-- header area end-->
 
 <!-- main page area -->
		<div class="row">
			<div class="account col-md-6 col-md-offset-3">
				<h1 class="well text-center">Create New Account</h1>
				<div class="col-lg-12 well">
					<div class="row">
						<form action="CreateAccountServlet" method="post">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-6 form-group">
										<label class="required">First Name</label><input type="text"
											placeholder="Enter First Name Here.." class="form-control"
											name="first_name" required>
									</div>
									<div class="col-sm-6 form-group">
										<label class="required">Last Name</label> <input type="text"
											placeholder="Enter Last Name Here.." class="form-control"
											name="last_name" required>
									</div>
								</div>
								
								<div class="form-group">
									<label class="required">Address</label>
									<textarea placeholder="Enter Address Here.." rows="3"
										class="form-control" name="address" required></textarea>
								</div>
								<div class="row">
									<div class="col-sm-4 form-group">
										<label>City</label> <input type="text"
											placeholder="Enter City Name Here.." class="form-control"
											name="city">
									</div>
									<div class="col-sm-4 form-group">
										<label class="required">Branch Name</label>
										<div class="input-group-btn">
											<select class="form-control btn btn-default" name="branch" required>
												<option>Delhi</option>
												<option>Mumbai</option>
												<option>Chennai</option>
												<option>Kolkata</option>
												<option>Pune</option>
												<option>Gujrat</option>
												<option>Bihar</option>
												<option>Punjab</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4 form-group">
										<label>Registraion Date</label> <input type="date"
											placeholder="Enter Date" class="form-control"
											name="date">
									</div>
									<div class="col-sm-4 form-group">
										<label class="required">Gender</label>
										<div class="input-group-btn">
											<select class="form-control btn btn-default" name="gender" required>
												<option>Female</option>
												<option>Male</option>
												<option>Others</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="required">User Name</label> <input type="text"
										placeholder="Enter User Name Here.." class="form-control"
										name="username" required>
								</div>
								<div class="row">
									<div class="col-sm-6 form-group">
										<label class="required">Password</label> <input
											type="password" required placeholder="Enter Password Here.." min="5"
											class="form-control" name="password" id="password">
									</div>
									<div class="col-sm-6 form-group">
										<label class="required">Re-password</label> <input
											type="password" required
											placeholder="Enter Re-password Here.." class="form-control"
											name="re_password" id="re_password"
											onkeyup="checkPass(); return false;">
										<p id="confirmMessage" style="margin-top: 10x;"></p>
									</div>
								</div>
								<div class="form-group">
									<label class="required">Phone Number</label> <input type="tel"
										placeholder="Enter Phone Number Here.." class="form-control"
										name="phone" required>
								</div>
								<div class="form-group">
									<label class="required">Email Address</label> <input
										type="text" placeholder="Enter Email Address Here.."
										class="form-control" name="email" required>
								</div>
								<div class="row">
									<div class="col-sm-6 form-group">
										<label class="required">Choose Account type</label>
										<div class="input-group-btn">
											<select class="form-control btn btn-default"
												name="account_type" required>
												<option>Saving Account</option>
												<option>Current Account</option>
												<option>Zero Account</option>
											</select>
										</div>
									</div>
									<div class="col-sm-6 form-group">
										<label class="required">Amount</label> <input type="number"
											placeholder="Enter Intial Amount Here.." class="form-control"
											name="amount" required>
									</div>
								</div>
								<div class="form-group">
									<span class="text-muted"><em><span
											style="color: red; font-size: 14px">*</span> Indicates
											required field</em> </span>
								</div>
							     <%
									String not_match = (String) request.getAttribute("not_match");
									System.out.println(not_match);
									if (not_match != null && not_match.equals("yes")) {
								%>
								<div class="form-group">
									<p class="bg-danger text-center text-danger"
										style="font-size: 18px;">Password doesn't match</p>
								</div>
								<%
									}
								%>
								<input type="submit" class="btn btn-lg btn-info">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
 
 <!-- main page area end-->
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