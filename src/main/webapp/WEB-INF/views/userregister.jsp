<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
  <title>userregister</title>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style>
  @import url("https://fonts.googlesapis.com/css2?famaily=Poppins:wght@300;400;500;600;700;800;900&display=swap");
   *{
    margin: 0;
   padding: 0;
   box-sizing: border-box;
    font-family: "Poppins",sans-serif;
   }
   body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: #020228;
   }
   .wrapper{
    width: 750px;
    background: rgba(225,225,225,.1) ;
    border: 2px solid rgba(225,225,225,.2);
    box-shadow: 0 0 10px rgba(0,0.0,.2);
    backdrop-filter: blur(50px);
    border-radius: 10px;
    color: #fff;
    padding: 20px 15px 35px ;
    margin: 0 10px;
   }
   .wrapper h1{
    font-size: 36px;
    text-align: center;
    margin-bottom: 20px;
   }
   .wrapper .input-box{
    display: flex;
   justify-content: space-between;
   flex-wrap: wrap;
   }
   .input-box .input-field{
    position: relative;
    width: 50%;
    height: 50px;
    margin: 13px 0;
    padding: 30px 25px 45px;
   }
   .input-box .input-field input{
    width: 100%;
    height: 100%;
    background: transparent;
    border: 2px solid rgba(225,225,225,.2);
    outline: none;
    font-size: 16px;
    color: #fff;
    border-radius: 6px;
    padding: 20px 20px 20px 50px;
   }
   .input-box .input-field input::placeholder{
    color: #fff;
   }
   .input-box .input-field i{
    position: absolute;
    color:black;
    left: 38px;
    top: 65%;
    transform: translateY(-50%);
    font-size: 20px;
   }
   .image{
   	 position: relative;
    width: 100%;
    height: 100px;
    margin: 13px 0;
    padding: 30px 25px 45px;
   }
   .wrapper .btn{
      width: 100%;
    height: 48px;
    background: #fff;
    border: none;
    outline: none;
    border-radius: 6px;
    box-shadow: 0 0 10px rgba(0,0,0,.1);
    cursor: pointer;
    font-size: 16px;
    color: #333;
    font-weight: 600;
    }
   .text-danger{
  color:red;
  font-size: 14px;
}
.title{
        	top: 10px; 
           	right: 15px;
            background: none;
            border: none;
            cursor: pointer;
            color:darkgray;
            font-size: 20px;
}

</style>
</head>
<body>

<div class="wrapper">
  <form:form action="userregister" method="post" modelAttribute="user" enctype="multipart/form-data">
    <a class="title" href="/picpocket/users/"><i class="fas fa-times"></i></a>
      <h1>Registration</h1>
      <div class="text-danger" align="center">${error}</div>
      <div class="input-box">
        <div class="input-field">
          <form:input path="name"  placeholder="Name" />
			<form:errors path="name" cssClass="text-danger"></form:errors>
          <i class='bx bxs-user'></i>
        </div>
        <div class="input-field">
          <form:input path="email" type="text" placeholder="Email" />
		<form:errors path="email" cssClass="text-danger" ></form:errors>
			<div class="text-danger" >${emailerror}</div>
          <i class='bx bxs-envelope'></i>
        </div>
      </div>
      <div class="input-box">
        <div class="input-field">
          <form:input path="password"  type="password" placeholder="Password" />
			<form:errors path="password" cssClass="text-danger" ></form:errors>
          <i class='bx bxs-lock-alt'></i>
        </div>
        <div class="input-field">
          <form:input path="cfpassword" type="password" placeholder="Confirm Password" />
			<form:errors path="cfpassword" cssClass="text-danger" ></form:errors>
			<div class="text-danger" >${pswerror}</div>
          <i class='bx bxs-lock-alt'></i>
        </div>
      </div>
      <div class="input-box">
        <div class="input-field">
         <form:input path="phone_no" type="number" placeholder="Phone" />
		<form:errors path="phone_no" cssClass="text-danger"></form:errors>
          <i class='bx bxs-phone'></i>
        </div>
        <div class="input-field">
          <form:input path="address" placeholder="Address" />
			<form:errors path="address" cssClass="text-danger" ></form:errors>
          <i class='bx bxs-home-alt-2'></i>
        </div>
      </div>
      <div class="input-box">
        <div class="image">
        <label for="imagepath">Choose Profile Image:</label>
        	<form:input type="file" path="imagepath"></form:input>
			<form:errors path="imagepath" cssClass="text-danger" ></form:errors>
        </div>
      </div>
    	<div>
    		  <button type="submit" class="btn">Register</button>
    	</div>
   </form:form>
</div>

</body>
</html>
