<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css" integrity="your-api-key" crossorigin="anonymous"/>
<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

body {
  background-color: #15181c;
  max-width: 1000px;
  margin: 2px auto;
}

.container {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}

h1 {
  color: #f9532d;
  text-align: center;
}

.inputContainer {
  width: 400px;
  margin: 20px 0;
  position: relative;
}

.inputContainer input {
  font-size: 20px;
  width: 100%;
  height: 50px;
  outline: none;
  padding: 0 20px;
  color: rgb(220, 213, 213);
  background-color: #28262c;
  border-radius: 50px;
  border:  rgb(132, 125, 173);
}

.inputContainer i {
  font-size: 24px;
  color: #e36767;
  position: absolute;
  right: 20px;
  top: 50%;
  transform: translate(-50%, -50%);
  cursor: pointer;
}


 #gallery {
            margin: 2em;
        }
 .image-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Increased gap between images */
            justify-content: center; /* Center the images */
        }


        figure {
  font-family: "Montserrat", Arial, sans-serif;
  position: relative;
  display: inline-block;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #fff;
  text-align: left;
  font-size: 16px;
  background: #080808;
}

figure img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
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

.image-container {
    display: flex;
    flex-wrap: wrap;
    gap: 13px; /* Increased gap between images */
    justify-content: space-between; /* Distribute space between images */
}

figure {
    /* Existing styles... */
    min-width: calc(30% - 13px); /* 20% width for each figure with 20px gap */
    max-width: calc(30% - 13px);
    width: 100%;
}

 .header{
       display: flex;
            align-items:center;
            justify-content:space-between;
            margin: 0;
            padding: 20px;        
 } 
 .header i{
   color:#f9532d;
   margin-left:-400px;
   
 }                   


</style>

<!-- Font Awesome  -->
<script src="https://kit.fontawesome.com/ebb335c6c8.js"
	crossorigin="anonymous"></script>
</head>

<body>

	<div class="container">
	   
        <div class="header"> 
           <a href="/picpocket/users/userprofileview?id=${userid }"><i class="fa-solid fa-backward fa-2xl"></i></a>
            <h1>Sell Photo</h1>
       </div>
        <!-- <div class="inputContainer">
            <input type="text">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div> -->

        <section id="gallery">
			<div class="image-container">
		<c:choose>
				<c:when test="${empty sellposts}">
					<p>No matches found</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${sellposts}" var="sellpost">
						<c:if test=""></c:if>
						<figure>

							<a href="/picpocket/users/userviewphoto?id=${sellpost.id}"><img src="data:image/jpeg;base64,${sellpost.base64image}" height="100%" width="100%" alt="Blob Image"/></a>
							<figcaption>
								
								<h3>${sellpost.title }</h3>
								<h3>${sellpost.description }</h3>
								<h4>${sellpost.date }</h4>
								
							</figcaption>
						</figure>
					</c:forEach>
				</c:otherwise>
			</c:choose>


		</div>
	
	</section>
	
	</div>

    <script type="text/javascript">
    const inputEl = document.querySelector("input");
    const searchEl = document.querySelector(".inputContainer i");
    const imageBoxEl = document.querySelectorAll(".imageBox");

    // when we press ENTER button or when we click search button this function will start executing.
    function handleSearch(event){
        if(event.key==="Enter" || event==="search"){
            const inputValue = inputEl.value;
            const value = inputValue.toLowerCase();

            // if the entered value is equal to dataset name then it shows (i.e block) or else it display none.
            imageBoxEl.forEach((image)=>{
                if(value===image.dataset.name){
                    image.style.display = "block"
                }else{
                    image.style.display = "none"
                }
            })
        }
    }

    // when we click on the search button it call the handleSearch function.
    searchEl.addEventListener("click",()=>{
        handleSearch("search");
    })


    inputEl.addEventListener("keyup",()=>{
        if(inputEl.value!="") 
            return;

        // if there is empty value then it shows all the images.
        imageBoxEl.forEach((image)=>{
            image.style.display = "block"
        })
    })

    // when we press the ENTER button then it calls the handleSearch function.
    inputEl.addEventListener("keyup",handleSearch)
    
    </script>
</body>
</body>

</html>