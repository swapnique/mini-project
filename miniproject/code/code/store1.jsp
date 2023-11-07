<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="javax.servlet.*"%>
    <%@page import="javax.servlet.http.*"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 &nbsp &nbsp&nbsp &nbsp
<h1><body    text="white" ><font size="50"><b><i>&nbsp &nbsp<u>Login Page</u></i></b></font></body></h1>
<title>Login Page</title>
<style>
body{background-image:url('loginbg.jpg') ;height :95%;background-position:center;background-size:cover;border-style:double  dashed;}
</style>
</head>
<body ><font size="5">
<form method="get"><i>
<br><br>&nbsp &nbsp
Enter your login credentials:<br><br><br><br>&nbsp &nbsp
User name:<input  type="text"  name="uname" />
<span id="error"></span>
<br><br><br><br>
&nbsp &nbsp
Password:<input  type="text"   name="password" id="password"  />
<br><br>
&nbsp &nbsp&nbsp &nbsp
</i><br><br></font>
<input type="submit" value="login"/>
&nbsp &nbsp&nbsp &nbsp
<input type="reset" value="reset" />
<%
   String uname =request.getParameter("uname");
   String pwd=request.getParameter("password");
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","XE","xe");
   PreparedStatement ps = conn.prepareStatement("select * from timetable where fname=? and pwd=?");
   ps.setString(1,uname);
   ps.setString(2,pwd);
   ResultSet rs=ps.executeQuery();
   response.setContentType("text/html");
   if(rs.next()){%>
&nbsp &nbsp&nbsp &nbsp
         <a href="studentandfaculty.html">hii</a>
   <%}
   else{
          out.println("Something went wrong");
   }
      //conn.close%>

</body>
</html>


