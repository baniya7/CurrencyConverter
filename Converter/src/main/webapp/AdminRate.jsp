<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<HTML>
       <HEAD>
       <style>
        body {
      margin: 0;
      box-sizing: border-box;
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
       <TITLE>The View Of Database Table </TITLE>
       </HEAD>
       <center>
       <BODY BGCOLOR=lightblue>
        <header class="header">
    <a href="#" class="logo">Currency Converter</a>
    <nav class="nav-items">
      <a href="http://localhost:8081/Converter/Login.html">User Login</a>
      <a href="http://localhost:8081/Converter/Logout.jsp">Logout </a>
    </nav>    
  </header>
  
       <H1>The Exchange Rates are: </H1></center>
       
       <%
          Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/currency_converter","root","root");
          Statement statement = connection.createStatement();
          ResultSet resultset = statement.executeQuery("select * from rates");
       %>
       <center>
      <TABLE BORDER="1">
      <TR>
      <TH>Base Currency</TH>
      <TH>To Currency</TH>
      <TH>Exchange Rates</TH>
      </TR>
      <% while(resultset.next()){ %>
      <TR>
       <TD> <%= 1 +" "+resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
      </TR>
      <% } %>
     </TABLE>     
     </center>
    <center>
    <br>
    <a href="http://localhost:8081/Converter/ChangeRate.html" class="button">Change Exchange Rate</a>
    </center></a>
     <footer class="footer">
    <div class="copy">&copy; 2024 CurrencyConverter</div>
    <div class="bottom-links">
      <div class="links">
        <span>More Info</span>
        <a href="#">Home</a>
        <a href="http://localhost:8081/Converter/Logout.jsp">Logout</a>
        <a href="http://localhost:8081/Converter/Login.html">User login</a>
      </div>
      <div class="links">
        <span>Social Links</span>
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
      </div>
    </div>
    </footer>
     </BODY>
</HTML>








