<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.user.management.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server

User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not Loggged in !! Login First");
	response.sendRedirect("Login.jsp");
	return;
}
else if(user.getUserStatus().equals("block"))
{
	session.setAttribute("message", "You have been Blocked ! Consult with Administration.");
	response.sendRedirect("Register.jsp");
	return;
}
else {
	if (user.getUserType().equals("client")) {
		session.setAttribute("message", "You are not User ! You have not right to access this page.");
		response.sendRedirect("Login.jsp");
		return;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
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
						<c:forEach var="usr" items="${userList}">

							<c:set var="id" value="${usr.userId}" />
							<c:set var="username" value="${usr.userName}" />

							<center>
								<h2>Welcome to your Profile: ${usr.userName}</h2>
							</center>

							<c:set var="email" value="${usr.userEmail}" />
							<c:set var="password" value="${usr.userPassword}" />
							<c:set var="cpassword" value="${usr.userConformPassword}" />
							<c:set var="phone" value="${usr.userPhone}" />
							<c:set var="address" value="${usr.userAddress}" />

							<tr>
								<td>ID</td>
								<td>${usr.userId}</td>
							</tr>
							<tr>
								<td>Name</td>
								<td>${usr.userName}</td>
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
					
				    <c:url value="UserAccount.jsp" var="changesinfo">
						<c:param name="uid" value="${id}" />
						<c:param name="uname" value="${username}" />
						<c:param name="uemail" value="${email}" />
						<c:param name="upass" value="${password}" />
						<c:param name="ucpass" value="${cpassword}" />
						<c:param name="uphone" value="${phone}" />
						<c:param name="uaddress" value="${address}" />
					</c:url>

					<c:url value="updateProfile.jsp" var="usrupdate">
						<c:param name="uid" value="${id}" />
						<c:param name="uname" value="${username}" />
						<c:param name="uemail" value="${email}" />
						<c:param name="upass" value="${password}" />
						<c:param name="ucpass" value="${cpassword}" />
						<c:param name="uphone" value="${phone}" />
						<c:param name="uaddress" value="${address}" />
					</c:url>
                     
                     <c:url value="DeleteUser.jsp" var="usrdelete">
						<c:param name="uid" value="${id}" />
						<c:param name="uname" value="${username}" />
						<c:param name="uemail" value="${email}" />
						<c:param name="upass" value="${password}" />
						<c:param name="ucpass" value="${cpassword}" />
						<c:param name="uphone" value="${phone}" />
						<c:param name="uaddress" value="${address}" />
					</c:url>
					
					  <c:url value="ForStatus.jsp" var="forhistory">
						<c:param name="uid" value="${id}" />
						<c:param name="uname" value="${username}" />
						<c:param name="uemail" value="${email}" />
						<c:param name="upass" value="${password}" />
						<c:param name="ucpass" value="${cpassword}" />
						<c:param name="uphone" value="${phone}" />
						<c:param name="uaddress" value="${address}" />
					</c:url>
                     <div class="container">
                     <a href="${usrdelete}"> <input type="button" name="delete"
						value="Delete" class="btn btn-secondary">
					</a>
					
					 <a href="${usrupdate}"> <input type="button" name="update"
						value="Update" class="btn btn-secondary">
					</a>
					 <a href="${changesinfo}"> <input type="button" name="chage"
						value="Chages info" class="btn btn-secondary">
					</a>
					
					<a href="${forhistory}"> <input type="button" name="ViewHistory" value="View Status" class="btn btn-secondary" id = "viewHistory"> </a>
				</div>
			
			</div>
		</div>
		</div>
	</div>
</body>
</html>