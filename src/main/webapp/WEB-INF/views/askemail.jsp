<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Enter Email Address</title>
</head>
<body>
    <h2>Please Enter Your Email Address</h2>
    <form action="verifyemail" method="post">
        <div><label for="email">Email:</label>
        <input type="email" id="email" name="email" required></div>
        <div><label for="password">New password:</label>
        <input type="password" id="password" name="password" required></div>
        <div><label for="phone_no">Phone Number:</label>
        <input type="phone_no" id="phone_no" name="phone_no" required></div>
        <button type="submit">Submit</button>
    </form>
</body>
</html>