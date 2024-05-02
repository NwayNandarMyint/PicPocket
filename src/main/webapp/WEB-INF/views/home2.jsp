<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'rel='stylesheet'>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>

<title>Home</title>
<style>
        :root {
    --primary-color: #f9532d;
    --primary-dark: #1F252E;
}

* {
    margin: 0;
    padding: 0;
    scroll-behavior: smooth;
}

body {
    font-family: 'Outfit', sans-serif;
    background: #ffffff;
    height: 100vh;
    color: #000;
}

/* Genral */
.container {
    padding: 0 4.4rem;
}

.img-w {
    width: 100%;
    height: auto;
}

/* Nav */
header {
    box-shadow: 0 4px 17px rgba(0, 0, 0, .1);
    background: #fff;
    position: sticky;
    top: 0;
    z-index: 1;
}

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 0;
}
.logo {
    font-size: 1.5rem;
    font-weight: 800;
    opacity: 0;
    animation: leftSideAni 1s ease forwards;
}

.logo a {
    color: #000;
    text-decoration: none;
}

ul {
    display: flex;
    gap: .6rem;
    list-style-type: none;
    background-color: transparent;
    overflow: hidden;
}

li a {
    display: inline-block;
    padding: .3rem 1rem;
    color: #000;
    text-decoration: none;
    font-size: 1.05rem;
    font-weight: 600;
    letter-spacing: .7px;
    border-radius: 36px;
    line-height: 2;
    transition: .3s;
    opacity: 0;
    animation: navani .3s ease forwards;
    animation-delay: calc(.15s * var(--navAni));
}

li a.active,
li a:hover {
    color: var(--primary-color);
}

#click {
    display: none;
}

.menu {
    display: none;
}

.mode i {
    font-size: 1.4rem;
    cursor: pointer;
    color: var(--primary-color);
    opacity: 0;
    animation: rightSideAni 1.5s ease forwards;
}
.dark-mode {
    background-color: var(--primary-dark);
    color: #ffffff;
}

.mode input {
    display: none;
}

