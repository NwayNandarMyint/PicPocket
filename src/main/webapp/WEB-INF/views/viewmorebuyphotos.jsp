<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Image Gallery</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
:root {
  --background: #2c3e50;
  --background-border: #00fffc;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Poppins;
  height: 100vh;
  padding: 32px;
  display: grid;
  place-items: center;
  background-color: var(--background);
}

.gallery {
  display: flex;
  background-color:
    var(--background);
  gap: 16px;
  scale: 1.6;
}

.card {
  position: relative;
  left: 0px;
  width: 140px;
  height: 160px;
  background-color:
    var(--background);
  border-radius: 8px;
  transition: 1000ms all;
  transform-origin:
    center left;
  box-shadow: 0 5px 12px rgba(0, 0, 0, 0.5);
  outline: 1px solid var(--background);
  overflow: hidden;
}

.card img {
  height: 160px;
  object-fit: cover;
  border-radius: 4px;
}

.card:hover {
  cursor: pointer;
  transform: scale(1.15);
  box-shadow: 0 0 20px #00fffc;
  margin: 5px;
}

.card:hover figcaption {
  font-size: 0.6rem;
  position: absolute;
  height: 80px;
  width: 160px;
  display: flex;
  align-items: end;
  background: linear-gradient(to top,
      rgba(0, 0, 0, 0.9) 0%,
      rgba(0, 0, 0, 0) 100%);
  color: white;
  left: 0px;
  bottom: 0px;
  padding-left: 12px;
  padding-bottom: 10px;
}

.card:hover~.card {
  font-weight: bold;
  cursor: pointer;
  transform: translateX(22px);
}



/* -- External Social Link CSS Styles -- */

#source-link {
  top: 120px;
}

#source-link>i {
  color: rgb(94, 106, 210);
}

#yt-link {
  top: 65px;
}

#yt-link>i {
  color: rgb(219, 31, 106);

}

#Fund-link {
  top: 10px;
}

#Fund-link>i {
  color: rgb(255, 251, 0);

}

.meta-link {
  align-items: center;
  backdrop-filter: blur(3px);
  background-color: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 6px;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  display: inline-flex;
  gap: 5px;
  left: 10px;
  padding: 10px 20px;
  position: fixed;
  text-decoration: none;
  transition: background-color 600ms, border-color 600ms;
  z-index: 10000;
}

.meta-link:hover {
  background-color: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.meta-link>i,
.meta-link>span {
  height: 20px;
  line-height: 20px;
}

.meta-link>span {
  color: white;
  font-family: "Rubik", sans-serif;
  transition: color 600ms;
  
}
.header{
       display: flex;
            align-items:center;
            justify-content:space-between;
            margin: 0;
            padding: 20px;  
            color:#f9532d;      
 } 
 .header i{
   color:#f9532d;
   margin-left:-400px;
   font-size:xx-large;
 } 
  </style>
</head>

<body>
    <div class="header">
        <a href="/picpocket/users/profile"><i class="fas fa-backward"></i></a>
        <h1>Buy Photos</h1>
    </div>
    <div class="gallery">
        <c:choose>
            <c:when test="${empty buyposts}">
                <p>No matches found</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${buyposts}" var="buypost">
                    <article class="card">
                        <figure>
                            <a href="/picpocket/users/userviewphoto?id=${buypost.id}">
                                <img class="slider__image" src="data:image/jpeg;base64,${buypost.base64image}" alt="Image">
                            </a>
                            <figcaption>
                                <h3>${buypost.title}</h3><br>
                                <!-- Include other details if needed -->
                            </figcaption>
                        </figure>
                    </article>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</body>


</html>