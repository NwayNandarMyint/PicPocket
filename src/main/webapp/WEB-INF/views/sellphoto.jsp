<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>SellPic</title>
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
    padding: 0 3.4rem;
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
input{
    width: 25%;
    padding: 10px;
    border-radius: 20px;
    border: none;
    outline: none;
    background: #E9E9E9;
    font-weight: 500;
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
.input-field {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.submit-btn {
    background-color: #55087B;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
.submit-btn:hover {
    background-color: #AD62D3;
}
.container form {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}

.input-field{
	background-color: #ffff;
	color: black;
	display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}


	form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #7398ef;
            border-radius: 17px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            font-size: 1.1rem;
            color: #1F252E;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .submit-btn {
            display: inline-block;
            background-color: #55087B;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #AD62D3;
        }


</style>
</head>

<body>
    <header class="container">
        <div class="page-header">
            <a class="title" href="/picpocket/users/home">Picpocket</a>
            <input type="text" class="search" placeholder="Search">
            <input type="checkbox" id="click">
			
            <ul>
            	<li><a href="add"  class="active">Create</a></li>
                <li><a href="/picpocket/users/home"   style="--navAni:1">Home</a></li>
                
        	<li class="dropdown">
            <a href="#" class="dropbtn">Setting</a>
            <div class="dropdown-content">
                <a href="#">Account Management</a>
                <a href="#">About</a>
                 <a onclick="confirmLogout()">logout</a>
            </div>
        </li>
                <li> <a href="#"><i class="fas fa-bell"></i></a></li>
            <li><a href="profile"><i class="fas fa-user"></i></a></li>
            </ul>
            <label class="mode">
                <input type="checkbox" id="darkModeToggle">
                <i class='bx bxs-moon'></i>
            </label>
		</div>
    </header>
    <div class="container">
        <form:form action="photocreate" method="post" modelAttribute="photo" enctype="multipart/form-data">
        	<form:label path="title" >Title</form:label>
            <form:input type="text" path="title" class="input-field" required="required" ></form:input>
            
            <form:label path="description" >Description</form:label>
            <form:input type="text" path="description" class="input-field" required="required" ></form:input>
            
            <form:label path="price" >price</form:label>
            <form:input type="text" path="price" class="input-field" required="required" ></form:input>
            
           
            <form:label path="imagepath" >Product Image</form:label>
            <form:input type="file" path="imagepath" class="input-field" id="imageInput" accept="image/*" required="required" ></form:input>

			
			<input type="submit"  onclick="addWatermark()" class="submit-btn" value="Upload photo">
			
			
        </form:form>
    </div>
    <script>
        const imageInput = document.getElementById('imageInput');
        const canvas = document.getElementById('canvas');
        const ctx = canvas.getContext('2d');

        let originalImage;

        imageInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            const reader = new FileReader();

            reader.onload = function(e) {
                originalImage = new Image();
                originalImage.onload = function() {
                    canvas.width = originalImage.width;
                    canvas.height = originalImage.height;
                    ctx.drawImage(originalImage, 0, 0);
                };
                originalImage.src = e.target.result;
            };

            reader.readAsDataURL(file);
        });

        function addWatermark() {
            if (!originalImage) {
                alert('Please select an image first.');
                return;
            }

            // Render the original image
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.drawImage(originalImage, 0, 0);

            // Add watermark text
            ctx.font = '80px Arial';
            ctx.fillStyle = 'rgba(255, 255, 255, 0.9)'; // White color with transparency
            ctx.fillText('Your Watermark', 90, 60);
        }

        function removeWatermark() {
            if (!originalImage) {
                alert('Please select an image first.');
                return;
            }

            // Clear the canvas and redraw the original image
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.drawImage(originalImage, 0, 0);
        }
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
