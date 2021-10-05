<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>eBank24</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
    <link rel="stylesheet" href="css/header.css" type="text/css">
    
  </head>
  <body>
<div >
		<jsp:include page="main.jsp"></jsp:include>
   
   </div>
   <div id="home">
   
   <div class="landing-text">
      <h1>Inspired <i>By</i> you</h1>
      <h4>With a Bank you're a customer</h4>
      <h2>WITH SEASONS YOU'RE FAMILY</h2>
      <a href="loan.jsp" class="btn btn-default btn-lg">Loan Request</a>
      <a href="FixedDeposit.jsp" class="btn btn-default btn-lg">Fixed Deposit</a>
      
   </div>
   
   
   
   <div class="padding">
   <div class="container1">
    <div class="row">
       <div class="col-sm-6">
          <img class="img" src="image/loan2.jpg">
         </div>
         <div class="col-sm-6 text-center">
            <h3>Loan: Borrow to support your mission</h3>
            <p>Personal loan 
            up to rs 15 lakhs
            Fast Track your dreams
             with instant approval</p>
            <a href="loan.jsp" class="btn btn-default btn-lg">Read more</a>
         </div>
         </div>
       </div>
     </div>
     
     
 
 
   <div class="padding">
   <div class="container2">
    <div class="row">
         <div class="col-sm-6 text-center">
            <h3>Fixed Deposit: </h3>
            <p class="lead">Fixed Deposit (FD) are a Great way
            to Grow Your Savings.</p>
            <a href="FixedDeposit.jsp" class="btn btn-default btn-lg">Read more</a>
         </div>
              <div class="col-sm-6">
                 <img class="img" src="image/fixed.jpg">
             </div>
         </div>
       </div>
     </div>
 
 

 
 
 <div id="feedback">
   <div class="feedback-text">
      <h1>FEEDBACK AND COMPLAINTS</h1>
      <p>We Welcome your feedback whether it's a complaint</p>
      <p>Suggestion or a complaint.</p>
      <a href="feedback.jsp" class="btn btn-default btn-lg">Find out More</a>
      
   </div>
   </div>
 
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
 
  </body>
</html>