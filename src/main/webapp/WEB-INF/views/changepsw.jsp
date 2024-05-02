<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body {
	font-family: "Roboto", sans-serif;
	min-height: 100vh;
	background: linear-gradient(#4ba9e9 0, #4ba9e9 50%, #fff 50%, #fff 100%)
}

.login-form {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 90%;
	max-width: 450px;
	background: #222;
	padding: 20px 30px;
	box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
}

.login-form .form-title {
	font-family: "Montserrat", sans-serif;
	text-align: center;
	font-size: 30px;
	font-weight: 600;
	margin: 20px 0px 30px;
	color: #fff;
}

.login-form .form-input {
	margin: 10px 0px;
}

.login-form .form-input label, .login-form .captcha label {
	display: block;
	font-size: 15px;
	color: #fff;
	margin-bottom: 5px;
}

.login-form .form-input input {
	width: 100%;
	padding: 10px;
	border: 1px solid #888;
	font-size: 15px;
}

.login-form .captcha {
	margin: 15px 0px;
}

.login-form .captcha .preview {
	color: #fff;
	width: 100%;
	text-align: center;
	height: 40px;
	line-height: 40px;
	letter-spacing: 8px;
	border: 1px dashed #bdbdbd;
	font-family: "monospace";
}

.login-form .captcha .preview span {
	display: inline-block;
	user-select: none;
}

.login-form .captcha .captcha-form {
	display: flex;
}

.login-form .captcha .captcha-form input {
	width: 100%;
	padding: 8px;
	border: 1px solid #888;
}

.login-form .captcha .captcha-form .captcha-refresh {
	width: 40px;
	border: none;
	outline: none;
	background: #888;
	color: #eee;
	cursor: pointer;
}
.cancel{
	 position: absolute;
            top: 10px; /* Adjust the top position as needed */
            right: 15px; /* Adjust the right position as needed */
            background: none;
            border: none;
            cursor: pointer;
            color:darkgray;
            font-size: 20px;
}
.login-form #login-btn {
	margin-top: 5px;
	width: 100%;
	padding: 10px;
	border: none;
	outline: none;
	font-size: 15px;
	text-transform: uppercase;
	background: #4c81ff;
	color: #fff;
	cursor: pointer;
}
.error{
color: red;
}
</style>
</head>
<body>

	<!-- partial:index.partial.html -->
	<form:form action="updatepassword" method="post" modelAttribute="psw">
	
	<div class="login-form">
	  <a href="/picpocket/users/profile?=id${userId }"  class="cancel"> <i class="fas fa-times"></i></a>
		<div class="form-title">Update Password</div>
		<h3 class="error">${error }</h3>
		
		<div class="form-input">
			<form:label path="password">Old Password</form:label> 
			<form:input path="password" id="password" required="required" ></form:input>
		</div>
		<div class="form-input">
			<form:label path="newpassword">New Password</form:label> 
			<form:input path="newpassword" id="password" required="required"></form:input>
		</div>
		<div class="form-input">
			<form:label path="cfpassword">Confirm Password</form:label> 
			<form:input path="cfpassword" id="password" required="required"></form:input>
		</div>
		
		<div class="form-input">
			<button id="login-btn">Update</button>
		</div>
	</div>
	</form:form>
	<!-- partial -->
	<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>


</body>
</html>