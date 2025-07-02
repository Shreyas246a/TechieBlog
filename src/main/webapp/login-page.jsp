<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%@include file="normal_navbar.jsp" %>

<main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">>
	<div class="container">
		<div class = "row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
					<span class="fa fa-user-circle fa-3x"></span> <br>
					<p>Login Here</p>
					</div>
					
					<%
					Message msg = (Message) session.getAttribute("msg");
					if(msg!=null){
					%>	
			 		<div class="alert <%=msg.getCssClass() %>" role="alert">
			 			<%= msg.getContent() %>
			 		</div>		
					<% 	
					session.removeAttribute("msg");
					}
					%>
					
					
					
					<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="email">
										Email address:
									</label>
									<input type="email"
										class="form-control" name="email" placeholder="Enter email" id="email">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label>
									<input type="password"
										class="form-control" name="pass" placeholder="Enter password" id="pass">
								</div>
								<div class="container text-center">
								<button type="submit"
									class="btn btn-primary">
									Submit
								</button>
								</div>
							</form>

					</div>
					</div>
			</div>
				</div>
					</div>

</main>
<%@include file="LinksandScripts.jsp" %>
</body>
</html>