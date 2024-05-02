<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'rel='stylesheet'>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">

<title>Report Display</title>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
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

Nyo Nyo Thinn, [09-Feb-24 11:47 AM]
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
        width: 40%;
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

table {
  border-collapse: collapse;
  width: 70%;
}

th, td {
  text-align: left;
  padding: 9px;
}

tr:nth-child(even) {
  background-color: white;
}
tr:nth-child(odd) {
  background-color: white;
}
table, th, td {
  border: 2px solid white;
}
.dashboard-container {
    display: flex;
    height: 100vh;
}

.sidebar {
    background-color: #333;
    color: white;
    padding: 15px;
    min-width: 200px;
}

.sidebar h2 {
    text-align: center;
}

.sidebar ul {
    list-style-type: none;
    padding: 0;
}

.sidebar li {
   margin-bottom: 15px;
}

.sidebar a {
    text-decoration: none;
    color: white;
    padding: 8px;
    display: block;
    border-radius: 5px;
}

.sidebar a:hover {
    background-color: #555;
}

.sidebar a.active {
    background-color: #555;
}

.center-container {
            flex: 1;
            padding: 15px;
            overflow: auto;
        }
        
.center-content {
           max-width: 1200px; /* Adjust the maximum width as needed */
            margin: 0 auto; /* Adjust the maximum width as needed */
        }
.content texth2{
   margin-top: 20px;
}
  .sidebar ul.vertical-menu {
        list-style-type: none;
        padding: 0;
    }
.fas duotone fa-user{
  display:center;
}
.display{
color:black;
}
  </style>
</head>
<body>
<div class="text-danger">${error}</div>
<header class="container">
        <div class="page-header">
          <a class="title" href="/picpocket/admins/">Picpocket</a>
            <input type="text" class="search" placeholder="Search">
            <ul>
               
                <li><a href="/picpocket/admins/"  class="active" style="--navAni:1">Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropbtn">Account</a>
          <div class="dropdown-content">
            
            <a href="userregister">Logout</a>
          </div>
        </li>
        
                <li> <a href="#"><i class="fas fa-bell"></i></a></li> 
            </ul>
            <label class="mode">
                <input type="checkbox" id="darkModeToggle">
                <i class='bx bxs-moon'></i>
            </label>
        </div>
  </header>

<div class="dashboard-container">
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <br>
        <div class="vertical-menu">
            <a href="http://localhost:8080/picpocket/admins/">Display Users</a>
            <br><br>
            <a href="#" class="active">Report</a>
            <br><br>
            <a href="#">Products</a>
            <br><br>
            <a href="#">Settings</a>
            <br><br>
        </div>
    </div>
   
    
    <div class="center-container">
    <div class="center-content"> 
        <h2 class="texth2">Reports</h2>
        <div style="overflow-x: auto;" class="container1">
            <table id="reportsTable" class="display">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Photo_ID</th>
                        <th>User_ID</th>
            <th class="sorting" tabindex="0" aria-controls="reportsTable" rowspan="1" colspan="1" style="width: 20px;" aria-label="Image: activate to sort column ascending">Image</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="rp" items="${reports}">
                        <tr>
                            <td>${rp.description}</td>
                            <td>${rp.date}</td>
                            <td>${rp.photo_id}</td>
                            <td>${rp.user_id}</td>
                            <td>
                                <figure>
                                    <a href="#">
                                        <img src="data:image/jpeg;base64,${rp.base64image}" height="100%" width="90%" alt="Blob Image"/>
                                    </a>
                                </figure>
                          
                            </td>
                             <%-- <td>
                                <c:choose>
                                    <c:when test="${rp.ban == false}">
                                        <a href="enable/${user.id}" style="color: red">Ban</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="disable/${user.id}">UnBan</a>
                                    </c:otherwise>
                                </c:choose>
                            </td> --%>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
 </div>
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
    </script> 
    
  <script>
    $(document).ready(function () {
        $('#reportsTable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "pageLength": 10
        });
    });
  </script>
    
</body>
</html>