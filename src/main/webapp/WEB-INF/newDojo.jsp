<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>New Dojo</title>
</head>
<body class="container d-flex flex-column text-center">
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/dojos">Home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarDark"
				aria-controls="navbarDark" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse show" id="navbarDark">
				<ul class="navbar-nav me-auto mb-2 mb-xl-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/ninjas/new">Add a Ninja</a></li>
					<li class="nav-item"><a class="nav-link" href="/dojos/new">Add
							a New Dojo</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<h1>New Dojo:</h1>
	<form:form action="/dojos/new" method="post" modelAttribute="dojo">
		<p>
			<form:errors path="name" class="error" />
			<form:label path="name">Name:</form:label>
			<form:input path="name" type="text" />
		</p>
		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>