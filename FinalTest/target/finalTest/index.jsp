<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="util.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%
	if (request.getParameter("logoff") != null) {
		session.invalidate();
		response.sendRedirect("index.jsp");
		return;
	}
%>
<%
	// 	InputStream stream = this.getClass().getResourceAsStream("directory.properties");
    Properties props = new Properties();
    props.load(getServletContext().getResourceAsStream("/WEB-INF/properties/directory.properties"));
    Enumeration<Object> keys = props.keys();
    Collection<Object> values= props.values();
//     List<String> values = new ArrayList<String>();
//     while(keys.hasMoreElements()){
//     	String key = keys.nextElement().toString();
//     	values.add(key + " - " + props.getProperty(key));
//     }
%>
<%
	int nbFile = 0;
%>
<html>
<head>
<title>Protected Page for Examples</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-3.3.6-dist/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript"
	src="/css/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
</head>
<body bgcolor="white">
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<h1>Application de versement ARPH</h1>
				<p>Interface Web de chargement des fichiers de données pour les
					recettes sur l'application ARPH.</p>
				<br> If you have configured this app for form-based
				authentication, you can log off by clicking <a
					href='<%=response.encodeURL("index.jsp?logoff=true")%>'>here</a>.
				This should cause you to be returned to the logon page after the
				redirect that is performed.
			</div>
			<div class="row">
				<div class="col-md-6">
					<h4>Panneau de gestion des fichiers dans les différents
						répertoires</h4>
					<div class="alert form-group">${errorMessageSupp}</div>
					<table class="table table-hover">
						<thead>
							<th class="col-md-1">#</th>
							<th class="col-md-7">File Name</th>
							<th class="col-md-3">Date</th>
							<th class="col-md-1 glyphicon glyphicon-trash"></th>
						</thead>
						<tbody>
							<c:set var="props" value="<%=props%>" />
							<c:forEach items="${props}" var="item">
								<tr>
									<td><%=++nbFile%>
									<td><c:out value="${item.key}" /> <%
 	Date aujourdhui = new Date();
                             							DateFormat shortDateFormat = DateFormat.getDateTimeInstance(
                             DateFormat.SHORT,
                             DateFormat.SHORT);
 %>
									<td><%=shortDateFormat.format(Calendar.getInstance().getTime())%></td>
									<td><a href="/delete?fileName=${item.key}"
										class="glyphicon glyphicon-remove" role="button"></a>
									<td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<form action="upload" method="post" enctype="multipart/form-data"
					class="form-horizontal col-md-6">
					<div class="alert form-group">${errorMessage}</div>
					<div class="form-group select2-container">
						<%-- 							<c:set var="enumKeys" value="<%=keys%>" /> --%>
						<!-- 							<select class="destination" name="destination" -->
						<!-- 								title="Destination folder"> -->
						<%-- 								<c:set var="props" value="<%=props%>" /> --%>

						<%-- 								<c:forEach items="${props}" var="item"> --%>
						<%-- 									<option value="${item.key }"><c:out --%>
						<%-- 											value="${item.key}" /> - --%>
						<%-- 										<c:out value="${item.value}" /> --%>
						<!-- 									</option> -->
						<%-- 								</c:forEach> --%>
						<!-- 							</select> -->
						<select class="form-control" style="width: auto;"
							name="destination" title="Destination folder">
							<c:set var="values" value="<%=values%>" />

							<c:forEach items="${values}" var="item">
								<option value="${item }"><c:out value="${item}" />
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<div class="col-lg-12 col-sm-12 col-12">
							<div class="input-group">
								<span class="input-group-btn"><span
									class="btn btn-primary btn-file"> Browse&hellip;<input
										type="file" class="form-control" required="required"
										name="file" multiple></span></span> <input type="text"
									class="form-control">
							</div>
							<span class="help-block">Merci de charger les fichiers.</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-12 col-sm-12 col-12">
							<button type="submit" class="btn btn-primary btn-lg btn-block">
								<i class="glyphicon glyphicon-upload"></i> Envoyer
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
