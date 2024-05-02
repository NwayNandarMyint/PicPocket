<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<meta charset="ISO-8859-1">
<title>userlogin</title>
 <style>
:root {
  --background: #1a1a2e;
  --color: #ffffff;
  --primary-color: #0f3460;
}

* {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
  background: var(--background);
  color: var(--color);
  letter-spacing: 1px;
  
}


h1 {
  font-size: 2.5rem;
}

.container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  height: 100vh;
}

.login-container {
  position: relative;
  width: 22.2rem;
}
.form-container {
  border: 1px solid hsla(95, 77%, 44%, 0.158);
  box-shadow: 0 0 36px 1px rgba(164, 25, 25, 0.2);
  border-radius: 10px;
  backdrop-filter: blur(20px);
  z-index: 99;
  padding: 2rem;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -ms-border-radius: 10px;
  -o-border-radius: 10px;
}

.login-container form input {
  display: block;
  padding: 14.5px;
  width: 100%;
  margin: 2rem 0;
  color: var(--color);
  outline: none;
  background-color: #9710101f;
  border: none;
  border-radius: 5px;
  font-weight: 500;
  letter-spacing: 0.8px;
  font-size: 15px;
  backdrop-filter: blur(15px);
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  -ms-border-radius: 5px;
  -o-border-radius: 5px;
}

.login-container form input:focus {
  box-shadow: 0 0 16px 1px rgba(0, 0, 0, 0.2);
  animation: wobble 0.3s ease-in;
  -webkit-animation: wobble 0.3s ease-in;
}

.login-container form button {
  background-color: var(--primary-color);
  color: var(--color);
  display: block;
  padding: 13px;
  border-radius: 5px;
  outline: none;
  font-size: 18px;
  letter-spacing: 1.5px;
  font-weight: bold;
  width: 100%;
  cursor: pointer;
  margin-bottom: 2rem;
  transition: all 0.1s ease-in-out;
  border: none;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  -ms-border-radius: 5px;
  -o-border-radius: 5px;
  -webkit-transition: all 0.1s ease-in-out;
  -moz-transition: all 0.1s ease-in-out;
  -ms-transition: all 0.1s ease-in-out;
  -o-transition: all 0.1s ease-in-out;
}

.login-container form button:hover {
  box-shadow: 0 0 10px 1px rgba(0, 0, 0, 0.15);
  transform: scale(1.02);
  -webkit-transform: scale(1.02);
  -moz-transform: scale(1.02);
  -ms-transform: scale(1.02);
  -o-transform: scale(1.02);
}

.circle {
  width: 8rem;
  height: 8rem;
  background: var(--primary-color);
  border-radius: 50%;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  -ms-border-radius: 50%;
  -o-border-radius: 50%;
  position: absolute;
}

.circle-one {
  top: 0;
  left: 0;
  z-index: -1;
  transform: translate(-45%, -45%);
  -webkit-transform: translate(-45%, -45%);
  -moz-transform: translate(-45%, -45%);
  -ms-transform: translate(-45%, -45%);
  -o-transform: translate(-45%, -45%);
}

.circle-two {
  bottom: 0;
  right: 0;
  z-index: -1;
  transform: translate(45%, 45%);
  -webkit-transform: translate(45%, 45%);
  -moz-transform: translate(45%, 45%);
  -ms-transform: translate(45%, 45%);
  -o-transform: translate(45%, 45%);
}

.ee{
  margin: 1rem 0;
  display: flex;
  justify-content: space-between;
}
.opacity {
  opacity: 0.6;
}

.theme-btn-container {
  position: absolute;
  left: 0;
  bottom: 2rem;
}

.theme-btn {
  cursor: pointer;
  transition: all 0.3s ease-in;
}

.theme-btn:hover {
  width: 40px !important;
}

@keyframes wobble {
  0% {
    transform: scale(1.025);
    -webkit-transform: scale(1.025);
    -moz-transform: scale(1.025);
    -ms-transform: scale(1.025);
    -o-transform: scale(1.025);
  }
  25% {
    transform: scale(1);
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    -o-transform: scale(1);
  }
  75% {
    transform: scale(1.025);
    -webkit-transform: scale(1.025);
    -moz-transform: scale(1.025);
    -ms-transform: scale(1.025);
    -o-transform: scale(1.025);
  }
  100% {
    transform: scale(1);
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    -o-transform: scale(1);
  }
}
.ee a:hover {
 
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}
a{
 text-decoration: none;
  color: var(--color);
}
.header .text{
  
  font-size: 41px;
   font-weight: 900;
   font-family: 'Poppins', sans-serif;
    background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
   opacity: 0.6;
}
.title{
  
  text-align: left;
  font-size: 60px;
  font-style: italic;
  font-weight: 800;
  font-family: 'Poppins', sans-serif;
  background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.text-danger{
color:red;
font-size: 14px;
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
  </style> 
</head>

<body>
<a class="title" >Picpocket</a>
  <section class="container">
  		
    <div class="login-container">
      <div class="circle circle-one"></div>
      <div class="form-container">
      <div class="header">
      	<div class="text">
			LOGIN      
		</div>
		<div>
  			 <a href="/picpocket/users/"  class="cancel"> <i class="fas fa-times"></i></a>
  		</div>
        </div>
        <div class="text-danger" >${emailerror}</div>
        <form:form action="login" method="post" modelAttribute="user">
        
        
        <div>
          	<form:input path="email" type="email" placeholder="USER EMAIL" />
			
        </div>
        <div>
          	<form:input path="password" type="password" placeholder="PASSWORD" />
		 	
        </div>
          	<button class="opacity" type="submit">SignIn</button>
         	
        </form:form>
        <div class="ee">
          <a href="userregister">REGISTER</a>
          <a href="forgotpass">FORGOT PASSWORD</a>
        </div>
      </div>
      <div class="circle circle-two"></div>
    </div>
    <div class="theme-btn-container"></div>
  </section>
</body>
	
</html>