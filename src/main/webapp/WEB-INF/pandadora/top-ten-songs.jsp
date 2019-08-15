<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page contentType="text/html; charset=UTF-8" %> <!--IMPORTANT LINE TO DISPLAY EMOJISSSSSS-->
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href='<c:url value="/css/style.css"/>' type="text/css"/>
	<title>title</title>
</head>
<body>
	<a href="/dashboard">Dashboard</a>
	<div class="max-width80 mx-auto mb-5">
		<h1 class="display-4 text-center mb-3">Top Ten Songs</h1>
		<table class="table">
		    <thead class="thead-dark">
		        <tr>
		            <th>Rating</th>
	             	<th>Name</th>
					<th>Artist</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${songs}" var="song">
		        <tr>
		            <td><c:out value="${song.rating}"/></td>
		            <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
		            <td><c:out value="${song.artist}"/></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</body>