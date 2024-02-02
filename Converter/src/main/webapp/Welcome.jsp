<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!DOCTYPE html>

<head>
<style>
body {
	
    font-family: Roboto;
    font-size: 14px;
    background-size: 200% 100% !important;
    animation: move 10s ease infinite;
    transform: translate3d(0, 0, 0);
    background: linear-gradient(45deg, lightblue 10%, #A2C7E5 90%);
    height: 10vh;
    margin: 0;
      box-sizing: border-box;
}
form{
	margin-top: 100px;
	padding-top: 50 px;;
}

   
   .button {
  background-color: #5F9EA0;
  border: none;
  color: black;
  padding: 5px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
       .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color:  #5F9EA0;
      margin: 0px 0px 0px;
    }

    .header .logo {
      font-size: 25px;
      font-family: 'Sriracha', cursive;
      color: black;
      text-decoration: none;
      margin-left: 20px;
    }

    .nav-items {
      display: flex;
      justify-content: space-around;
      align-items: center;
      background-color: #5F9EA0;
      margin-right: 20px;
    }

    .nav-items a {
      text-decoration: none;
      color: black;
      padding: 35px 20px;
    }
    .footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #5F9EA0;
      margin-top:150px;
      padding: 40px 80px;
      
    }

    .footer .copy {
      color: black;
    }

    .bottom-links {
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding: 0px 0;
    }

    .bottom-links .links {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 20px 40px;
    }

    .bottom-links .links span {
      font-size: 20px;
      color: black;
      text-transform: uppercase;
      margin: 10px 0;
    }

    .bottom-links .links a {
      text-decoration: none;
      color: black;
      padding: 5px 20px;
    }
     


			</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header class="header">
    <a href="#" class="logo">Currency Converter</a>
    <nav class="nav-items">
      <a href="http://localhost:8081/Converter/Admin.html">Admin Login</a>
      <a href="http://localhost:8081/Converter/Logout.jsp">Logout </a>
    </nav>    
  </header>
<center>

<h2>Your converted amount is</h2>

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
</body>
</center>
<html>
<BODY BGCOLOR="lightblue">
<div class="center">
<center>

   
    <br>
     <a href="http://localhost:8081/Converter/Welcome.html" class="button">Convert another currency</a>
   </center> 
</div>
<footer class="footer">
    <div class="copy">&copy; 2024 CurrencyConverter</div>
    <div class="bottom-links">
      <div class="links">
        <span>More Info</span>
        <a href="#">Home</a>
        <a href="http://localhost:8081/Converter/Logout.jsp">Logout</a>
        <a href="http://localhost:8081/Converter/Admin.html">Admin login</a>
      </div>
      <div class="links">
        <span>Social Links</span>
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
      </div>
    </div>
    </footer>
</html>
