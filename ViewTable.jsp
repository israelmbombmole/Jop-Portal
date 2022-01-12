<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User details</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="css/login-register.css" rel="stylesheet" type="text/css"/>
<link href="css/main.css" rel="stylesheet" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
    <br>
<div class="form-group">
                <div  class="col-sm-4"></div>
                <center> <div  class="col-sm-4">
                    <h2 style="text-align: center">User Details</h2>
                    </div></center>
            </div>
    <br>
            <div class="col-sm-2">
                        <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
                    </div>
    <br>
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
       

    </tr>
  </thead>
  <tbody>
  <% 
  	    Connection con;
                PreparedStatement pst;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Isr@1995");
                //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root","cput");

  	String query = "Select * from login";
	 pst = con.prepareStatement(query);
	 rs = pst.executeQuery();
	
	while(rs.next()){
		%>
		<tr>
		<th scope="row"><%= rs.getString("id") %></th>
		<td><%=rs.getString("firstname")%></td>
		<td><%=rs.getString("lastname")%></td>
		<td><%=rs.getString("email")%></td>
		<td><%=rs.getString("password")%></td>
               
		
                
	<% }%>	
	
  </tbody>
</table>

</body>
</html>