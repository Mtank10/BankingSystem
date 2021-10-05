<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.green.bank.model.AdminModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="com.green.bank.model.AccountModel"%>
<%@page import="com.green.bank.model.LoanModel"%>
<%@page import="com.green.bank.database.JDBC_Connect"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<jsp:include page="includes/header.jsp"></jsp:include>
<jsp:include page="includes/navbar.jsp"></jsp:include>

 

    

<div class="container-fluid">
<div class="card shadow mb-4">
<div class="card-header py-3">
<h6 class="m-0 font-weight-bold text-primary">Loan  Records

</h6>
</div>
<div class="card-body">


<div class="table-responsive">
<table class="table table-bordered" id="datatable" width="100%" cellspacing="0">
<thread>
<tr>
                             <th>LID</th>
                            <th>First Name</th>
							<th>Last Name</th>
							<th>Account No</th>
							<th>Address</th>
							<th>Email</th>
							<th>Amount</th>
							<th>Status</th>
							<th>Approve</th>
							<th>Delete</th>
</tr>
</thread>
<tbody>
     <%
		DatabaseOperations operations = new DatabaseOperations();
		JDBC_Connect connect = new JDBC_Connect();
		Connection conn = connect.getConnection();

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from loan where status='pending'");
			while (rs.next()) {%>

							<tr>
								<td><%=rs.getInt(1)%></td>
								<td><%=rs.getString(4)%></td>
								<td><%=rs.getString(5)%></td>
								<td><%=rs.getInt(8)%></td>
								<td><%=rs.getString(6)%></td>
								<td><%=rs.getString(7)%></td>
								<td><%=rs.getInt(2) %>
								<td><%=rs.getString(3) %>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Approve">
										<a
											href="loan_request_process.jsp?account_no=<%=rs.getInt(8) %>&amount=<%=rs.getInt(2) %>">
											<button
												class="btn btn-primary btn-sm" data-title="Approve"
												data-toggle="modal" data-target="#edit">
												<span class="glyphicon glyphicon-ok"></span>
											</button></a>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn-sm" data-title="Delete"
											data-toggle="modal" data-target="#delete">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
									</p></td>
							</tr>
							<%
								}
							%>


<tbody>
</table>
</div>
</div>
</div>
</div>
<jsp:include page="includes/scripts.jsp"></jsp:include>
<jsp:include page="includes/header.jsp"></jsp:include>


