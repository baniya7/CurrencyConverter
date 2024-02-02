<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Rate</title>
</head>
<body>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.*" %>
<%
String amount1=request.getParameter("amount1");
String currency1=request.getParameter("currency1");
String currency2=request.getParameter("currency2");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/currency_converter","root","root");
Statement statement=con.createStatement();
String query="update rates set Exchange_Rate='"+amount1+"' where (Base_Currency='"+currency1+"' and To_Currency='"+currency2+"')";
statement.executeUpdate(query);
response.sendRedirect("RateUpdateSuccess.jsp");
}
catch (Exception e)
{
System.out.println(e);
}
%>
</body>
</html>