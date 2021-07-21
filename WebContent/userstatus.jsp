<%@page import="com.user.management.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.user.management.entities.UserLog"%>
<%@page import="com.user.management.dao.UserLogDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.user.management.entities.User"%>
<%@page import="com.user.management.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Status</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%
	UserDAO udao = new UserDAO(FactoryProvider.getFactory());
	List<UserLog> llist = udao.getAllLogs();
	session.setAttribute("uStatus", llist);
	%>
	<div class="col-md-12 mt-3">
		<div class="card text-center" data-toggle="modal"
			data-target="#">
			<div class="card-body">
				<div class="container">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">User ID</th>
								<th scope="col">Full Name</th>
								<th scope="col">Login Date</th>
								<th scope="col">Logout Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${uStatus}" var="user">
								<tr>
									<td><c:out value="${user.id}" /></td>
									<td><c:out value="${user.userId}" /></td>
									<td><c:out value="${user.userName}" /></td>
									<td><c:out value="${user.indate}" /></td>
									<td><c:out value="${user.outdate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>