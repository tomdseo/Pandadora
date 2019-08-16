<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page contentType="text/html; charset=UTF-8" %> <!--IMPORTANT LINE TO DISPLAY EMOJIS-->
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href='<c:url value="/css/style.css"/>' type="text/css"/>
	<title>Song Details</title>
</head>
<body>
	<a href="/dashboard">Dashboard</a>
	<div class="max-width80 mx-auto mb-5">
	<h1 class="display-4 text-center mb-3">Song Spotlight</h1>
	<table class="table">
	    <thead class="thead-dark">
	        <tr>
	            <th>Title</th>
             	<th>Artist</th>
				<th>Rating (1-10)</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td><c:out value="${song.title}"/></td>
	            <td><c:out value="${song.artist}"/></td>
	            <td><c:out value="${song.rating}"/></td>
	        </tr>
	    </tbody>
	</table>
	</div>
</body>