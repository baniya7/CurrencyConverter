<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.*" %>
<%
String lname=request.getParameter("lname");
String lpwd=request.getParameter("lpwd");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/currency_converter","root","root");
Statement statement=con.createStatement();
ResultSet set=statement.executeQuery("Select * from users");
int flag=0;
while(set.next())
{
	if(lname.equals(set.getString(2)) && lpwd.equals(set.getString(3)))
	{
		flag=1;
	}
}
if(flag==1)
{
	response.sendRedirect("Rate.jsp");
}
else
{
	response.sendRedirect("LoginFail.jsp");
}
}
catch (Exception e)
{
System.out.println(e);
}
%>
</body>
</html>