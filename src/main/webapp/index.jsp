<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>File Upload Example in JSP and Servlet - Java web
	application</title>
<!-- 	Bnnp css -->
<link rel="stylesheet" href="./css/bnpparibas.css">
<!-- 	Loire css -->
<link rel="stylesheet" href="./css/Loire.css">

<link rel="stylesheet"
	href="./bootstrap-3.3.6-dist/css/bootstrap.min.css">
<!-- Generic page styles -->
<link rel="stylesheet" href="./css/style.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet"
	href="./bootstrap-3.3.6-dist/jquery.fileupload.css">
<link rel="stylesheet"
	href="./bootstrap-3.3.6-dist/jquery.fileupload-ui.css">

</head>

<body>
	<div class="row">
		<div class="col-md-1">

			<h3>Versement des fichiers à tester</h3>

			<form action="upload" method="post" enctype="multipart/form-data">
				<div>
					<h2>Choisir le répertoire de destination</h2>
					<select name="lists">
						<option value="p01">P01</option>
						<option value="p02">P02</option>
						<option value="p03">P03</option>
						<option value="p04">P04</option>
						<option value="p05">P05</option>
						<option value="p06">P06</option>
					</select>
				</div>
				<div>
					<input type="file" name="file" /> <input type="submit"
						value="upload" />
				</div>
			</form>
		</div>
	</div>

</body>
</html>
