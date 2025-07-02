<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Tech Blog</title>
</head>
<body>
<!--navbar-->
<%@include file="normal_navbar.jsp" %>
<!--banner-->
<div class="container-fluid p-0 m-0">
	<div class="jumbotron primary-background text-white banner-background">
	<div class="container">
	<h3>Welcome to Tech Blog</h3>
	<p>Welcome to technical blog, world of technology</p>
	<a class="btn btn-outline-light" href="register_page.jsp"><span class="fa fa-user-plus"></span> Start ! it's Free</a>
		<a class="btn btn-outline-light" href="login-page.jsp"><span class="fa fa-user-circle fa-spin"></span> Login</a>
	</div>
	</div>
</div>

<!-- cards -->
<div class="container">
 <div class="row mb-2">
<div class="col-md-4">
 <div class="card">
  	<div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
    </div>
 </div>
</div>
<div class="col-md-4">
 <div class="card">
  	<div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
    </div>
 </div>
</div>
<div class="col-md-4">
 <div class="card">
  	<div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
    </div>
 </div>
</div>
 </div>
  <div class="row mb-2">
<div class="col-md-4">
 <div class="card">
  	<div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
    </div>
 </div>
</div>
<div class="col-md-4">
 <div class="card">
  	<div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
    </div>
 </div>
</div>
<div class="col-md-4">
 <div class="card">
  	<div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
    </div>
 </div>
</div>
 </div>
</div>





<%@include file="LinksandScripts.jsp" %>
</body>
</html>