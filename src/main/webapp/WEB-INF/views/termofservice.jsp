<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
<link href='https://unpkg.com/box	icons@2.1.4/css/boxicons.min.css'rel='stylesheet'>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Term Of Service</title>
<style>
body {
       font-family: Arial, sans-serif;
       margin: 20px;
       line-height: 1.6;
     }

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
.menu {
        display: block;
        font-size: 1.5rem;
        font-weight: bold;
        color: var(--primary-color);
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

        section {
            max-width: 800px;
            margin: auto;
        }

        h2 {
            color: #333;
        }

        p {
            margin-bottom: 15px;
        }
		.pop{
			background-color: #f1f1f1;
			color:rgb(203, 121, 121);
		}
		.popa{
			background-color: #f1f1f1;
			color:rgb(203, 121, 121);
		}
		.popc{
		text-align: center;
    	padding: 20px;
    	background-color: #f1f1f1;
    	display: block; /* or display: inline-block; */
		}
		.container {
    	padding: 0 4.4rem;
		}
		
		li a.create,
li a.home {
    transition: .3s;
}

li a.create.active,
li a.create:hover,
li a.home.active,
li a.home:hover {
    color: var(--primary-color);
}

    </style>
</head>
<body>
<header class="container">
        <div class="page-header">
      		<a class="title" href="/picpocket/users/home">Picpocket</a>
            <ul>
               <li><a href="/picpocket/users/add" class="create">Create</a></li>
                <li><a href="/picpocket/users/home"  class="home" style="--navAni:1">Home</a></li>
               
        	<li class="dropdown">
            <a href="#" class="dropbtn">Setting</a>
            <div class="dropdown-content">
                <a href="#">About</a>
                <a onclick="confirmLogout()">Logout</a>
            </div>
        </li>
                <li> <a href="#"><i class="fas fa-bell"></i></a></li>
            <li><a href="profile"><i class="fas fa-user"></i></a></li>
            </ul>
        </div>
    </header>

	<h1 class="popc">Term Of Service</h1>
    <section>
        <h2>Thank you for using Picpocket</h2>
        <p>These Terms of Service ("Terms") govern your access to and use of any website, app, service, technology, API, widget, platform, channel or any other products or features owned, operated, branded or offered by Picpocket (Picpocket or the "Service"), except where we expressly state that separate terms (and not these) apply. For the purposes of these Terms, "we" or "us" refers to the party with whom you are entering into this agreement, per Section 13(e) (Parties). Please read these Terms carefully, and contact us if you have any questions. 

			You may not use the Service to do or share anything that is contrary to these Terms. For clarity, these Terms include, and incorporate by reference, the following policies:
			
			Our Community Guidelines , which explain what is and isn't allowed on Picpocket;
			Our Advertising Guidelines and Merchant Guidelines , which explain additional policies that apply to ads and merchants on Picpocket; and
			Our Enforcement practices, which explain how we put our policies into practice, including restrictions we may impose on your content on or use of Picpocket.
			By accessing or using Picpocket, you agree to be bound by these Terms. If you do not agree to our Terms, you must not access or use Picpocket.</p>

        <h2 class="popa">More simply put</h2>
        <p class="pop">Every company has its terms. These are ours. They include these Terms of Service and other policies listed above.</p>
		

    </section>
</body>
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
</html>