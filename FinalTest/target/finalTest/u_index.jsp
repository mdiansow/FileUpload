<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page import="java.io.InputStream"%>
<%@page import="java.util.*"%>

<%
	InputStream stream = application.getResourceAsStream("/directory.properties");
    Properties props = new Properties();
    props.load(getServletContext().getResourceAsStream("/WEB-INF/classes/directory.properties"));
    Enumeration<Object> keys = props.keys();
    List<String> values = new ArrayList<String>();
    while(keys.hasMoreElements()){
    	values.add(props.getProperty(keys.nextElement().toString()));
    }
%>

<!doctype html>
<html lang="fr">
<head>
<meta charset="utf-8">
<title>File Upload</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="./bootstrap-3.3.6-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%
		//allow access only if session exists
		String user = null;
		if(session.getAttribute("user") == null){
		    response.sendRedirect("login.jsp");
		}else user = (String) session.getAttribute("user");
		String userName = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
		for(Cookie cookie : cookies){
		    if(cookie.getName().equals("user")) userName = cookie.getValue();
		    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
		}
		}
	%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<h1>Application de versement ARPH</h1>
				<p>Interface Web de chargement des fichiers de données pour les
					recettes sur l'application ARPH.</p>
				<form action="LogoutServlet" method="post">
					<button type="submit" class="btn btn-danger btn-sm">
						<span class="glyphicon glyphicon-log-out"></span> Log out
					</button>
				</form>
			</div>
			<form action="upload" method="post" enctype="multipart/form-data"
				class="form-horizontal">
				<div class="alert form-group">${errorMessage}</div>

				<div class="form-group">
					<div class="col-md-4">

						<c:set var="destinations" value="1,2,3,A,B,C,D,E"
							scope="application" />
						<c:set var="enumKeys" value="<%=keys%>" />

						<select class="destination" name="destination"
							title="Destination folder">
							<c:set var="props" value="<%=props%>" />
							<c:forEach items="${props}" var="item">
								<option value="${item.key }"><c:out value="${item.key}" />
									-
									<c:out value="${item.value}" />
								</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<span class="btn btn-default btn-file"> Browse <input
						type="file">
					</span> <label for="inputFile" class="col-sm-2 control-label">File
						input</label>
					<div class="col-sm-10">
						<input id="inputFile" type="file" class="form-control" name="file"
							multiple>

						<p class="help-block">Merci de charger les fichiers.</p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" value="upload" />
					</div>
				</div>
			</form>

			<div>
				<c:set var="enumKeys" value="<%=keys%>" />
				<c:forEach items="${enumKeys }" var="key">
					<c:out value="${key }"></c:out>
					<br>
				</c:forEach>

				<%-- 				<fmt:setBundle basename="directory" var="dir" /> --%>

				<%-- 				<fmt:setLocale value="es_ES" scope="application" /> --%>
				<%-- 				<fmt:setBundle basename="directory" var="resources" /> --%>



			</div>
		</div>
	</div>
</body>
</html>