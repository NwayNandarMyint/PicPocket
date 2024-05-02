<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<title>edit profile</title>
<style>
	 @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Open Sans", sans-serif;
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 10px;
  min-height: 100vh;
  background: #2c3e50;
}

form {
  padding: 25px;
  background: #ecf0f1;
  max-width: 500px;
  width: 100%;
  border-radius: 7px;
  box-shadow: 0 10px 15px rgba(0, 0, 0, 0.05);
  color: #2c3e50;
}

form h2 {
  font-size: 27px;
  text-align: center;
  margin: 0px 0 30px;
}

form .form-group {
  margin-bottom: 15px;
  position: relative;
}

form label {
  display: block;
  font-size: 15px;
  margin-bottom: 7px;
}

form input,
form select {
  height: 45px;
  padding: 10px;
  width: 100%;
  font-size: 15px;
  outline: none;
  background: #fff;
  border-radius: 3px;
  border: 1px solid #bfbfbf;
}

form input:focus,
form select:focus {
  border-color: #9a9a9a;
}

form small {
  font-size: 14px;
  margin-top: 5px;
  display: block;
  color: #f91919;
}

.submit-btn {
  margin-top: 30px;
  text-align: center;
}

.submit-btn input {
  color: #ffffff;
  border: none;
  height: 50px;
  width: 100%;
  font-size: 18px;
  padding: 0;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
  text-transform: uppercase;
  background: #000000;
  transition: background 0.3s ease, transform 0.3s ease;
  overflow: hidden;
}

.submit-btn input:hover {
  background: #1a1a1a;
}

.submit-btn input:active {
  transform: scale(0.95);
}
.cancelButton {
 	 position: absolute;
            top: -87px; /* Adjust the top position as needed */
            right: -10px; /* Adjust the right position as needed */
            background: none;
            border: none;
            cursor: pointer;
            color:darkgray;
            font-size: 20px;
}

</style>
</head>
<body>

	<form:form role="form" action="editprofile" modelAttribute="user" method="post">
	<h2>Edit Profile</h2>	
		
	<form:input type="text" path="id" hidden="hidden" readonly="readonly" />
  <div class="form-group name">
  <a  href="profile" class="cancelButton"><i class="fas fa-times"></i></a>
    <label for="name">Name</label>
    <form:input path="name" type="text" placeholder="Enter your name"/>
  </div>
  <div class="form-group email">
    <label for="email">Email </label>
    <form:input path="email" type="text" placeholder="Enter your email "/>
  </div>
  <div class="form-group phone">
    <label for="phone">Phone</label>
    <form:input path="phone_no" type="number"  placeholder="Enter your phone number"/>
  </div>
  <div class="form-group address">
    <label for="address">Address</label>
    <form:input path="address" type="text"  placeholder="Enter your Address"/>
  </div>
  <div class="form-group submit-btn">
    <input type="submit" value="Submit"/>
  </div>
	</form:form>
</body>
</html>