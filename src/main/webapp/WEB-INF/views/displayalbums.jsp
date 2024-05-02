<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style>
    .custom-container {
      max-width: 500px;
      margin: auto;
    }
    body {background-color: white;}
  </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="text-danger">${error}</div>
<a href="add">Create Album</a>
<div class="container">
	<div class="row">
		<div class="col">Title</div>
		<div class="col">Description</div>
		<div class="col"></div>
	</div>
	<c:forEach var="album" items="${albums}">
		<div class="row">
			<div class="col">${album.title}</div>
			<div class="col">${album.description}</div>
			<div class="col">
				<a href="edit/${album.id}">Update</a>|
			</div>
	   </div>
	   </c:forEach>
	</div>
</body>
</html>