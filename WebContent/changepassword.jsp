<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change password </title>
<link rel="stylesheet" type="text/css" href="css/changepassword.css">
<link rel="stylesheet" type="text/css" href="css/deposit.css">
<link rel="stylesheet" type="text/css" href="css/fixed.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="js/passwordChecker.js"></script>
</head>
<body>
	<div class="row">
		<jsp:include page="main.jsp" />
	</div>
	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="col-md-4 col-md-offset-4">
				<form role="form">
					<h2>Change Password</h2>
					<div class="col-md-12">
						<hr class="colorgraph">
					</div>
					<label class="col-md-4 control-label">Current Password</label>
					<div class="col-sm-8 form-group">
						<input type="password" required
							placeholder="Enter Current Password.." class="form-control">
					</div>
					<label class="col-md-4 control-label">New Password</label>
					<div class="col-sm-8 form-group">
						<input type="password" required placeholder="Enter New Password.."
							class="form-control" id="password">
					</div>

					<label class="col-md-4 control-label">Re-Password</label>
					<div class="col-sm-8 form-group">
						<input type="password" required placeholder="Enter Re-Password.."
							class="form-control" id="re_password"
							onkeyup="checkPass(); return false;">
					</div>
					<p id="confirmMessage" class="text-center" style="margin-top: 10x;"></p>

					<div class="col-md-12">
						<hr class="colorgraph">
					</div>
					<div class="row col-md-10 col-md-offset-1">
						<div class="col-xs-6 col-md-6">
							<input type="submit" value="Submit"
								class="btn btn-success btn-block btn-md" tabindex="7">
						</div>
						<div class="col-xs-6 col-md-6">
							<input class="btn btn-danger btn-block btn-md" type="reset"
								value="Clear">
						</div>
					</div>
				</form>
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