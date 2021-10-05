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

 
<!-- Modal -->
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">Admin Registraion Page</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="AdminRegServlet" method="POST">
      <div class="modal-body">
        <div class="form-group">
         <label>UserName</label>
         <input type="text" name="username" class="fomr-control" placeholder="Enter Username">
        </div>
        <div class="form-group">
         <label>Email</label>
         <input type="email" name="email" class="fomr-control" placeholder="Enter Email">
        </div>
        <div class="form-group">
         <label>Password</label>
         <input type="password" name="password" class="fomr-control" placeholder="Enter password">
        </div>
        <div class="form-group">
         <label>Comfirm Password</label>
         <input type="password" name="confirmpassword" class="fomr-control" placeholder="Enter Comfirm password">
        </div>
        <input type="hidden" name="usertype" value="admin">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" name="registerbtn" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="container-fluid">
<div class="card shadow mb-4">
<div class="card-header py-3">
<h6 class="m-0 font-weight-bold text-primary">Admin Profile
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
Add Admin Profile
</button>
</h6>
</div>
<div class="card-body">
<% String update=null;
    String error=null;
   update=(String)request.getAttribute("success");
  error=(String)request.getAttribute("error");  
   if(update=="Customer1")
   {%>
	   <div class="alert alert-success" class="text-success" role="alert">
     Admin Updated Successfully
</div>
   <% }%>
   <%if(error=="yes1")
   {%>
    <div class="alert alert-danger" class="text-danger" role="alert">
    Not Updated
</div>
   <% }%>

<% String delete=null;
    String error1=null;
   delete=(String)request.getAttribute("success");
  error1=(String)request.getAttribute("error");  
   if(delete=="Customer")
   {%>
	   <div class="alert alert-danger" class="text-danger" role="alert">
     Delete  Successfully
</div>
   <% }%>
   <%if(error1=="yes")
   {%>
    <div class="alert alert-danger" class="text-danger" role="alert">
    Not Delete
</div>
   <% }%>
<div class="table-responsive">
<table class="table table-bordered" id="datatable" width="100%" cellspacing="0">
<thread>
<tr>
<th>ID</th>
<th>Username</th>
<th>Password</th>
<th>Email</th>
<th>UserType</th>
<th>Edit</th>
<th>Delete</th>
</tr>
</thread>
<tbody>
<%
	
		JDBC_Connect connect = new JDBC_Connect();
		Connection conn = connect.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from admin");
		while (rs.next()) {%>
<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(6) %></td>

<td>
<form action="register_edit.jsp" method="post">
<input type="hidden" name="edit_id" value="<%=rs.getInt(1) %>">
<button type="submit" name="edit_btn" class="btn btn-success">EDIT</button>
</form>
</td>
<td>
<form action="AdminDeleteServlet" method="POST">
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


