<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Product Card UI Design</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
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
	width: 300px;
	height: 380px;
	background: #e3dbdb00;
	display: flex;
	box-shadow: 0 15px 45px rgba(220, 216, 216, 0.1);
	overflow: hidden;
	transition: 0.5s ease-in-out;
}
.card:hover 
{
	width: 600px;
}
.card .imgBx 
{
	position: relative;
	min-width: 300px;
	height: 100%;
	background: #f9f9f9;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 10;
}
.card .imgBx  img 
{
	max-width: 250px;
	transition: 0.5s ease-in-out;
}

.card .details 
{
	position: absolute;
	left: 0;
	width: 300px;
	height: 100%;
	background: #273941;
	display: flex;
	justify-content: center;
	padding: 20px;
	flex-direction: column;
	transition: 0.5s ease-in-out;
}
.card:hover .details 
{
	left: 300px;
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
.size 
{
	display: flex;
	gap: 10px;
}
.size li 
{
	list-style: none;
	color: #fff;
	font-size: 0.9em;
	width: 40px;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 2px solid #fff;
	cursor: pointer;
	font-weight: 500;
	opacity: 0.5;
}
.size li:hover 
{
	background: #fff;
	color: #4ba9e9;
	opacity: 1;
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
	color: #3e08ef:
	
	font-weight: 300;
 

}
.header {
   display: flex;
   margin: 0;
   padding: 20px;
   font-size: 40px;
   align-items: center;
}

.header i {
   color: black;
   margin-right: 20px;
}
.profilelogo{
text-decoration: none;
}
</style>
</head>
<body>
    <div class="header">
        <a href="/picpocket/admins/photobanlists">
            <i class="fas fa-backward"></i>
        </a>
    </div>

    <div class="card">
        <div class="imgBx">
            <a href=""><img src="data:image/jpeg;base64,${ph.base64image}" height="100%" width="100%" alt="Blob Image"/></a>
        </div>
        <div class="details">
            <a href="/picpocket/admins/adminprofileview?id=${ph.creator}" class="profilelogo"> <i class="fa-sharp fa-solid fa-user"></i> View Profile</a>
            <a href="/picpocket/admins/adminviewphoto?id=${ph.id}" class="viewphoto"><i class="fa-sharp fa-solid fa-image"></i>View Photo</a>
			
                   
            <c:choose>
                <c:when test="${ph.ban == false}">
                    <a href="ban/${ph.id}" style="color: red"><i class="fa-solid fa-image-slash"></i>Ban</a>
                </c:when>
                <c:otherwise>
                    <a href="unban/${ph.id}"><i class="fa-sharp fa-solid fa-shield-check"></i>UnBan</a>
                </c:otherwise>
            </c:choose>

            <h4>Name  </h4>
            <p>${ph.creatorname }</p>
            <h4>Title<br></h4>
            <p>${ph.title }</p>
            <h4>Description</h4>
            <p> ${ph.description }</p>
            <h4>Date</h4>
            <p> ${ph.date}</p>

            <input type="hidden" name="photo_id" value="${photoId}" />
        </div>
    </div>
</body>
</html>
