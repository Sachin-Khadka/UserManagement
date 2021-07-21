<%@page import="com.user.management.entities.User"%>
<%
	User usera = (User) session.getAttribute("current-user");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserManagement</title>
</head>
<body>
	<div id="preloader">
		<div class="user-preloader"></div>
	</div>
	<header class="header_area clearfix">
		<div class="container-fluid h-100">
			<div class="row h-100">
				<!-- Menu Area Start -->
				<div class="col-12 h-100">
					<div class="menu_area h-100">
						<nav class="navbar h-100 navbar-expand-lg align-items-center">
							<!-- Logo -->
							<a class="navbar-brand" href="index.html"><img
								src="img/core-img/Capture1.1.PNG" alt="logo"></a>

							<!-- Menu Area -->
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#user-navbar"
								aria-controls="user-navbar" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div class="collapse navbar-collapse justify-content-end"
								id="user-navbar">
								<ul class="navbar-nav animated" id="nav">
									<li class="nav-item active"><a class="nav-link"
										href="index.jsp">Home</a></li>
									<li class="nav-item dropdown">
							</li>
							<li class="nav-item"><a class="nav-link" href="About.jsp">About Us</a></li>

							<li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>
							</ul>
							</div>
							<!-- Search Form Area Start -->
							<div class="search-form-area animated">
								<form action="#" method="post">
									<input type="search" name="search" id="search"
										placeholder="Type keywords &amp; hit enter">
									<button type="submit" class="d-none">
										<img src="img/core-img/search-icon.png" alt="Search">
									</button>
								</form>
							</div>
							<!-- Search btn -->
							<div class="search-button">
								<a href="#" id="search-btn"><img
									src="img/core-img/search-icon.png" alt="Search"></a>
							</div>
							<!-- Login/Register btn -->
							<div class="login-register-btn">
							<%
								if (usera == null) {
							%>
								<a href="Login.jsp">Login</a> <a href="Register.jsp">/ Register</a>
								
							<%
							   } else {
							%>
							<li class="nav-item active"><a class="nav-link" href="#"><%=usera.getUserName()%></a></li>
							<li class="nav-item active"><a class="nav-link"href="LogoutServlet">Logout</a></li>
							<%
							 }
							%>
							</div>
							</nav>
					</div>
					</div>
				</div>
			</div>
	</header>
</body>
</html>
