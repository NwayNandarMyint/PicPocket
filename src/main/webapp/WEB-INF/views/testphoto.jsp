<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/picpocket/users/upload" method="post" modelAttribute="photo" enctype="multipart/form-data">
			<div>
				 <form:label path="imagepath">Upload Photo</form:label>
				 <form:input type="file" path="imagepath"/>
			</div>
			<div>
				 <input type="submit" value="Upload">
			</div>
    </form:form>
</body>
</html>