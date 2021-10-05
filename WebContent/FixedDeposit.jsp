<%@page import="com.green.bank.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fixed Deposit</title>
<link rel="stylesheet" type="text/css" href="css/deposit.css">
<link rel="stylesheet" type="text/css" href="css/fixed.css">
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
		<div class="row" style="margin-top: 50px;">
			<div class="col-md-6 col-md-offset-3">
				<h1 style="font-weight: 600">Fixed Deposit</h1>
				<p class="deposit_text">We offer some elegant fixed deposits
					which meets the needs of individual and commercial customers
					through our schedule benefit.</p>
			</div>
		</div>
		<div class="row scheme">
			<div class="col-md-6 col-md-offset-3">
				<h2 style="font-weight: 600;margin-bottom: 30px;">Fixed Deposit Products</h2>
				<div class="col-md-4">
					<div class="well">
						<h2 class="muted" style="color:#CD7F32;">Bronze</h2>
						<p>
							<span class="label label-success" style="font-size: 12px;">Short-term</span>
						</p>
						<ul>
							<li>1 year</li>
							<li>5, 10 or 15 lakh deposit amount</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis
							sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue
							semper porta.</p>
						<hr>
						<h3>Interest rate: 8%</h3>
						<hr>
						<p>
							<a class="btn btn-success btn-large" href="single_fixed_deposit.jsp?value=Bronze"><i class="icon-ok"></i>
								Select plan</a>
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<h2 class="muted" style="color:#A9A9A9;">Silver</h2>
						<p>
							<span class="label label-success" style="font-size: 12px;">Mid-term</span>
						</p>
						<ul>
							<li>3 years</li>
							<li>5, 10 or 15 lakh deposit amount</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis
							sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue
							semper porta.</p>
						<hr>
						<h3>Interest rate: 10%</h3>
						<hr>
						<p>
							<a class="btn btn-success btn-large" href="single_fixed_deposit.jsp?value=Silver"><i
								class="icon-ok"></i> Select plan</a>
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<h2 class="muted" style="color:#D4AF37;">Gold</h2>
						<p>
							<span class="label label-success" style="font-size: 12px;">Long-term</span>
						</p>
						<ul>
							<li>5 years</li>
							<li>5, 10 or 15 lakh deposit amount</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis
							sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue
							semper porta.</p>
						<hr>
						<h3>Interest rate: 12%</h3>
						<hr>
						<p>
							<a class="btn btn-success btn-large" href="single_fixed_deposit.jsp?value=Gold"><i class="icon-ok"></i>
								Select plan</a>
						</p>
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