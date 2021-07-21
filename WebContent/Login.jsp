<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login Page</title>
<%@include file="components/common_css_js.jsp"%>
<style>
body {
	
  background-image: url(img/bg-img/welcome-bg.png);	
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	   <section class="welcome_area clearfix" id="bg">
	   <div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-4">
				<div class="card mt-3">
					<div class="card-header custom-bg text-white">
						<h3>Login Here</h3>
					</div>
					<div class="card-body">
						<%@include file="components/message.jsp"%>
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" id="sac" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="showPassword">Password</label> <input
									type="password" id="showPassword" name="password"
									class="form-control">
							</div>

							<div class="form-group form-check">
								<input type="checkbox" onclick="myFunction()"
									class="form-check-input" id="exampleCheck1"> <label
									class="form-check-label" for="exampleCheck1">Show
									Password</label>
							</div>

							<a href="Register.jsp" class="text-center d-block mb-2"> If
								not registered click here </a>
								
							<a href="ForVerification.jsp" class="text-center d-block mb-2"> If
								forget password click here </a>	
								
							<div class="container text-center">
								<button type="submit" class="btn btn-primary custom-bg custom-bg border-0">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	   </section>
</body>
</html>