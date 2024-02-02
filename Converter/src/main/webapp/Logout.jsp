<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body{
background-image: url('https://img.freepik.com/premium-vector/money-currency-exchange-money-transfer-stock-exchange-currencies-dollar-euro-pound-yen_228260-472.jpg');
background-repeat: no-repeat;
background-attachment: fixed;
background-size: 100% 100%;
}
</style>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<img id="loading" alt="" />
<script type="text/javascript" src="http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
    $("#loading").hide();
});
</script>
<script>

alert("Successfully Logout, Thanks for using Currency converter");
window.location.href="http://localhost:8081/Converter/Home.html";
</script>

</body>
</html>