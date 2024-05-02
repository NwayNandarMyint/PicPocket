<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit photo </title>
</head>
<body>
<form:form action="/picpocket/photos/edit" method="post" modelAttribute="photo">		
		<div>
			<form:input type="hidden" path="id"/>
		</div>
		
		<div>
			<form:label path="title">Title</form:label>
			<form:input path="title"/>
		</div>
		<div>
			<form:label path="description">Description</form:label>
			<form:input path="description" />
		</div>
		<div>
			<form:label path="price">Price</form:label>
			<form:input path="price" />			
		</div>
		<div>
			<form:label path="date">UploadDate</form:label>
			<form:input path="date"/>
		</div>
		<div>
			<form:label path="imagepath">Imagepath</form:label>
			<form:input path="imagepath"/>
		</div>
		<div>
			<form:label path="album_id">Album</form:label>						
			<form:select  path="album_id"  >
				<form:option value="0">Select Album</form:option>		 
				<c:forEach var="album" items="${album}">
     				<form:option value="${album.id}">${album.title}</form:option>
 				 </c:forEach>
			</form:select>
		</div>
		<div>			
				 <input type="submit" value="Update Photo">
		</div>
	</form:form>

</body>
</html>