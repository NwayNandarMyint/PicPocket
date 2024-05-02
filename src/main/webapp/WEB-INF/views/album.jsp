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
    body {background-color: brown;}
  </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form:form action="add" method="post" modelAttribute="album">
                <div class="mb-3">
                    <form:label path="title" class="form-label">Album Title</form:label>
                    <form:input path="title" class="form-control"/>
                </div>

                <div class="mb-3">
                    <form:label path="description" class="form-label">Description</form:label><br>
                    <form:textarea path = "description" class="form-label"  rows="4" cols = "41"/>
                </div>
                
                <div class="mb-3">
                    <input type="submit" value="Add" class="btn btn-primary">
                </div>
            </form:form>
        </div>
        </div>
</body>
</html>