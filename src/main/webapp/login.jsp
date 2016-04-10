<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Page</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>bootstrap-3.3.6-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>css/style.css">
</head>
<body>
	<div class="container">
		<div class="wrapper">
			<form action="LoginServlet" method="post" name="Login_Form"
				class="form-signin">
				<div class="alert ">${errorMessage}</div>
				<h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
				<hr class="colorgraph">
				<br> <br> <input type="text" class="form-control"
					name="username" placeholder="Username" required="" autofocus="" />
				<input type="password" class="form-control" name="password"
					placeholder="Password" required="" />

				<button class="btn btn-lg btn-primary btn-block" name="Submit"
					value="Login" type="Submit">Login</button>
			</form>
		</div>
	</div>
</body>
</html>