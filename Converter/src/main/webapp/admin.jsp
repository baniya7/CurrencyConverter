<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hi admin!!</title>
</head>
<body>
<%@ page import="java.sql.DriverManager" %> // or
<%@ page import="java.sql.*" %>
<%
String aname=request.getParameter("aname");
String apwd=request.getParameter("apwd");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/currency_converter","root","root");
Statement statement=con.createStatement();
ResultSet set=statement.executeQuery("Select * from admin");
int flag=0;
while(set.next())
{
	if(aname.equals(set.getString(2)) && apwd.equals(set.getString(3)))
	{
		flag=1;
	}
}
if(flag==1)
{
	response.sendRedirect("AdminWelcome.html");
}
else
{
	response.sendRedirect("Admin.html");
}
}
catch (Exception e)
{
System.out.println(e);
}
%>
</body>
</html>