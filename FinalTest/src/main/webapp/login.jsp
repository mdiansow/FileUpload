<html>
<head>
<title>Login Page for Examples</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-3.3.6-dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="wrapper">
			<form action="<%=response.encodeURL("j_security_check")%>"
				method="post" name="Login_Form" class="form-signin">
				<h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
				<hr class="colorgraph">
				<br> <br> <input type="text" class="form-control"
					name="j_username" placeholder="Username" required="" autofocus="" />
				<input type="password" class="form-control" name="j_password"
					placeholder="Password" required="" />

				<button class="btn btn-lg btn-primary btn-block" name="Submit"
					value="Login" type="submit">Log In</button>
			</form>
		</div>
	</div>
</body>
</html>
