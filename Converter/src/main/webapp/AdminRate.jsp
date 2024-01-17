<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<HTML>
       <HEAD>
       <TITLE>The View Of Database Table </TITLE>
       </HEAD>
       <center>
       <BODY BGCOLOR="lightblue">
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
    <a href="http://localhost:8081/Converter/Logout.jsp"> <input type="submit" value="Logout" ><br>
    <br>
     <a href="http://localhost:8081/Converter/ChangeRate.html"><input type="submit" value="Change Exchange Rate" ></center></a>
     </BODY>
</HTML>
