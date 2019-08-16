<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page contentType="text/html; charset=UTF-8" %> <!--IMPORTANT LINE TO DISPLAY EMOJIS-->

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href='<c:url value="/css/style.css"/>' type="text/css"/>
	<title>Welcome</title>
</head>
<body class="sub-page">
	<div class="text-center">
		<h1 class="mb-5">🐼 Welcome to Pandadora 🐼</h1>
		<p class="lead">Where you can add, search, and delete songs to a library!</p>
		<a href="/dashboard">Proceed</a>
	</div>
</body>
</html>