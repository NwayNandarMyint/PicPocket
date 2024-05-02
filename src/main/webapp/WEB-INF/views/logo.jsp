<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Picpocket</title>
<style>
	* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
body {
	min-height: 100vh;
	display: grid;
	place-items: center;

	--bkg: #0fd5ef;
	--white: #000000;

	background-color: var(--white);
	background-image: url("https://www.transparenttextures.com/patterns/concrete-wall.png");
}
.container {
	width: 100%;
	height: 100%;
	display: grid;
	place-items: center;
	overflow: hidden;
}
.title {
	position: absolute;
	top: 39%;
	left: 50%;
	transform: translate(-50%, -129%);
}
.title h1 {
	font-size: 20vmin;
	font-weight: 900;
	font-family: "Montserrat", sans-serif;
	color: rgb(204, 206, 207);
	text-shadow: #0505de;
	
}
.ghost {
	width: 8vmin;
	height: 12vmin;
	background-color: var(--bkg);
	background-image: url("https://www.transparenttextures.com/patterns/concrete-wall.png");
	background-image: radial-gradient(ellipse at 35% 40%, #0505de 8%, transparent 0%),
		radial-gradient(ellipse at 65% 40%, #1c17a9 8%, transparent 0%),
		radial-gradient(ellipse at 50% 60%, #f71313 8%, transparent 0%);
	border-radius: 100% / 70% 70% 0% 0%;
	transform: translateX(100em) rotateZ(-90deg);
	position: relative;
	opacity: 0.9;
	mix-blend-mode: exclusion;
	animation: ghostMove 6s ease-out infinite;
}
@keyframes ghostMove {
	0% {
		transform: translateX(30em) rotateZ(-90deg);
	}
	100% {
		transform: translateX(-35em) rotateZ(-90deg);
	}
}
.ghost div {
	position: absolute;
	width: 20%;
	background-color: var(--bkg);
	
}
.ghost div:nth-of-type(1) {
	height: 9vmin;
	left: 0;
	bottom: -6vmin;
	border-radius: 100% / 0% 0% 50% 50%;
}
.ghost div:nth-of-type(2),
.ghost div:nth-of-type(4) {
	height: 4vmin;
	left: 20%;
	bottom: -3vmin;
	border-radius: 100% / 50% 50% 0% 0%;
	background-color: transparent;
}
.ghost div:nth-of-type(3) {
	height: 4vmin;
	left: 40%;
	bottom: -3.95vmin;
	border-radius: 100% / 0% 0% 60% 60%;
	background-color: var(--bkg);
}
.ghost div:nth-of-type(4) {
	left: 60%;
}
.ghost div:nth-of-type(5) {
	height: 3vmin;
	left: 80%;
	bottom: -2.9vmin;
	border-radius: 100% / 0% 0% 70% 70%;
	background-color: var(--bkg);
}
.container .title{
  text-align: center;
  font-size: 41px;
  font-weight: 600;
  font-family: 'Poppins', sans-serif;
  background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
a{
 text-align: center;
  font-size: 41px;
  font-weight: 600;
  font-family: 'Poppins', sans-serif;
  background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

</style>
</head>
<body>

<div class="container">
	<div class="title">
		<h1>PICKPOCKET</h1>
	</div>
	<div class="ghost">
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</div>
	
</div >
	<a href="/picpocket/admins/">For Admin</a>
	<a href="/picpocket/users/">For User</a>
</body>
</html>