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
<jsp:include page="header.jsp"></jsp:include>
	<form:form action="/picpocket/albums/edit" method="post" modelAttribute="album">
		<div>			
			<form:input type="hidden" path="id" />			
		</div>
		<div>
			<form:label path="title">Album Title</form:label>
			<form:input path="title" />
		</div>
		<div>
			<form:label path="description">Description</form:label>
			<form:input path="description" />
		</div>
		<div>			
			<input type="submit" value="Update Album">
		</div>
	</form:form>

</body>
</html>