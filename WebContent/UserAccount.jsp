<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.user.management.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Changes Info</title>
<%@include file="components/common_css_js.jsp"%>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
<%@include file="components/message.jsp"%>
<%@include file="components/navbar.jsp"%>

<div class="col-md-12 mt-3">
		<div class="card text-center" data-toggle="modal"
			data-target="#update-modal">
			<div class="card-body">
				<div class="container">
					<table class="table table-bordered">
						<%
						    List<User> uList = (ArrayList) session.getAttribute("userList");
						%>
						<c:forEach var="ch_user" items="${userList}">
							<c:set var="id" value="${ch_user.userId}"/>
							<c:set var="username" value="${ch_user.userName}" />
							<center>
								<h1>Here is Your Chages Info: ${ch_user.userId}</h1>
							</center>
							<c:set var="email" value="${usr.userEmail}" />
							<c:set var="password" value="${ch_user.userPassword}" />
							<c:set var="cpassword" value="${ch_user.userConformPassword}" />
							<c:set var="phone" value="${ch_user.userPhone}" />
							<c:set var="address" value="${ch_user.userAddress}" />

						<h3> Your Older Information </h3>
							<tr>
								<td>ID</td>
								<td> ${ch_user.userId}  </td>
							</tr>
							<tr>
								<td>Name</td>
								<td> ${ch_user.userName} </td>
							</tr>
							<tr>
								<td>Email</td>
								<td>${ch_user.userEmail}</td>
							</tr>
							<tr>
								<td>Password</td>
								<td>${ch_user.userPassword}</td>
							</tr>
							<tr>
								<td>Re-Password</td>
								<td>${ch_user.userConformPassword}</td>
							</tr>
							<tr>
								<td>Phone</td>
								<td>${ch_user.userPhone}</td>
							</tr>
							<tr>
								<td>Address</td>
								<td>${ch_user.userAddress}</td>
							</tr>
						</c:forEach>
					</table>
			</div>
		</div>
		</div>
	</div>
	
	
	<div class="col-md-12 mt-3">
		<div class="card text-center" data-toggle="modal"
			data-target="#update-modal">
			<div class="card-body">
				<div class="container">
					<table class="table table-bordered">
						<%
						    List<User> upList = (ArrayList) session.getAttribute("getUserList");
						%>
						<c:forEach var="usr" items="${getUserList}">
							<c:set var="id" value="${usr.userId}"/>
							<c:set var="username" value="${usr.userName}" />
							<c:set var="email" value="${usr.userEmail}" />
							<c:set var="password" value="${usr.userPassword}" />
							<c:set var="cpassword" value="${usr.userConformPassword}" />
							<c:set var="phone" value="${usr.userPhone}" />
							<c:set var="address" value="${usr.userAddress}" />

						<h1> Your Newer Information </h1>
							<tr>
								<td>ID</td>
								<td> ${usr.userId}  </td>
							</tr>
							<tr>
								<td>Name</td>
								<td> ${usr.userName} </td>
							</tr>
							<tr>
								<td>Email</td>
								<td>${usr.userEmail}</td>
							</tr>
							<tr>
								<td>Password</td>
								<td>${usr.userPassword}</td>
							</tr>
							<tr>
								<td>Re-Password</td>
								<td>${usr.userConformPassword}</td>
							</tr>
							<tr>
								<td>Phone</td>
								<td>${usr.userPhone}</td>
							</tr>
							<tr>
								<td>Address</td>
								<td>${usr.userAddress}</td>
							</tr>
						</c:forEach>
					</table>
			</div>
		</div>
		</div>
	</div>
		
</body>
</html>