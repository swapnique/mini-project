<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="javax.servlet.*"%>
    <%@page import="javax.servlet.http.*"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Time Table</title>
</head>
<body>
<%

   String fname=request.getParameter("fname");
   String lname =request.getParameter("lname");
   String dob=request.getParameter("dob");
   String jntu=request.getParameter("jntu_no");
   String status=request.getParameter("type");
   String phone=request.getParameter("phone");
   String email=request.getParameter("email");
   String pwd=request.getParameter("password");
   
   try{
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","XE","xe");
       PreparedStatement ps = conn.prepareStatement("insert into timetable values(?,?,?,?,?,?,?,?)");
       ps.setString(1,fname);
       ps.setString(2,lname);
       ps.setString(3,dob);
       ps.setString(4,jntu);
       ps.setString(5,status);
       ps.setString(6,phone);
       ps.setString(7,email);
       ps.setString(8,pwd);
       int x=ps.executeUpdate();
       response.setContentType("text/html");
       if(x!=0){
           out.println("Submitted Successfully");
       }
       else{
            out.println("Something went wrong");
       }
       //conn.close
   }
   catch(Exception e){
         out.print(e); 
   }
         
%>
</body>
</html>