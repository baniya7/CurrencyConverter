<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%
String uname=request.getParameter("uname");
String upwd=request.getParameter("upwd");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/currency_converter","root","root");
Statement statement=con.createStatement();
ResultSet set=statement.executeQuery("Select * from users where User_Name='"+uname+"'");
if(!set.next())
{
String query="insert into users(User_Name,User_Password) values('"+uname+"','"+upwd+"')";
statement.executeUpdate(query);
response.sendRedirect("RegisterSuccess.jsp");
}
else{
	response.sendRedirect("RegistrationFail.jsp");
}
}
catch (Exception e)
{
System.out.println(e);
}
%>

</body>
</html>