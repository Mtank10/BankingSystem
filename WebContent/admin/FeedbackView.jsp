<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.green.bank.model.AdminModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="com.green.bank.model.AccountModel"%>
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
<h6 class="m-0 font-weight-bold text-primary">Customers Feedback

</h6>
</div>
<div class="card-body">
<% String delete=null;
    String error=null;
   delete=(String)request.getAttribute("delete");
  error=(String)request.getAttribute("error");  
   if(delete=="Customer")
   {%>
	   <div class="alert alert-danger" class="text-danger" role="alert">
     Delete  Successfully
</div>
   <% }%>
   <%if(error=="yes")
   {%>
    <div class="alert alert-danger" class="text-danger" role="alert">
    Not Delete
</div>
   <% }%>
<div class="table-responsive">
<table class="table table-bordered" id="datatable" width="100%" cellspacing="0">
<thread>
<tr>
<th>FID No</th>
<th>Email</th>
<th>Comment</th>
<th>Review</th>
<th>Delete</th>
</tr>
</thread>
<tbody>
<%
	
		JDBC_Connect connect = new JDBC_Connect();
		Connection conn = connect.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from feedback");
		while (rs.next()) {%>
<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>


<td>
<form action="FeedbackDeleteServlet" method="POST">
<input type="hidden" name="delete_id" value="<%=rs.getInt(1) %>">
<button type="submit" name="delete_btn" class="btn btn-danger">DELETE</button>

</form>
</td>
</tr>
<%} %>

<tbody>
</table>
</div>
</div>
</div>
</div>
<jsp:include page="includes/scripts.jsp"></jsp:include>
<jsp:include page="includes/header.jsp"></jsp:include>


