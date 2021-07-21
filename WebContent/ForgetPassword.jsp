<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Forgot Password form using Material Design</title>
  <!-- CORE CSS-->
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">

<style type="text/css">
html,
body {
    height: 100%;
}
html {
    display: table;
    margin: auto;
}
body {
    display: table-cell;
    vertical-align: middle;
}
.margin {
  margin: 0 !important;
}
</style>
  
</head>

<body class="yellow">


  <div id="login-page" class="row">
    <div class="col s12 z-depth-6 card-panel">
      <form action = "resetPassword" method = "POST" class="login-form">
        <div class="row">
          <div class="input-field col s12 center">
            <img src="img/core-img/Capture1.PNG" alt="" class="responsive-img valign profile-image-login">
            <p class="center login-form-text">User Management: Forgot Password Form</p>
          </div>     
        </div>
           
         <div align="center">
        <h2>Reset Your Password</h2>
        <p>
           Please enter your login email, we'll send a new random password to your inbox, then You can Reset your password. 
        </p>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input class="validate" id="email" type="email" name="email">
            <label for="email" data-error="wrong" data-success="right" class="center-align">Email</label>
          </div>
          
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input class="validate" id="email" type="password" name = "password">
            <label for="email" data-error="wrong" data-success="right" class="center-align">New Password</label>
          </div>
          
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input class="validate" id="email" type="password" name = "re_password">
            <label for="email" data-error="wrong" data-success="right" class="center-align">Re-password</label>
          </div>
          
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input type ="submit" value ="Change my Password ">
          </div>
        </div>
        <div class="row">
          <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="Register.jsp">Register Now!</a></p>
          </div>
          <div class="input-field col s6 m6 l6">
              <p class="margin right-align medium-small"><a href="login.jps">Login</a></p>
          </div>          
        </div>

      </form>
    </div>
  </div>


  <center>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Post Page - Responsive -->
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:250px"
     data-ad-client="ca-pub-5104998679826243"
     data-ad-slot="3470684978"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</center>


  <!-- jQuery Library -->
 <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!--materialize js-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>

</html>