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
<h6 class="m-0 font-weight-bold text-primary">Edit Customer Profile
</h6>
</div>
<div class="card-body">
<%
		String aid=request.getParameter("customeredit_id");
   JDBC_Connect connect = new JDBC_Connect();
Connection conn = connect.getConnection();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from customer where id ='"+aid+"'");
while (rs.next()) {%>
<form action="CustomerUpdateServlet" method="POST">
 <div class="form-group">
 <input type="hidden" name="customeredit_id" value="<%=rs.getInt(1) %>">
         
         <label>First Name</label>
         <input type="text" name="edit_firstname"  value="<%=rs.getString(2) %>" class="fomr-control" >
        </div>
        <div class="form-group">
        <label>Last Name</label>
         <input type="text" name="edit_lastname" value="<%=rs.getString(3) %>" class="fomr-control">
        </div>
        <div class="form-group">
        <label>Address</label>
         <input type="text" name="edit_address" value="<%=rs.getString(4) %>" class="fomr-control">
        </div>
        <div class="form-group">
        <label>City</label>
         <input type="text" name="edit_city" value="<%=rs.getString(5) %>" class="fomr-control">
        </div>
        <div class="form-group">
        <label>Branch</label>
         <input type="text" name="edit_branch" value="<%=rs.getString(6) %>" class="fomr-control">
        </div>
        
        <div class="form-group">
        <label>UserName</label>
         <input type="text" name="edit_username" value="<%=rs.getString(7) %>" class="fomr-control">
        </div>
        <div class="form-group">
        <label>Password</label>
         <input type="password" name="edit_password" value="<%=rs.getString(8) %>" class="fomr-control">
        </div>
        <div class="form-group">
        <label>Phone No</label>
         <input type="text" name="edit_phone" value="<%=rs.getString(9) %>" class="fomr-control">
        </div>
        <div class="form-group">
        <label>Email</label>
         <input type="email" name="edit_email" value="<%=rs.getString(10) %>" class="fomr-control">
        </div>
        
        
        <div class="form-group">
        <label>AccountType</label>
         <input type="text" name="edit_accountType" value="<%=rs.getString(11) %>" class="fomr-control">
        </div>
        
        <div class="form-group">
         <label>Gender</label>
         <input type="text" name="edit_gender"  value="<%=rs.getString(12) %>" class="fomr-control" >
        </div>
        <div class="form-group">
         <label>Registraion Date</label>
         <input type="text" name="edit_reg" value="<%=rs.getString(13) %>" class="fomr-control" >
        </div>
      
       
        <a href="ViewCustomerDetails.jsp" class="btn btn-danger" >CANCEL</a>
        <button type="submit" name="updatebtn" class="btn btn-primary">UPDATE</button>
        </form>
       <%}%>
 </div> 
  </div>
  </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <jsp:include page="includes/scripts.jsp"></jsp:include>
<jsp:include page="includes/header.jsp"></jsp:include>


    