.dark-mode .logo a, 
.dark-mode ul li a, 
.dark-mode .main h3, 
.dark-mode .main h1 {
    color: #fff;
}
.dark-mode ul li a.active, .dark-mode ul li a:hover {
    color: var(--primary-color);
}
.dark-mode .images {
    background: linear-gradient(145deg, #1f252e, #2e3239);
    box-shadow: 10px 10px 19px #1c1e22, -10px -10px 19px #1b1f27;
    border-top: 2px solid var(--primary-color);
    border-bottom-left-radius: 60px;
    border-bottom-right-radius: 60px;
    margin: auto;
    overflow: hidden;
}

.dark-mode header {
    box-shadow: 0 4px 17px rgba(255, 252, 252, 0.31);
    background: var(--primary-dark);
}



/* Animation */
@keyframes leftSideAni {
    0% {
        transform: translateX(-100px);
        opacity: 0;
    }

    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

@keyframes navani {
    0% {
        transform: translateY(100px);
        opacity: 0;
    }

    100% {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes rightSideAni {
    0% {
        transform: translateX(100px);
        opacity: 0;
    }

    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

@keyframes topSideAni {
    0% {
        transform: translateY(-100px);
        opacity: 0;
    }

    100% {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes SocialAni {
    0% {
        transform: translateY(100px);
        opacity: 0;
    }

    100% {
        transform: translateY(0);
        opacity: 1;
    }
}

.dropdown {
    display: inline-block;
}

.dropbtn {
    display: inline-block;
    padding: .3rem 1rem;
    color: #000;
    text-decoration: none;
    font-size: 1.05rem;
    font-weight: 600;
    letter-spacing: .7px;
    border-radius: 36px;
    line-height: 2;
    transition: .3s;
    opacity: 0;
    animation: navani .3s ease forwards;
    animation-delay: calc(.15s * var(--navAni));
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #F97806;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: #000;
    padding: .3rem 1rem;
    display: block;
    text-decoration: none;
    font-size: 1.05rem;
    font-weight: 600;
    letter-spacing: .7px;
    border-radius: 36px;
    line-height: 2;
    transition: .3s;
}

.dropdown-content a:hover {
    color: #fff;
}

.dropdown:hover .dropdown-content {
    display: block;
}
@keyframes imageAni {
    0% {
        opacity: 0;
        transform: scale(0);
    }

    100% {
        opacity: 1;
        transform: scale(1);
    }
}

@media screen and (max-width: 1024px) {
    .container {
        padding: 0 4.4rem;
    }

    .main h3 {
        color: #000;
        margin-top: 1rem;
    }
}

@media screen and (max-width: 768px) {
    .container {
        padding: 0 1.6rem;
    }
}

@media screen and (max-width:600px) {
    body {
        height: auto;
    }

    header {
        height: auto;
    }

    ul {
        background: #fff;
        width: 100%;
        height: 100vh;
        position: absolute;
        display: flex;
        flex-direction: column;
        text-align: center;
        top: 3.4rem;
        left: -100%;
        z-index: 111111;
    }

    .menu {
        display: block;
        font-size: 1.5rem;
        font-weight: bold;
        color: var(--primary-color);
    }

    #click:checked~ul {
        left: 0%;
        transition: all 0.3s ease;
    }
    .dark-mode .menu {
        color: var(--primary-color);
    }

    .dark-mode ul {
        background: var(--primary-dark);
    }

    .mode {
        position: absolute;
        right: 4rem;
    }
    .images {
        width: 100%;
        margin: auto;
    }

    .main {
        margin-top: 2rem;
    }
}
.title{
  text-align: left;
  font-size: 30px;
  font-style: italic;
  font-weight: 600;
  font-family: 'Poppins', sans-serif;
  background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
input{
    width: 25%;
    padding: 10px;
    border-radius: 20px;
    border: none;
    outline: none;
    background: #E9E9E9;
    font-weight: 500;
}




 #gallery {
            margin: 2em;
        }
 .image-container {
            display: flex;
            flex-wrap: wrap;
            gap: 0px; /* Increased gap between images */
            justify-content: center; /* Center the images */
        }

       
.imagesContainer .imageBox {
  position: relative;
  width: 150px;
  height: 150px;
  border: 3px solid rgb(248, 101, 101);
  border-radius: 20px;
  overflow: hidden;
}

.imagesContainer .imageBox img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: all 0.3s ease-in-out;
}

.imagesContainer .imageBox:hover img {
  transform: scale(1.1);
}
        
        
        figure {
  font-family: "Montserrat", Arial, sans-serif;
  position: relative;
  display: inline-block;
  overflow: hidden;
  margin: 10px;
  min-width: 150px;
  max-width: 200px;
  width: 100%;
  border-radius:8px;
  color: #fff;
  text-align: left;
  font-size: 16px;
  background: #080808;
   gap: 2px;
}

figure img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
  object-fit:cover;
}

figure::before,
figure::after {
  position: absolute;
  top: 20px;
  right: 20px;
  content: "";
  background-color: #fff;
  z-index: 1;
  opacity: 0;
}

figure:before {
  width: 0;
  height: 1px;
}

figure:after {
  height: 0;
  width: 1px;
}

figure figcaption {
  position: absolute;
  left: 0;
  bottom: 0;
  padding: 15px 20px;
}

figure h3,
figure h4 {
  margin: 0;
  font-size: 1.1em;
  font-weight: normal;
  opacity: 0;
}

figure h4 {
  font-size: 0.8em;
  text-transform: uppercase;
}

figure:hover img {
  opacity: 0.2;
}

figure:hover::before,
figure:hover::after {
  opacity: 1;
  -webkit-transition-delay: 0.25s;
  transition-delay: 0.25s;
}

figure:hover::before {
  width: 40px;
}

figure:hover::after {
  height: 40px;
}

figure:hover h3,
figure:hover h4 {
  opacity: 1;
}

figure:hover h3 {
  transition-delay: 0.3s;
}

figure:hover h4 {
  transition-delay: 0.35s;
}

.footer {
   background-color: transparent;
    color: red;
    text-align: center;
    padding: 20px;
    position: fix; /* Fix the position */
    bottom: 0; /* Align to the bottom */
    width: 100%;
    display: flex; /* Change 'fix' to 'flex' for display property */
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
}
        }
.footer a {
            color: #fff;
            text-decoration: none;
        }

.footer a:hover {
            text-decoration: underline;
        }
.pagination {
  display: flex;
  justify-content: center;
  margin-top: 20px; /* Adjust the top margin as needed */
}
.pagination a {
  color: #1a2eb5;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: #F97806;
}
.pagination a:hover:not(.active) {background-color: #F97806;}

.footer1{
	background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;

}
</style>
    <title>Home</title>
</head>

<body>
    <header class="container">
        <div class="page-header">
      		<a class="title" href="/picpocket/users/">Picpocket</a>
            <input type="text" class="search" placeholder="Search">
            <ul>
               <li><a href="/picpocket/users/userlogin" class="create">Create</a></li>
                <li><a href="/picpocket/users/"  class="active" style="--navAni:1">Home</a></li>
                <li class="dropdown">
            <a href="#" class="dropbtn">Account</a>
            <div class="dropdown-content">
                <a href="userlogin">Sign In</a>
                <a href="/picpocket/users/userregister">Sign Up</a>
            </div>
        </li>
        	<li class="dropdown">
            <a href="#" class="dropbtn">Setting</a>
            <div class="dropdown-content">
                <a href="#">About</a>
            </div>
        </li>
                <li> <a href="userlogin"><i class="fas fa-bell"></i></a></li>
            <li><a href="userlogin"><i class="fas fa-user"></i></a></li>
            </ul>
            <label class="mode">
                <input type="checkbox" id="darkModeToggle">
                <i class='bx bxs-moon'></i>
            </label>
        </div>
    </header>
    
    

	<section id="gallery">
		<div class="image-container">

			<c:choose>
				<c:when test="${empty photos}">
					<p>No photo found</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${photos}" var="phh">
						<c:if test=""></c:if>
						<figure>

							<a href="/picpocket/users/userlogin"><img src="data:image/jpeg;base64,${phh.base64image}" height="100%" width="100%" alt="Blob Image"/></a>
							<figcaption>
								
								<h3>${phh.title }</h3>
								<h3>${phh.description }</h3>
								<h4>${phh.price }</h4>
								<h4>${phh.creatorname }</h4>
								
							</figcaption>
						</figure>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${totalPages > 1}">
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}"><i class="fas fa-backward"></i></a>
        </c:if>
        
        <c:set var="startPage" value="${currentPage - 1}" />
        <c:if test="${startPage < 1}">
            <c:set var="startPage" value="1" />
        </c:if>
        
        <c:set var="endPage" value="${currentPage + 1}" />
        <c:if test="${endPage > totalPages}">
            <c:set var="endPage" value="${totalPages}" />
        </c:if>
        
        <c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == currentPage}">
                    <strong>${pageNumber}</strong>
                </c:when>
                <c:otherwise>
                    <a href="?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}"><i class="fas fa-forward"></i></a>
        </c:if>
    </div>
</c:if>
		
	
	</section>
	<div class="footer">
        <p>&copy; 2024 PickPockets | <a href="#" class="footer1">Privacy Policy</a> | <a href="termofservicelo" class="footer1">Terms of Service</a></p>
    </div>

    <script>
        const darkModeToggle = document.getElementById('darkModeToggle');
        const body = document.body;
        const isDarkMode = localStorage.getItem('darkMode') === 'enabled';
        if (isDarkMode) {
            body.classList.add('dark-mode');
            darkModeToggle.checked = true;
        }
        darkModeToggle.addEventListener('change', () => {
            if (darkModeToggle.checked) {
                body.classList.add('dark-mode');
                localStorage.setItem('darkMode', 'enabled');
            } else {
                body.classList.remove('dark-mode');
                localStorage.setItem('darkMode', 'disabled');
            }
        });
        
        document.addEventListener("DOMContentLoaded", function () {
            const searchInput = document.querySelector('.search');
            const images = document.querySelectorAll('.image-container figure');

            searchInput.addEventListener('input', function () {
                const searchTerm = searchInput.value.toLowerCase();

                images.forEach(image => {
                    const title = image.querySelector('figcaption h3').innerText.toLowerCase();
                    const description = image.querySelector('figcaption h4').innerText.toLowerCase();

                    if (title.includes(searchTerm) || description.includes(searchTerm)) {
                        image.style.display = 'block';
                    } else {
                        image.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>


</html>
