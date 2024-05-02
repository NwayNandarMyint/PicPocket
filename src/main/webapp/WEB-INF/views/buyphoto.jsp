<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Buy Photo</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css"> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<style>
*
{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body
{
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(#4ba9e9 0,#4ba9e9 50%,#fff 50%,#fff 100%);
  min-height: 100vh;
}
.card 
{
  position: relative;
  width: 580px;
  height: 380px;
  background: #e3dbdb00;
  display: flex;
  box-shadow: 0 15px 45px rgba(220, 216, 216, 0.1);
  overflow: hidden;
  transition: 0.5s ease-in-out;
}
.card .imgBx 
{
  position: relative;
  width: 50%; /* Adjust as needed */
  background: #f9f9f9;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 10;
}
.card .imgBx img 
{
  max-width: 98%; /* Adjust as needed */
  max-height: 100%; /* Adjust as needed */
  transition: 0.5s ease-in-out;
}

.card .details 
{
  position: absolute;
  left: 50%; /* Adjust as needed */
  width: 50%; /* Adjust as needed */
  height: 100%;
  background: #273941;
  padding: 20px;
  transition: 0.5s ease-in-out;
}
.card .details::before 
{
  content: '';
  position: absolute;
  left: 0px;
  width: 0; 
  height: 0; 
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
  border-left: 10px solid #f8f8f8;
  z-index: 1;
}
.card .details h3 
{
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  font-size: 1.5em;
  line-height: 1em;
}
.card .details h3 span 
{
  font-size: 0.65em;
  font-weight: 300;
  opacity: 0.85;
  text-transform: none;
}
.card .details h4 
{
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  font-size: 0.9em;
  line-height: 1em;
  margin-top: 20px;
  margin-bottom: 10px;
}
p 
{
  color: #fff;
  font-size: 0.8em;
  opacity: 0.85;
}
.group 
{
  position: relative;
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
  align-items: center;
}
.card .details h2 
{
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  font-size: 2em;
}
.card .details h2 sup 
{
  font-weight: 300;
}
.card .details h2 small 
{
  font-size: 0.75em;
}
.card .details input 
{
  display: inline-flex;
  padding: 10px 25px;
  background: #fff;
  font-weight: 500;
  text-decoration: none;
  text-transform: uppercase;
  font-weight: 600;
  color: #257dc1;
}
.viewphoto{
   margin: 0;
    text-decoration: none;
  color: #F97806;
  
  font-weight: 300;
 

}
 .cancelButton {
       position: absolute;
            top: 10px; /* Adjust the top position as needed */
            right: 15px; /* Adjust the right position as needed */
            background: none;
            border: none;
            cursor: pointer;
            color:darkgray;
            font-size: 20px;
}

.profilelogo{
text-decoration: none;
color:#F97806;
}
.success-message {
    color: green;
}

.error-message {
    color: red;
}
.report-button {
            background: #f9532d;
            margin-top: 10px;
            margin-left: 10px;
            padding: 10px;
            cursor: pointer;
        }
.report-button i {
            color: #fff;
        }
</style>
</head>
<body>
    <h4 class="error">${error }</h4>
    <c:if test="${not empty flash.success}">
        <div class="success-message">${flash.success}</div>
    </c:if>
    <c:if test="${not empty flash.error}">
        <div class="error-message">${flash.error}</div>
    </c:if>
    
  <form:form method="post" action="buyphoto" modelAttribute="user">
  <div class="card">
     
    <div class="imgBx">
      <a href=""><img src="data:image/jpeg;base64,${ph.base64image}" height="100%" width="100%" alt="Blob Image"/></a>
      <div class="report-button" onclick="location.href='/picpocket/users/photo?id=${ph.id}'">
                    <i class="fas fa-exclamation-triangle"></i>
            </div>
    </div>
    <div class="details">
    <a href="/picpocket/users/home" class="cancelButton"><i class="fas fa-times"></i></a>
    <%-- <a href="/picpocket/users/userprofileview?id=${ph.creator}"><img src="data:image/jpeg;base64,${ph.base64image}" height="50px" width="50px" alt="Blob Image"/></a> --%>
      <a href="/picpocket/users/userprofileview?id=${ph.creator}" class="profilelogo"> <i class="fa-sharp fa-solid fa-user"></i> View Profile |</a>
      <a href="/picpocket/users/viewphoto?id=${ph.id}" class="viewphoto"><i class="fa-sharp fa-solid fa-image"></i>View Photo</a>
      
      <h4>Name  </h4>
      <p>${ph.creatorname }</p>
      <h4>Title<br></h4>
      <p>${ph.title }</p>
      <h4>Description</h4>
      <p> ${ph.description }</p>
      <h4>Date</h4>
      <p> ${ph.date}</p>
      
       <input type="hidden" name="photo_id" value="${photoId}" />
      <div class="group">
        <h2>${ph.price }<small>p</small></h2>
        <input type="submit" value="Buy Now">
      </div>
    </div>
    
  </div>
  </form:form>
  
   <script>
    function confirmBuy() {
        Swal.fire({
            title: "Buy Photo",
            text: "Are you sure you want to buy this photo?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes"
        }).then((result) => {
            if (result.isConfirmed) {
                // Perform logout action here, for example, redirecting to the logout endpoint
                window.location.href = "home"; // replace "/logout" with your actual logout endpoint
            }
        });
    }
</script>
</body>
</html>