<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="your-api-key" crossorigin="anonymous"/>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
    <title>Profile</title>
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
    padding: 0 8.4rem;
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

/* Nav End */

/* Section 1 */

.main {
    padding: 6rem 0;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    row-gap: 2rem;
    column-gap: 6rem;
    align-items: center;
}

.main h3 {
    color: #000;
    font-size: 1.5rem;
    opacity: 0;
    animation: topSideAni 1s ease forwards;
}

.main h1 {
    color: #000;
    font-size: 4rem;
    font-weight: 600;
    opacity: 0;
    animation: leftSideAni 1s ease forwards;
    animation-delay: 1s;
}

.social {
    display: flex;
    flex-wrap: wrap;
    gap: 1.4rem;
    margin-top: 1.4rem;
}

.social a {
    display: grid;
    place-items: center;
    text-decoration: none;
    color: var(--primary-color);
    border: 1.6px solid var(--primary-color);
    font-size: 1.5rem;
    border-radius: 50%;
    padding: 0.39rem;
    text-align: center;
    opacity: 0;
    animation: SocialAni 1s ease forwards;
    animation-delay: calc(.2s * var(--socialAni));
}

.social a:hover {
    color: var(--primary-dark);
    background-color: var(--primary-color);
    box-shadow: 0 0 20px var(--primary-color);
    transition: all .3s ease-in-out;
}


.images {
    border-radius: 10px;
    width: 300px;
    /* opacity: 0; */
    /* animation: imageAni 1s ease forwards; */
    /* animation-delay: 1.5s */
}
.images {
    background: linear-gradient(145deg, #e2e8ec, #ffffff);
    box-shadow: 5px 5px 15px #D1D9E6, -5px -5px 15px #ffffff;
    border-top: 2px solid var(--primary-color);
}

/* Section 1 End */


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
    box-shadow: 0 4px 17px rgb(80 80 80 / 31%);
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
  * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body {
  min-height: 100vh;
  width: 100%;
  background: #eeeceb;
}
footer {
  position: fixed;
  background: #10182f;
  width: 100%;
  bottom: 0;
  left: 0;
}
footer::before {
  content: "";
  position: absolute;
  left: 0;
  top: 100px;
  height: 1px;
  width: 100%;
  background: #afafb6;
}
footer .bottom-details {
  width: 100%;
  background: #2e2748;
}
footer .bottom-details .bottom_text {
  max-width: 1250px;
  margin: auto;
  padding: 20px 40px;
  display: flex;
  justify-content: space-between;
}
.bottom-details .bottom_text span,
.bottom-details .bottom_text a {
  font-size: 14px;
  font-weight: 300;
  color: #fff;
  opacity: 0.8;
  text-decoration: none;
}
.bottom-details .bottom_text a:hover {
  opacity: 1;
  text-decoration: underline;
}
.bottom-details .bottom_text a {
  margin-right: 10px;
}





.gallery {
  font-size: 2.5rem;
  font-family: system-ui;
  line-height: 1.1;
  font-weight: 600;
  color: #f9532d;
  margin: 4rem auto 1rem;
  width: 85%;
  max-width: 1280px;
}

.slider {
  width: 85%;
  max-width: 1280px;
  margin: 0 auto;
}

.slider__content {
  overflow-x: scroll;
  -ms-scroll-snap-type: x mandatory;
      scroll-snap-type: x mandatory;
  display: flex;
  gap: 1rem;
  padding-bottom: 1rem;
  scrollbar-color: var(--scrollcolor) var(--scrollbackground);
}
.slider__content::-webkit-scrollbar {
  height: 0.5rem;
  width: 0.5rem;
  border-radius: 1rem;
  background: var(--scrollbackground);
}
.slider__content::-webkit-scrollbar-thumb {
  border-radius: 1rem;
  background: var(--scrollcolor);
}
.slider__content::-webkit-scrollbar-track {
  border-radius: 1rem;
  background: var(--scrollbackground);
}

.slider__item {
  scroll-snap-align: start;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  min-width: 30%;
  width: 30%;
  border-radius: 0.25rem;
  overflow: hidden;
  position: relative;
  aspect-ratio: 1;
}
@media (min-width: 460px) {
  .slider__item {
    aspect-ratio: 2/3;
    min-width: calc((100% / 2) - 2rem);
  }
}
@media (min-width: 940px) {
  .slider__item {
    min-width: calc((100% / 3) - 4rem);
  }
}

.slider__image {
  display: block;
  width: 100%;
  height: 100%;
  -o-object-fit: cover;
     object-fit: cover;
  position: absolute;
  top: 0;
  left: 0;
}

.slider__info {
  position: relative;
  padding: 4rem 2rem 2rem;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.75), rgba(32, 50, 57, 0));
}
.slider__info h2 {
  color: #fff;
  font-family: system-ui;
  line-height: 1.1;
  font-weight: 300;
  font-size: 1.75rem;
  margin: 0;
}

