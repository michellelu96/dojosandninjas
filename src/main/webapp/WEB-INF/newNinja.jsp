<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Ninja</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="container text-center">

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
	<h1>New Ninja</h1>
	<form:form action="/ninjas/new" method="post" modelAttribute="ninja">
		<p>
			<form:label path="dojo">Dojo Name:</form:label>
			<form:select path="dojo">
				<c:forEach var="dojo" items="${dojos}">
					<form:option value="${dojo.id}">${dojo.name }</form:option>
				</c:forEach>
			</form:select>
		</p>
		<p>
			<form:errors path="firstName" class="error" />
			<form:label path="firstName">First Name:</form:label>
			<form:input path="firstName" type="text" />
		</p>
		<p>
			<form:errors path="lastName" class="error" />
			<form:label path="lastName">Last Name:</form:label>
			<form:input path="lastName" type="text" />
		</p>
		<p>
			<form:errors path="age" class="error" />
			<form:label path="age">Age:</form:label>
			<form:input path="age" type="number" />
		</p>
		<button>Submit</button>
	</form:form>
</body>
</html>