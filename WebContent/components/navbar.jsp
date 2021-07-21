<%@page import = "com.user.management.entities.User" %>
<%
	User usera = (User)session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark  custom-bg">
    <div class="container">
         <a class="navbar-brand" href="index.jsp">UserManagementSystem</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="About.jsp">About Us <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="Contact.jsp">Contact <span class="sr-only">(current)</span></a>
      </li>
    </ul>
      <ul class="navbar-nav ml-auto">
      
      	<%
      	 if(usera==null)
      	 {		 
      	%>
      	<li class="nav-item active">
        <a class="nav-link" href="Login.jsp">Login</a>
       </li>
        <li class="nav-item active">
        <a class="nav-link" href="Register.jsp">Register</a>
       </li>
       
      	 <% 
      	  }
      	 else
      	 {
      	
      	 %>
      	 
      	<li class="nav-item active">
         <a class="nav-link" href="#"><%=usera.getUserName()%></a>
        </li>
         <li class="nav-item active">
         <a class="nav-link" href="LogoutServlet">Logout</a>
        </li>
        
        <%	  
      	 }
      	%>
       
      </ul>  
  </div>
    </div>
</nav>