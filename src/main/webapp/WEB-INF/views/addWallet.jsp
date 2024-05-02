<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Currency Converter using JS</title>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<style>
  * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Montserrat", sans-serif;
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: 0 10px;
  background: linear-gradient(180deg, #32a6bb 50%, #547575 50%);
}

::selection {
  color: #000;
  background: #fff;
}

.wrapper {
  width: 370px;
  padding: 30px;
  border-radius: 5px;
  background: #f4fbfd;
  box-shadow: 7px 7px 20px rgba(0, 0, 0, 0.2);
  color: #fff;
}

.wrapper header {
  font-size: 28px;
  font-weight: 500;
  text-align: center;
  color: #000;
}

.wrapper form {
  margin: 30px 0 10px 0;
}

form :where(input, select, button) {
  width: 100%;
  outline: none;
  border-radius: 5px;
  border: none;
  background: #444;
  color: #050404;
}

form p {
color: #000;
  font-size: 18px;
  margin-bottom: 5px;
}

form input {
  height: 50px;
  font-size: 17px;
  padding: 0 15px;
  border: 1px solid #000;
  background: #f1f8fa;
}


form .drop-list {
  display: flex;
  margin-top: 20px;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
}
 .point-box {
  display: flex;
  width: 115px;
  height: 45px;
  align-items: center;
  border-radius: 5px;
  justify-content: center;
  border: 1px solid #000;
  background: #fff;
  color: #000;
}

.select-box {
  display: flex;
  width: 100%;
  max-width: 200px; 
  height: 45px;
  align-items: center;
  border-radius: 5px;
  justify-content: center;
  border: 1px solid #000;
  background: #fff;
  color: #000;
  margin: 0 auto; 
  font-size: 20px;
}

/* Add a media query for smaller screens */
@media only screen and (max-width: 600px) {
  .select-box {
    max-width: 100%; /* Adjust maximum width for smaller screens */
  }
}


form .exchange-rate {
  font-size: 17px;
  margin: 20px 0 30px;
  color: #000;
}

form button {
  height: 52px;
  color: #fff;
  font-size: 17px;
  cursor: pointer;
  background: #444;
  transition: background 0.3s ease, transform 0.2s ease;
}

form button:hover {
  background: #333;
}

form button:active {
  transform: scale(0.95);
}
.new-box {
            background-color: #f0f0f0; /* Background color for the email box */
            padding: 5px; /* Add some padding to the email box */
            border-radius: 5px; /* Optional: Add rounded corners to the email box */
            color: #000;
        }
  .b {
            border: 1px solid #3a3131;
            padding: 10px;
            max-width: 300px; /* Adjust the width as needed */
            margin: 0 auto; /* Center the container */
            text-align: center; /* Center the text */
            font-family: Arial, sans-serif; /* Choose your preferred font-family */
        }

        .b p {
            font-weight: bold; /* Make the "Email" text bold */
            margin-bottom: 5px; /* Add some space between "Email" and the email address */
        }
        .cancelButton {
  position: relative; /* Set the position of the parent container to relative */
}

.cancelButton i {
  position: absolute;
  top: -10px; /* Adjust the top position as needed */
  left: 300px; /* Adjust the right position as needed */
  background: none;
  border: none;
  cursor: pointer;
  color: darkgray;
  font-size: 20px;
}
</style>
</head>
<body>

<div class="wrapper">
	 <a href="/picpocket/admins/" class="cancelButton"><i class="fas fa-times"></i></a>
  <header>Add Wallet</header>
  <form:form action="addWallet" methpod="post" modelAttribute="wallet">
  
    <div class="amount">
      <p>Enter Coin</p>
      <form:input type="text" path="totalamount"/>
    </div>
     <input type="hidden" name="user_id" value="${user_id}" />
    <%-- <div>
    <p>Password</p>
    <form:input type="text" path="password"/>
    </div> --%>
    <div class="drop-list">
      <div class="from">
        <p>User Name</p>
        <div class="select-box">
            ${userdata.name }
        </div>
      </div>
      <div class="to">
        <p>Total Coin</p>
        <div class="point-box">
            ${userdataa.totalamount }
        </div>
      </div>
    </div>
        <div class="b">
            <p>Email</p>
            <div class="new-box">
                ${userdata.email }
            </div>
             
        </div>
    <div class="exchange-rate">Create Wallet</div>
    <button>Submit</button>
  </form:form>
</div>

</body>
</html>
