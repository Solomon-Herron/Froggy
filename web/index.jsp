<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>&#128056; Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> BOOTSTRAP CSS LIB
    <link rel="stylesheet" type="text/css" href="web-lib/Linearicons-Free-v1.0.0/icon-font.min.css"> icons
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <!---------------------------------------------------------------------------------------------------------------------------------->
</head>

<body>
<header>
    <div class="headerbar">
        <div class="title">
            <h1>&#128056; Froggy</h1>
        </div>
        <div class="container-navbar">
            <nav>
                <ul class="navlinks">
                    <li><a href="#" class="nav-link navs">Home</a></li>
                    <li><a href="login.jsp" class="nav-link navs">Login</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<!---------------------------------------------------CONTENT----------------------------------------------------------------------------->

<div class="limiter">
    <div class="container-content">

        <div class="intro">
            <h1><strong>Welcome!</strong></h1>
            <div class="titlebar"></div>
            <p>Froggy is a bug tracking application that will help your team seamlessly keep track of issues with your projects. Create an account today and elevate your team to higher levels of productivity!</p>
            <div class="container-login-form-btn p-t-25">
                <input type="button" class="login-form-btn" onclick="location.href='new-user.jsp';" value="Create Account">
            </div>
        </div>
    </div>
</div>


<!---------------------------------------------------------------------------------------------------------------------------------->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!---------------------------------------------------------------------------------------------------------------------------------->

<script type="text/javascript">
   var loggedIn = '<%=request.getAttribute("LOGGED_IN")%>';
   if ( loggedIn !== 'null') {
       document.getElementById("buglist").style.display = "block";
   } else {
       document.getElementById("buglist").style.display = "none";
   }
</script>
</body>
</html>