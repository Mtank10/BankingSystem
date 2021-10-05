<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="com.green.bank.database.JDBC_Connect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.green.bank.model.AdminModel"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%!AdminModel ac;%>

<%
	ac = (AdminModel) session.getAttribute("loginDetails");
	int aid = ac.getA_id();
	JDBC_Connect connect = new JDBC_Connect();
	Connection conn = connect.getConnection();
	DatabaseOperations operations = new DatabaseOperations();
	ac = operations.getAdminDetails(conn, aid);
%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=ac.getUsername()%></title>
<link rel="stylesheet" type="text/css" href="css/profile.css">
<link rel="stylesheet" type="text/css" href="css/deposit.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>
<body>
	<div class="row">
		<jsp:include page="includes/header.jsp"></jsp:include>
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
						<h2><%=ac.getUsername()%></h2>
						<ul>
							<li class="navli"><span
								class="glyphicon glyphicon-map-marker"></span><%=ac.getEmail()%> </li>
							</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="account_details col-md-10 col-md-offset-1"
					style="margin-top: 30px;">
					<h2>Admin Details</h2>
					<hr class="divider">
					<table class="table table-user-information col-md-6">
						<tbody>
							
							
							<tr>
								<td><b>UserName</b></td>
								<td><%=ac.getUsername()%></td>
							</tr>
							
							<tr>
								<td><b>Email</b></td>
								<td> <a href="mailto:" +<%=ac.getEmail()%>></a></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>

		</div>
</body>
</html>