.slider__nav {
  margin: 1rem 0 4rem;
  width: 100%;
  padding: 0;
  display: flex;
  justify-content: flex-start;
  gap: 1rem;
  align-content: center;
  align-items: center;
 
}
@media (min-width: 460px) {
  .slider__nav {
    justify-content: flex-end;
  }
}

.slider__nav__button {
  margin: 0;
 
  border: 0;
  border-radius: 2rem;
  background: #fff;
  color: #203239;
  padding: 0.5rem 1rem;
  font-size: 0.75rem;
  line-height: 1;
  pointer-events: none;
  transition: 0.2s ease-out;
  opacity: 0.25;
}
.slider__nav__button--active {
  opacity: 1;
  pointer-events: auto;
  cursor: pointer;
}
 .sell{
      --scrollcolor: #d3a7a7;
  --scrollbackground: #141e27;
  box-sizing: border-box;
    }

.more{
	 margin: 0;
  	text-decoration: none;
	color: #ffffff:
	
	font-weight: 600;
 
	
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
.my-box {
    min-width: 200px; /* Adjust width based on content */
    height: 40px;
    border: 2px solid #000000;
    padding: 10px;
    border-radius: 5px;
    margin: 20px;
    text-align: center;
    cursor: pointer;
    background-color: #ecf0f1;
    color: #000000;
    transition: background-color 0.3s, color 0.3s;
}
.point{
    display: flex;
    justify-content: end;
    width: 54%;
    padding-top: 20px 40px;
    align-items: center;
}

.but{
    display: flex;
    justify-content: end;
    width: 36%;
    padding-bottom: 5px;
    align-items: center;
    gap: 10px;
   
}

.but button{
    padding: 8px 20px;
    width: 100px;
    border-radius: 6px;
   
}

.confirm-box {
    display: none;
    position: fixed;
    top: 55%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 80px;
    border-radius: 10%;
    background-color: #68d1cc;
    border: 1px solid #24a4b4;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}
.confirm-box h2{
            font-size: 30px;
            font-weight:500;
            margin: 15px 0 5px;
            margin-bottom: 20px;
        }
        .confirm-box p{
          margin-bottom: 20px;
        }
        .contact-info {
            display: flex;
            align-items: center;
            gap: 20%;
        }

        .contact-info a {
            display: flex;
            align-items: center;
            margin-right: 15px; /* Adjust the margin as needed */
            text-decoration: none;
            font-size: 24px;
        }

        .contact-info i {
            margin-right: 5px;
            font-size: 40px;
        }
.confirm-box button {
        width: 100%;
            margin-top: 10px;
            padding: 20px 0;
            background: #6fd649;
            color: #fff;
            outline: none;
            font-size: 18px;
            border-radius: 4px;
            cursor: pointer;
            box-sizing: 0 2px 5px rgba(0,0,0,0,2) ;
            
}
.editprofile{
	background: #f9532d;
	color: black;
	justify-content: end;
	text-decoration:none;
}
.updatepassword{
	background: #f9532d;
	color: black;
	justify-content: end;
	text-decoration:none;
}

    </style>
</head>

<body>
    <header class="container">
        <div class="page-header">
            <a class="title" href="/picpocket/users/home">Picpocket</a>

            <ul>
            	<li><a href="add" class="create">Create</a></li>
                <li><a href="/picpocket/users/home"  style="--navAni:1">Home</a></li>
               
        
        	<li class="dropdown">
            <a href="#" class="dropbtn">Setting</a>
            <div class="dropdown-content">
                <a href="#">About</a>
                 <a onclick="confirmLogout()">logout</a>
            </div>
        </li>
                <li> <a href="#"><i class="fas fa-bell"></i></a></li>
            <li><a href="profile" class="active"><i class="fas fa-user"></i></a></li>
            </ul>
            <label class="mode">
                <input type="checkbox" id="darkModeToggle">
                <i class='bx bxs-moon'></i>
            </label>
			
		</div>
    </header>


    <section class="container">
        <div class="main">
			<div class="images">
				<label for="photoInput" class="custom-file-label"
					style="cursor: pointer;"> <img
					src="data:image/jpeg;base64,${photos.base64image}" height="100%"
					width="100%" alt="Blob Image" />
				</label> 
				<input type="file" class="custom-file-input" id="photoInput"
					name="profile_photo" accept="image/*" style="display: none;">
			</div>

			<div class="detail">
                <h3>Hi, I'm</h3>
                <h1><span style="color:#f9532d;">${user.name } </span> </h1> 
                <div><b>Address :${user.address }</b></div>
                <div><b>Phone Number :${user.phone_no }</b></div>
                <a href="editprofile" class="editprofile"><i class="fas fa-pen-square"></i>Edit profile<br></a>
                <a href="updatepassword" class="updatepassword"><i class="fas fa-pen-square"></i>Update Password</a>
				<div class="point">
					<h3>Points</h3>
					<div class="my-box">${data.totalamount}</div>

				</div>
				<div class="but">
            <button id="Buy" style="background: #16e472;">Disposite</button>
            <button id="confirmButton" style="background: #f9532d;">Withdraw</button>
        </div>
            </div>
        </div>
    <div class="sell">   
      <h1 class="gallery">Sell Photo</h1>
<div class="slider" x-data="{start: true, end: false}">
  <div class="slider__content" x-ref="slider" x-on:scroll.debounce="$refs.slider.scrollLeft == 0 ? start = true : start = false; Math.abs(($refs.slider.scrollWidth - $refs.slider.offsetWidth) - $refs.slider.scrollLeft) < 5 ? end = true : end = false;">

					<c:choose>
						<c:when test="${empty sellposts}">
							<p>No matches found</p>
						</c:when>
						<c:otherwise>

							<c:forEach items="${sellposts}" var="sellpost">

								<div class="slider__item">

									<img class="slider__image"
										src="data:image/jpeg;base64,${sellpost.base64image}" alt="Image">

									<div class="slider__info">
										<h3>${sellpost.title }</h3>
										<h4>${sellpost.description }</h4>
										<h4>${sellpost.date }</h4>
										<h5>${sellpost.creatorname }</h5>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
    
     
       <div class="slider__nav">
    <button class="slider__nav__button" x-on:click="$refs.slider.scrollBy({left: $refs.slider.offsetWidth * -1, behavior: 'smooth'});" x-bind:class="start ? '' : 'slider__nav__button--active'">Previous</button>
    <button class="slider__nav__button" x-on:click="$refs.slider.scrollBy({left: $refs.slider.offsetWidth, behavior: 'smooth'});" x-bind:class="end ? '' : 'slider__nav__button--active'">Next</button>
  	<a href="/picpocket/users/viewmoresellphotos" class="more"> ViewMore......</a>
	</div>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.10.2/cdn.js'></script><script  src="./script.js"></script>
        
  </div>
  
    <div class="sell">   
      <h1 class="gallery">Buy Photos</h1>
<div class="slider" x-data="{start: true, end: false}">
  <div class="slider__content" x-ref="slider" x-on:scroll.debounce="$refs.slider.scrollLeft == 0 ? start = true : start = false; Math.abs(($refs.slider.scrollWidth - $refs.slider.offsetWidth) - $refs.slider.scrollLeft) < 5 ? end = true : end = false;">

					<c:choose>
						<c:when test="${empty buyposts}">
							<p>No matches found</p>
						</c:when>
						<c:otherwise>

							<c:forEach items="${buyposts}" var="buypost">

								<div class="slider__item">

									<img class="slider__image"
										src="data:image/jpeg;base64,${buypost.base64image}" alt="Image">

									<div class="slider__info">
										<h3>${buypost.title }</h3>
										<h4>${buypost.description }</h4>
										<h4>${buypost.date }</h4>
										<h5>${buypost.creatorname }</h5>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
    
     
       <div class="slider__nav">
    <button class="slider__nav__button" x-on:click="$refs.slider.scrollBy({left: $refs.slider.offsetWidth * -1, behavior: 'smooth'});" x-bind:class="start ? '' : 'slider__nav__button--active'">Previous</button>
    <button class="slider__nav__button" x-on:click="$refs.slider.scrollBy({left: $refs.slider.offsetWidth, behavior: 'smooth'});" x-bind:class="end ? '' : 'slider__nav__button--active'">Next</button>
  	<a href="/picpocket/users/viewmorebuyphotos" class="more"> ViewMore......</a>
	</div>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.10.2/cdn.js'></script><script  src="./script.js"></script>
        
  </div>
  
    
    
    
  <div id="confirmBox" class="confirm-box">
    <div class="contact-info">
      <a href="tel:09791827439"><i class="fab fa-viber"></i>09791827439</a>
      <a href="https://t.me/thiha441"><i class="fab fa-telegram"></i>09441890272</a>
  </div>
    <h2>If you want to buy points,content the following viber number</h2>
    <p>1 point = 900 mmk</p>
    <p>5 points = 4800 mmk</p>
    <p>10 points = 9500 mmk</p>
    <button id="noButton">Cancel</button>
</div>
<div id="buyBox" class="confirm-box">
  <div class="contact-info">
    <a href="tel:09791827439"><i class="fab fa-viber"></i>09791827439</a>
    <a href="https://t.me/thiha441"><i class="fab fa-telegram"></i>09441890272</a>
</div>
    <h2>If you want to buy points,content the following viber number</h2>
    <p> 1000 mmk = 1 point</p>
    <p>5000 mmk = 5 points</p>
    <p>10000 mmk = 10 points</p>
    <p>If you want to exchange the point in a cash, you need to pay service fees.</p>
    <button id="cancalButton">Cancel</button>
</div>
<div>

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.10.2/cdn.js'></script><script  src="./script.js"></script>
    </div>  
    
    </section>
   
 	<script >
 	document.getElementById('confirmButton').addEventListener('click', function() {
 	    // Show confirmation box
 	    document.getElementById('confirmBox').style.display = 'block';

 	    document.getElementById('noButton').addEventListener('click', function() {
 	        // Close the confirmation box
 	        document.getElementById('confirmBox').style.display = 'none';

 	        
 	    });
 	});
 	document.getElementById('Buy').addEventListener('click', function() {
 	    // Show confirmation box
 	    document.getElementById('buyBox').style.display = 'block';

 	    document.getElementById('cancalButton').addEventListener('click', function() {
 	        // Close the confirmation box
 	        document.getElementById('buyBox').style.display = 'none';

 	        
 	    });
 	});
 	</script>
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
    </script>
	<script>
    document.addEventListener('DOMContentLoaded', function () {
        const photoInput = document.getElementById('photoInput');

        // Trigger file input click event when the displayed photo is clicked
        document.querySelector('.images label').addEventListener('click', function () {
            photoInput.click();
        });

        // Update the displayed photo when a new photo is selected
        photoInput.addEventListener('change', function () {
            const selectedFile = photoInput.files[0];
            if (selectedFile) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.querySelector('.images img').src = e.target.result;
                };
                reader.readAsDataURL(selectedFile);
            }
        });
        const profileImageBlob = '${photos.base64image}';
        if (!profileImageBlob) {
            // Set the default photo source if the profile image blob is null
            document.querySelector('.images img').src = 'path_to_default_photo.jpg';
        }
    });
</script>
	
<script>
    function confirmLogout() {
        Swal.fire({
            title: "Logout",
            text: "Are you sure you want to logout?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, logout"
        }).then((result) => {
            if (result.isConfirmed) {
                // Perform logout action here, for example, redirecting to the logout endpoint
                window.location.href = "logout"; // replace "/logout" with your actual logout endpoint
            }
        });
    }
</script>
</body>

</html>