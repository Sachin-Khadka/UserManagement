<%@page import="com.user.management.entities.RegisterAdd"%>
<%@page import="com.user.management.entities.UserStatus"%>
<%@page import="com.user.management.helper.DBConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.user.management.entities.UserLog"%>
<%@page import="com.user.management.dao.UserLogDAO"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.user.management.dao.UserDAO"%>
<%@page import="com.user.management.helper.FactoryProvider"%>
<%@page import="com.user.management.entities.User"%>
<%@page import="java.util.List"%>
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

else if (user.getUserStatus().equals("block")) {
	session.setAttribute("message", "You have been Blocked ! Consult with Administration.");
	response.sendRedirect("Register.jsp");
}

else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin ! You have not right to access this page.");
		response.sendRedirect("Login.jsp");
		return;
	}
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container  admin">

		<div class="container-fluid md-3 mt-2">
			<%@include file="components/message.jsp"%>
		</div>


		<!--  First Row  (12) = 3 *4  -->
		<div class="row mt-3">
			<%
				UserDAO udao = new UserDAO(FactoryProvider.getFactory());
			List<User> list = udao.getAllUsers();
			session.setAttribute("ulist", list);
			List<User> alist = udao.getAdmin();
			session.setAttribute("admList", alist);
			List<User> ulist = udao.getUser();
			%>

			<!-- first col -->

			<div class="col-md-4">

				<!-- first box/card -->
				<div class="card text-center">
					<div class="card-body ">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/collection.png" alt="user_icon">
						</div>
						<h1><%=list.size()%></h1>
						<h1 class="text-uppercase- text-muted">Total Users</h1>
					</div>
				</div>

			</div>



			<!-- second col -->

			<div class="col-md-4">

				<!-- second box/card -->
				<div class="card text-center">

					<div class="card-body">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/admin.png" alt="client_icon">
						</div>
						<h1><%=alist.size()%></h1>
						<h1 class="text-uppercase- text-muted">Admin</h1>

					</div>
				</div>

			</div>



			<!-- third col -->

			<div class="col-md-4">
				<!-- third box/card -->
				<div class="card text-center">
					<div class="container">
						<img style="max-width: 125px" class="img-fluid rounded-circle"
							src="img/guest.png" alt="guest_icon">
					</div>
					<div class="card-body">
						<h1><%=ulist.size()%></h1>
						<h1 class="text-uppercase- text-muted">User</h1>
					</div>
				</div>
			</div>
		</div>

		<!--  Second Row    -->
		<div class="row mt-3">

			<!-- first col -->
			<div class="col-md-4">
				<!-- first box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#add-admin-modal">

					<div class="card-body ">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/adduser.png" alt="add_users_icon">
						</div>
						<p class=" mt-2">Click here to add new admin</p>
						<h1 class="text-uppercase- text-muted">Add Admin</h1>

					</div>
				</div>
			</div>

			<!-- second col -->

			<div class="col-md-4">

				<!-- second box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#add-user-modal">

					<div class="card-body">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/signs.png" alt="user_icon">
						</div>
						<p class=" mt-2">Click here to add new user</p>
						<h1 class="text-uppercase- text-muted">Add User</h1>

					</div>
				</div>

			</div>

			<!-- Third Column -->
			<div class="col-md-4">

				<!-- second box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#view-list-modal">

					<div class="card-body">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/lists.png" alt="user_icon">
						</div>
						<p class=" mt-2">Click here to view user list</p>
						<h1 class="text-uppercase- text-muted">View User List</h1>
					</div>
				</div>
			</div>
		</div>


		<!--  Third Row    -->

		<div class="row mt-3">

			<!-- first col -->
			<div class="col-md-4">
				<!-- first box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#view-history-modal">

					<div class="card-body ">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/history.png" alt="view_history_icon">
						</div>
						<p class=" mt-2">Click Here to view History</p>
						<h1 class="text-uppercase- text-muted">View History</h1>

					</div>
				</div>
			</div>


			<!-- second col -->

			<div class="col-md-4">

				<!-- second box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#admin-action-modal">

					<div class="card-body">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/report.jpg" alt="view_report_icon">
						</div>
						<p class=" mt-2">Click Here to View Report</p>
						<h1 class="text-uppercase- text-muted">View Report</h1>

					</div>
				</div>

			</div>


			<!-- Third Column -->
			<div class="col-md-4">

				<!-- second box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#admin-graph-modal">

					<div class="card-body">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/grap.png" alt="grap_icon">
						</div>
						<p class=" mt-2">Click here to view List and Graph</p>
						<h1 class="text-uppercase- text-muted">View Graph</h1>
					</div>
				</div>
			</div>
		</div>




		<!--  Fourth Row    -->

		<div class="row mt-3">

			<!-- first col -->
			<div class="col-md-6">
				<!-- first box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#view-dashboard-modal">

					<div class="card-body ">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								src="img/Dashboard1.png" alt="view_dashboard_icon">
						</div>
						<p class=" mt-2">Click Here to view Dashboard</p>
						<h1 class="text-uppercase- text-muted">View Dashboard</h1>

					</div>
				</div>
			</div>


			<!-- second col -->

			<div class="col-md-6">

				<!-- second box/card -->
				<div class="card text-center" data-toggle="modal"
					data-target="#view-board-modal">
					<div class="card-body">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								src="img/TheEnd.jpg" alt="the_end_icon">
						</div>
						<p class=" mt-2">“If you don’t give up on something you truly
							believe in, you will find a way.” ― Roy T. Bennett</p>
						<h1 class="text-uppercase- text-muted">Thank You !!</h1>

					</div>
				</div>

			</div>

		</div>



		<!-- Model Start  From Here-->

		<!-- Add Admin Model Start -->

		<div class="modal fade" id="add-admin-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill the Admin
							Details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<div class="card-body px-5">
							<h3 class="text-center my-2">Add Admin Here !!</h3>
							<form action="AdminServlet" method="post">
								<div class="form-group">
									<label for="name">Full Name</label> <input name="user_name"
										type="text" id="kha" class="form-control" id="name"
										placeholder="Your Full Name" aria-describedby="emailHelp">
								</div>

								<div class="form-group">
									<label for="email">Email</label> <input name="user_email"
										type="email" id="kha" class="form-control" id="email"
										placeholder="Your Email" aria-describedby="emailHelp">
								</div>

								<div class="form-group">
									<label for="password">Password</label> <input
										name="user_password" type="password" id="kha"
										class="form-control" id="password"
										placeholder="Password (8 character minimum)"
										aria-describedby="emailHelp" minlength="8" required= />
								</div>

								<div class="form-group">
									<label for="cpassword">Re-password</label> <input
										name="user_cpassword" type="password" id="kha"
										class="form-control" id="cpassword"
										placeholder="Repeat your password"
										aria-describedby="emailHelp">
								</div>

								<div class="form-group">
									<label for="phone">Phone</label> <input name="user_phone"
										type="number" id="kha" class="form-control" id="phone"
										placeholder="Your Number" aria-describedby="emailHelp"
										minlength="10" required= />
								</div>
								<div class="form-group">
									<label for="address">Address</label>
									<textarea name="user_address" style="height: 100px"
										class="form-control" id="kha" placeholder="Enter here"> </textarea>
								</div>
								<div class="container text-center">
									<button class="btn btn-outline-success">ADD</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- Add Admin Model End -->


		<!-- User  Modal Start -->

		<div class="modal fade" id="add-user-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill User
							Details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<!-- Start Form -->
						<div class=container-fluid>
							<div class="row mt-5">
								<div class="col-md-6 offset-md-3">
									<div class="card">

										<div class="card-body px-5">
											<h3 class="text-center my-2">Add User Here !!</h3>
											<form action="RegisterServlet" method="post">
												<div class="form-group">
													<label for="name">Full Name</label> <input name="user_name"
														type="text" id="kha" class="form-control" id="name"
														placeholder="Your Full Name" aria-describedby="emailHelp">
												</div>

												<div class="form-group">
													<label for="email">Email</label> <input name="user_email"
														type="email" id="kha" class="form-control" id="email"
														placeholder="Enter here" aria-describedby="emailHelp">
												</div>

												<div class="form-group">
													<label for="password">Password</label> <input
														name="user_password" type="password" id="kha"
														class="form-control" id="password"
														placeholder="Password (8 character minimum)"
														aria-describedby="emailHelp" minlength="8" required= />
												</div>

												<div class="form-group">
													<label for="cpassword">Re-password</label> <input
														name="user_cpassword" type="password" id="kha"
														class="form-control" id="cpassword"
														placeholder="Repeat your password"
														aria-describedby="emailHelp">
												</div>

												<div class="form-group">
													<label for="phone">Phone</label> <input name="user_phone"
														type="number" id="kha" class="form-control" id="phone"
														placeholder="Your Number" aria-describedby="emailHelp"
														minlength="10" required= />
												</div>

												<div class="form-group">
													<label for="address">Address</label>
													<textarea name="user_address" style="height: 100px"
														class="form-control" id="kha" placeholder="Enter here"> </textarea>
												</div>
												<div class="container text-center">
													<button class="btn btn-outline-success">ADD</button>
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
												</div>
											</form>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- User  Modal End -->


		<!-- List  Modal Start -->

		<div class="modal" id="view-list-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-xl" style="width: 1500px !important;">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title">List of Users</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Address</th>
									<th scope="col">Type</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ulist}" var="user">
									<tr>
										<td><c:out value="${user.userId}" /></td>
										<td><c:out value="${user.userName}" /></td>
										<td><c:out value="${user.userEmail}" /></td>
										<td><c:out value="${user.userAddress}" /></td>
										<td><c:out value="${user.userType}" /></td>
										<td><c:out value="${user.userStatus}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- List  Modal End -->


		<!-- Login and Logout History Modal ==> Start Modal -->

		<%
			UserDAO uudao = new UserDAO(FactoryProvider.getFactory());
		List<UserLog> llist = uudao.getAllLogs();
		session.setAttribute("uStatus", llist);
		%>

		<div class="modal" id="view-history-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-xl" style="width: 1500px !important;">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title">List of Users</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
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
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Login and Logout History => End Modal -->




		<!-- Block and UnBlock Status  => Start Modal -->

		<div class="modal" id="admin-action-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-xl" style="width: 1500px !important;">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title">Admin Power Guys!!</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">

							<c:forEach var="usr" items="${ulist}">

								<c:set var="id" value="${usr.userId}" />
								<c:set var="username" value="${usr.userName}" />

								<h2>Action Perform of Name : ${usr.userName}</h2>

								<c:set var="email" value="${usr.userEmail}" />
								<c:set var="password" value="${usr.userPassword}" />
								<c:set var="cpassword" value="${usr.userConformPassword}" />
								<c:set var="phone" value="${usr.userPhone}" />
								<c:set var="address" value="${usr.userAddress}" />
								<c:set var="type" value="${usr.userType}" />
								<c:set var="status" value="${usr.userStatus}" />


								<c:url value="specificUserStatus.jsp" var="viewHistory">
									<c:param name="uid" value="${id}" />
									<c:param name="uname" value="${username}" />
									<c:param name="uemail" value="${email}" />
									<c:param name="upass" value="${password}" />
									<c:param name="ucpass" value="${cpassword}" />
									<c:param name="uphone" value="${phone}" />
									<c:param name="uaddress" value="${address}" />
									<c:param name="utype" value="${type}" />
									<c:param name="ustatus" value="${status}" />
								</c:url>


								<c:url value="blockUser.jsp" var="usrBlock">
									<c:param name="uid" value="${id}" />
									<c:param name="uname" value="${username}" />
									<c:param name="uemail" value="${email}" />
									<c:param name="upass" value="${password}" />
									<c:param name="ucpass" value="${cpassword}" />
									<c:param name="uphone" value="${phone}" />
									<c:param name="uaddress" value="${address}" />
									<c:param name="utype" value="${type}" />
									<c:param name="ustatus" value="${status}" />
								</c:url>

								<c:url value="UnBlock.jsp" var="usrUnBlock">
									<c:param name="uid" value="${id}" />
									<c:param name="uname" value="${username}" />
									<c:param name="uemail" value="${email}" />
									<c:param name="upass" value="${password}" />
									<c:param name="ucpass" value="${cpassword}" />
									<c:param name="uphone" value="${phone}" />
									<c:param name="uaddress" value="${address}" />
									<c:param name="utype" value="${type}" />
									<c:param name="ustatus" value="${status}" />
								</c:url>

								<c:url value="updateProfile.jsp" var="usrupdate">
									<c:param name="uid" value="${id}" />
									<c:param name="uname" value="${username}" />
									<c:param name="uemail" value="${email}" />
									<c:param name="upass" value="${password}" />
									<c:param name="ucpass" value="${cpassword}" />
									<c:param name="uphone" value="${phone}" />
									<c:param name="uaddress" value="${address}" />
									<c:param name="utype" value="${type}" />
									<c:param name="ustatus" value="${status}" />
								</c:url>

								<c:url value="DeleteUser.jsp" var="usrdelete">
									<c:param name="uid" value="${id}" />
									<c:param name="uname" value="${username}" />
									<c:param name="uemail" value="${email}" />
									<c:param name="upass" value="${password}" />
									<c:param name="ucpass" value="${cpassword}" />
									<c:param name="uphone" value="${phone}" />
									<c:param name="uaddress" value="${address}" />
									<c:param name="utype" value="${type}" />
									<c:param name="ustatus" value="${status}" />
								</c:url>
								<div class="container">
									<a href="${usrdelete}"> <input type="button" name="delete"
										value="Delete" class="btn btn-secondary">
									</a> <a href="${usrupdate}"> <input type="button" name="update"
										value="Update" class="btn btn-secondary">
									</a> <a href="${usrBlock}"> <input type="button" name="block"
										value="Block User" class="btn btn-secondary">
									</a> <a href="${usrUnBlock}"> <input type="button"
										name="unblock" value="UnBlock User" class="btn btn-secondary">
									</a> </a> <a href="${viewHistory}"> <input type="button"
										name=" ViewHistory" value="View History"
										class="btn btn-secondary">
									</a>
								</div>

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
								<tr>
									<td>Type</td>
									<td>${usr.userType}</td>
								</tr>
								<tr>
									<td>Status</td>
									<td>${usr.userStatus}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Block and UnBlock Status  => End Modal -->



		<!-- Graph ==> Start Modal -->

		<div class="modal" id="admin-graph-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-xl" style="width: 1500px !important;">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title">User Graph</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<!-- Container Start -->
						<div class='container admin'>
							<div class="container-fluid md-3 mt-2"></div>
							<div class="row mt-4">
								<%
									UserDAO sachin = new UserDAO(FactoryProvider.getFactory());
								List<User> active = sachin.getAllActiveUsers();
								List<User> block = udao.getAllBockUsers();
								session.setAttribute("aList", active);
								session.setAttribute("bList", block);
								%>

								<!-- first col -->

								<div class="col-md-6">

									<!-- first box/card -->
									<div class="card text-center">
										<div class="card-body ">
											<div class="container">
												<img style="max-width: 100px"
													class="img-fluid rounded-circle" src="img/totaluser.png"
													alt="user_icon">
											</div>
											<h1><%=list.size()%></h1>
											<h1 class="text-uppercase- text-muted">Total Users</h1>
										</div>
									</div>

								</div>

								<!-- second col -->

								<div class="col-md-6">

									<!-- second box/card -->
									<div class="card text-center">

										<div class="card-body">
											<div class="container">
												<img style="max-width: 100px"
													class="img-fluid rounded-circle" src="img/adminuser.png"
													alt="admin_user_icon">
											</div>
											<h1><%=alist.size()%></h1>
											<h1 class="text-uppercase- text-muted">Admin User</h1>

										</div>
									</div>

								</div>
							</div>
						</div>

						<div class='container admin mt-3'>
							<div class="row mt-6">

								<!-- first col -->

								<div class="col-md-6">
									<!-- third box/card -->
									<div class="card text-center">
										<div class="container">
											<img style="max-width: 100px"
												class="img-fluid rounded-circle" src="img/activeuser.png"
												alt="activeuser_icon">
										</div>
										<div class="card-body">
											<h1><%=active.size()%></h1>
											<h1 class="text-uppercase- text-muted">Active User</h1>
										</div>
									</div>
								</div>

								<!-- second col -->

								<div class="col-md-6">
									<!-- third box/card -->
									<div class="card text-center">
										<div class="container">
											<img style="max-width: 100px"
												class="img-fluid rounded-circle" src="img/blockeduser.jpg"
												alt="blocked_user_icon">
										</div>
										<div class="card-body">
											<h1><%=block.size()%></h1>
											<h1 class="text-uppercase- text-muted">Blocked User</h1>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br> <br>
						<!-- Container Closed -->
						<h3>List of Admin</h3>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">Admin ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">User Type</th>
									<th scope="col">User Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${admList}" var="user">
									<tr>
										<td><c:out value="${user.userId}" /></td>
										<td><c:out value="${user.userName}" /></td>
										<td><c:out value="${user.userType}" /></td>
										<td><c:out value="${user.userStatus}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<br>
						<h3>List of Active Users</h3>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">User ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">User Type</th>
									<th scope="col">User Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${aList}" var="user">
									<tr>
										<td><c:out value="${user.userId}" /></td>
										<td><c:out value="${user.userName}" /></td>
										<td><c:out value="${user.userType}" /></td>
										<td><c:out value="${user.userStatus}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<br>
						<h3>List of Blocked Users</h3>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">User ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">User Type</th>
									<th scope="col">User Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bList}" var="user">
									<tr>
										<td><c:out value="${user.userId}" /></td>
										<td><c:out value="${user.userName}" /></td>
										<td><c:out value="${user.userType}" /></td>
										<td><c:out value="${user.userStatus}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Modal body Closed -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Graph ==> End Modal -->




		<!-- DashBoard ==> Start Modal -->
		<div class="modal" id="view-dashboard-modal" tabindex="-1"
			role="dialog">
			<div class="modal-dialog modal-xl" style="width: 1500px !important;">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title">Dashboard</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<%
							UserDAO statusdao = new UserDAO(FactoryProvider.getFactory());
						List<RegisterAdd> statusList = statusdao.getAllRegisterAdd();
						List<UserStatus> activities = statusdao.getAllStatus();
						session.setAttribute("registerinfo", statusList);
						session.setAttribute("allactivity", activities);
						%>
						<h1>Date of User Register and Added !!</h1>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">User Join Date</th>
									<th scope="col">Register Admin Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${registerinfo}" var="user">
									<tr>
										<td><c:out value="${user.id}" /></td>
										<td><c:out value="${user.userName}" /></td>
										<td><c:out value="${user.joinDate}" /></td>
										<td><c:out value="${user.adminCreatedDate}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<br> <br>

						<h1>Date of Active and Block !!</h1>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">User ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">Status</th>
									<th scope="col">Blocked Time</th>
									<th scope="col">Activated Time</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allactivity}" var="usr">
									<tr>
										<td><c:out value="${usr.id}" /></td>
										<td><c:out value="${usr.userId}" /></td>
										<td><c:out value="${usr.userName}" /></td>
										<td><c:out value="${usr.status}" /></td>
										<td><c:out value="${usr.blockTime}" /></td>
										<td><c:out value="${usr.activeTime}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!--DashBoard => End Modal -->
</body>
</html>