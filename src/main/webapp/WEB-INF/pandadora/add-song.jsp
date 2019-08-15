<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page contentType="text/html; charset=UTF-8" %> <!--IMPORTANT LINE TO DISPLAY EMOJISSSSSS-->

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/css/style.css"/>' type="text/css"/>
<title>Add a Song</title>
</head>
<body>
<a href="/dashboard">Dashboard</a>
<div class="max-width80 mx-auto">
		<p class="lead">Input a Song</p>
		<form:form action="/add_song" method="POST" modelAttribute="song">
		    <p>
		        <form:label path="title">Song Title</form:label>
		        <form:errors path="title"/>
		        <form:input path="title" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="artist">Song Artist</form:label>
		        <form:errors path="artist"/>
		        <form:input path="artist" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="rating">Song Rating(1-10)</form:label>
		        <form:errors path="rating"/>
		        <form:input path="rating" type="number" class="form-control"/>
		    </p>
		    <input type="submit" value="Add a Song"/>
		</form:form> 
	</div>
</body>