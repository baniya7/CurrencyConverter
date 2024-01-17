<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>Your converted amount is</h2>
</body>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%

String amount1=request.getParameter("amount1");
double amount2=1.00*Double.parseDouble(amount1);
String currency1=request.getParameter("currency1");
String currency2=request.getParameter("currency2");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/currency_converter","root","root");
Statement statement=con.createStatement();
ResultSet set=statement.executeQuery("Select Exchange_Rate from rates where (Base_Currency='"+currency1+"' and To_Currency='"+currency2+"')");
if(set.next())
	{
	amount2=Double.parseDouble(amount1)*set.getDouble(1);
	}
out.println(String.format("%.2f",amount2)+" "+currency2);
}
catch (Exception e)
{
System.out.println(e);
}
%>
</center>
<html>
<BODY BGCOLOR="lightblue">
<div class="center">
<center>

    <a href="http://localhost:8081/Converter/Logout.jsp"> <input type="submit" value="Logout" ><br>
    <br>
     <a href="http://localhost:8081/Converter/Welcome.html"><input type="submit" value="Convert another currency" ></center></a>
</div>
</html>
