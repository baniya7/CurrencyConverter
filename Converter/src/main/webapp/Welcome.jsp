<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Your converted amount is</h2>
</body>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.*" %>
<%
String amount1=request.getParameter("amount1");
double amount2=0;
String currency1=request.getParameter("currency1");
String currency2=request.getParameter("currency2");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/currency_converter","root","root");
Statement statement=con.createStatement();
if(currency1.equals("USD"))
{
ResultSet set=statement.executeQuery("SELECT To_Value FROM usd where To_Currency='"+currency2+"'");
if(set.next())
{
amount2=Double.parseDouble(amount1)*set.getDouble(1);
}
out.println(amount2+" "+currency2);
}
else if(currency1.equals("INR"))
{
ResultSet set=statement.executeQuery("SELECT To_Value FROM inr where To_Currency='"+currency2+"'");
if(set.next())
{
amount2=Double.parseDouble(amount1)*set.getDouble(1);
}
out.println(amount2+" "+currency2);
}
else if(currency1.equals("Euro"))
{
ResultSet set=statement.executeQuery("SELECT To_Value FROM euro where To_Currency='"+currency2+"'");
if(set.next())
{
amount2=Double.parseDouble(amount1)*set.getDouble(1);
}
out.println(amount2+" "+currency2);
}
}
catch (Exception e)
{
System.out.println(e);
}


%>
</html>