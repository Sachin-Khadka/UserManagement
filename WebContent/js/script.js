alert("Admin Sachin !!");

function myFunction() {
	  var x = document.getElementById("showPassword");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}



function  togglemenu()
{
	document.getElementById('slidebar').classList.toggle('active');
}

