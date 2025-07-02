<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <%@include file="normal_navbar.jsp" %>
<main class="primary-background p-4" style="padding-bottom:50px;">
<div class="container">
<div class="col-md-6 offset-md-3">
<div class="card">
	<div class="card-header primary-background text-center text-white">
	<span class="fa fa-user-plus fa-3x"></span>
	<p>Register</p>
	       
	</div>
                   <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="post">
							 <div class="form-group">
									<label for="email">
										Username
									</label>
									<input type="text"
										class="form-control" name="username" placeholder="user_name" id="username" required="required">
								</div>
				
								<div class="form-group">
									<label for="email">
										Email address:
									</label>
									<input type="email"
										class="form-control" placeholder="Enter email" name="email" id="email" required="required">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label>
									<input name="pass" type="password"
										class="form-control" placeholder="Enter password" id="pwd" required="required">
								</div>
								
								<div class="form-group">
									<label for="pwd">Gender</label>
									<input name="gender" type="radio" value="Male" id="gender" required="required">Male
									<input name="gender" type="radio" value="Female"id="gender" required="required">Female
								</div>
								<div class="form-group">
									<textarea class="form-control" name="about" rows="3" placeholder="Enter something about yourself"></textarea>
								</div>
								<div class="form-group form-check">
									<label class="form-check-label">
										<input name="check"class="form-check-input"
											type="checkbox" required="required">
										I Agree to terms and conditions
									</label>
								</div>
								<div class="container text-center" id="loader" style="display: none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<br>
								<h4>Please wait......</h4>
								</div>
								<br>
								<button id="submit-btn" type="submit"
									class="btn btn-primary">
									Submit
								</button>
                                                        </form>
                                            	</div>
                                           </div>
                                    </div>
                            </div>
                    </main>
<%@include file="LinksandScripts.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/register.js"></script>
</body>
</html>