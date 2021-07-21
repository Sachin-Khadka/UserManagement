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
	<div class="col-md-12 mt-6">
		<div class="card text-center" data-toggle="modal"
			data-target="#update-modal">
			<div class="card-body">
				<div class="container">
					<%
					String id = request.getParameter("uid");
					String fullName = request.getParameter("uname");
					String status = request.getParameter("ustatus");
					%>

					<form action="block" method="POST">
						<table class="table table-bordered">
							<tr>
								<td>ID</td>
								<td><input type="text" name="usrid" value="<%=id%>"
									readonly></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="username"
									value="<%=fullName%>" readonly></td>
							</tr>
							<tr>
								<td>Status</td>
								<td><input type="text" name="status"
									value="<%=status%>"></td>
							</tr>
						</table>
						<div>
						 	<input type="submit" name="submit" value="Block" class="btn btn-secondary">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
		
		
		
		
</body>
</html>