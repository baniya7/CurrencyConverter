<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("Username not available ");
let choice=prompt("Type 1 if already registered and go to login or 2 if want to register by other username");
switch(choice){
case "1":
	window.location.href="http://localhost:8081/Converter/Login.html";
	break;
case "2":
	window.location.href="http://localhost:8081/Converter/Index.html";
	break;
default:
	alert("Invalid input redirecting to registration page");
	window.location.href="http://localhost:8081/Converter/Index.html";
}
</script>

</body>
</html>