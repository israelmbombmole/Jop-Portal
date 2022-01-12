<%@ page import="java.sql.*" %> 

<!DOCTYPE html>

<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Welcome : <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" href="css/main.css">
        <link href="css/login-register.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="css/login-register.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>

<body>

    <ul>
        <li><a href="ViewTable.jsp">View Users</a></li>
        <li><a href="ViewSubject.jsp">View Subject</a></li>
    </ul>

    <div class="main-content">
	
	<center>
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.jsp"); 
	}
	%>
	
	<h1> Welcome, <%=session.getAttribute("login")%> </h1>

	<h2><a href="logout.jsp">Logout</a></h2>
    
	</center>
        </br>
        
        <%
        try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Isr@1995");
	
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root","cput"); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String subject;
		
		
		subject=request.getParameter("subject");
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into course(subject) values(?)"); //sql insert query
		
                pstmt.setString(1, subject);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
 
        %>
        
        
        
        
        
        <center><form action="Message.jsp">
        <label for="subject">Choose a Subject:</label>
        
  <select name="subject" id="subject">
    <option value= "Electrical  Engineering1">Electrical  Engineering1</option>  
    <option value=  "Mathematics 1">Mathematics 1</option>    
    <option value= "Physics 1">Physics 1</option>    
     <option value= "Communication 1">Communication 1</option>    
    <option value= "Engineering Skills 1">Engineering Skills 1</option>    
    <option value= "Communication Systems 2">Communication Systems 2</option>    
    <option value= "Power Systems 2">Power Systems 2</option>    
    <option value= "Process Control 2">Process Control 2</option>    
    <option value= "Mathematics 2">Mathematics 2</option>    
    <option value= "Microprocessors 2">Microprocessors 2</option>    
    <option value= "Engineering Design 2">Engineering Design 2</option>    
    <option value= "Software Development 2">Software Development 2</option> 
  </select>
  <br><br>
  
  <center><input type="submit" value="Submit">
  </center></form></center>
    
		
    </div>

</body>

</html>
