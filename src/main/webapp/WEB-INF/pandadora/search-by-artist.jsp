<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page contentType="text/html; charset=UTF-8" %> <!--IMPORTANT LINE TO DISPLAY EMOJIs-->

<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href='<c:url value="/css/style.css"/>' type="text/css"/>
		<title>Search</title>
	</head>
	<body>
		<a href="/dashboard">Dashboard</a>
		<div class="mb-4">
			<form action="/search" method="post" >
			        <input name="artist" class="max-width40"/>
			    	<input type="submit" value="Submit"/>
			</form> 
		</div>
		<div class="max-width80 mx-auto mb-5">
			<table class="table">
			    <thead class="thead-dark">
			        <tr>
			            <th>Name</th>
			            <th>Rating(1-10)</th>
			            <th>Action</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${songs}" var="song">
			        <tr>
			            <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
			            <td><c:out value="${song.rating}"/></td>
			            <td><a href="/songs/delete/${song.id}">delete</a></td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
	</body>
</html>