<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
 <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
 <style>
    .custom-container {
      max-width: 500px;
      margin: auto;
    }
    body {background-color:MediumSeaGreen;}
  </style>
</head>
<body>
<div class="header text-center"><h2 >Picpocket</h2></div>
	<div class="header text-center">
		<a href="/picpocket/albums/">Album</a>
		<a href="/picpocket/photos/">Photo</a>
    </div>
	
</body>
</html>