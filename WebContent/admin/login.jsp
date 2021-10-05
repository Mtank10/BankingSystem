<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
   
    
</head>
<body>

	<div class="container-fullwidth">
		<div class="row">
			<div class="jumbotron col-md-6 col-md-offset-3"
				style="margin-top: 50px">
				<h1 style="margin-bottom: 30px" class="col-md-10 col-md-offset-1">Login Here!</h1>
				<div class="row">
					<div class="col-md-6 col-md-offset-2">
						<form method="post" action="AdminLoginServlet">
							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									name="email" required class="form-control"
									placeholder="Enter email..">
							</div>
							<div class="form-group">
								<label for="password">Password*</label> <input type="password"
									name="password" required class="form-control" "
									placeholder="Password">
							</div>
							<%
							    String isPassOK = (String) request.getAttribute("isPassOK");
								if (isPassOK!=null && isPassOK.equals("No")) {
							%>
							<div class="alert alert-danger" role="alert">
								<strong>Account No/Password doesn't match.</strong>
							</div>
							<%
								}
							%>
							<input type="submit" class="btn btn-primary btn-lg"
								value="Sign
								to your account"></input>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>