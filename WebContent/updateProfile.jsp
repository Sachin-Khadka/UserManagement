<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Update Profile</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file = "components/navbar.jsp"%>

	<div class="col-md-12 mt-6">
		<div class="card text-center" data-toggle="modal"
			data-target="#update-modal">
			<div class="card-body">
				<div class="container">
					<%
					String id = request.getParameter("uid");
					String fullName = request.getParameter("uname");
					String email = request.getParameter("uemail");
					String password = request.getParameter("upass");
					String cPassword = request.getParameter("ucpass");
					String phone = request.getParameter("uphone");
					String address = request.getParameter("uaddress");
					%>

					<form action="update" method="POST">
					<%@include file="components/message.jsp"%>
						<table class="table table-bordered">
							<tr>
								<td>ID</td>
								<td><input type="text" name="usrid" value="<%=id%>"
									readonly></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="username"
									value="<%=fullName%>"></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="text" name="email" value="<%=email%>"></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pass"
									value="<%=password%>"></td>
							</tr>
							<tr>
								<td>Re-Password</td>
								<td><input type="password" name="cpass"
									value="<%=cPassword%>"></td>
							</tr>
							<tr>
								<td>Phone</td>
								<td><input type="text" name="phone" value="<%=phone%>"></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><input type="text" name="address"
									value="<%=address%>"></td>
							</tr>
						</table>
						<div>
						 	<input type="submit" name="submit" value="Save" class="btn btn-secondary">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>