<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background: rgb(26, 28, 28);
        }

        .photo {
            height: 400px;
            width: 400px;
        }
        .header {
			   position: fixed;
			   top: 0;
			   left: 3%; 
			   width: 100%;
			   display: flex;
			   align-items: center;
			   padding: 20px;
			   font-size:40px;
			   
}

.header i {
   color: #fff;
   margin-right: 10px;
}
    </style>
</head>
<body>
	<div class="header">
   <a href="/picpocket/users/viewmorebuyphotos?id=${phh.creator}">
      <i class="fas fa-backward"></i>
   </a>
</div>
    <div>
        <a href="" class="photo"><img src="data:image/jpeg;base64,${ph.base64image}" alt="Blob Image"/></a>
    </div>
</body>
</html>
