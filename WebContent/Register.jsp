<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Registration Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
        .sachin
        {
       		 top-margin: 50px;
        }
        </style>
    </head>
    <body> 
          <section class="welcome_area clearfix" id="home" style="background-image: url(img/bg-img/welcome-bg.png")>
           <%@include file="components/navbar.jsp" %>
           <div class = container-fluid class ="sachin">     
        <div class ="row mt-3">
            <div class ="col-md-4 offset-md-4">
                <div class ="card"> 
                <%@include file = "components/message.jsp" %>
                
                    <div class="card-body px-6">
                        <h3 class="text-center my-2"> Sign up here!! </h3>
                        <form action = "RegisterServlet" method = "post">
                <div class="form-group">
                <label for="name">Full Name</label>
                <input name ="user_name" type="text" id = "kha" class="form-control" id="name"  placeholder= "Your Name" aria-describedby="emailHelp">
                </div>
                
                <div class="form-group">
                <label for="email">Email</label>
                <input name ="user_email" type="email"  id = "kha"  class="form-control" id="email" placeholder= "Your Email" aria-describedby="emailHelp">
                </div>
                    
                <div class="form-group">
                <label for="password">Password</label>
                <input name ="user_password" type="password"  id = "kha"  class="form-control" id="password" placeholder= "Password (8 character minimum)" aria-describedby="emailHelp" minlength="8" required=/>
                </div>
                 
                 <div class="form-group">
                <label for="cpassword">Re-password</label>
                <input name ="user_cpassword" type="password"   id = "kha"  class="form-control" id="cpassword" placeholder= "Repeat your password" aria-describedby="emailHelp">
                </div>
                
                <div class="form-group">
                <label for="phone">Phone</label>
                <input name = "user_phone" type="number"  id = "kha"  class="form-control" id="phone" placeholder= "Your Number" aria-describedby="emailHelp" minlength="10" required=/>
                </div> 
                    
                <div class="form-group">
                <label for="address">Address</label>
                <textarea name = "user_address" style="height:100px" class = "form-control"   id = "kha"  placeholder="Enter here"> </textarea>
                </div>   
                    <a href = "Login.jsp" class="text-center d-block mb-2"> If already Registered. </a> 
                    <div class="container text-center">
                        <button class = "btn btn-outline-success"> Register</button>
                        <button onclick="document.getElementById('kha').value = ''" class = "btn btn-outline-warning"> Reset</button>
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
