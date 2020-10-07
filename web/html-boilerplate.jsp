<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>&#128056; Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--imports-->
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> BOOTSTRAP CSS LIB
    <link rel="stylesheet" type="text/css" href="web-lib/Linearicons-Free-v1.0.0/icon-font.min.css"> icons
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/util.css">

    <!--main css-->
    <link rel="stylesheet" type="text/css" href="css/<<>>.css">
    <!---------------------------------------------------------------------------------------------------------------------------------->
</head>

<body>
<!--------------------------------------------------------------------HEADER-------------------------------------------------------------->

<header>
    <div class="headerbar">
        <div class="title">
            <h1>&#128056; Froggy</h1>
        </div>
        <div class="container-navbar">
            <nav>
                <ul class="navlinks">
                    <li><a href="index.jsp" class="nav-link navs">Home</a></li>
                    <li><a href="contact.jsp" class="nav-link navs">Contact</a></li>
                    <li><a href="about.jsp" class="nav-link navs">About</a></li>
                    <li><a href="#" class="nav-link navs">Logout</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<!-----------------------------------------------------------ALERT MESSAGE--------------------------------------------------------------->
<div id="container-message">
    <p class="message">#</p>
</div>
<!-----------------------------------------------------------CONTENT----------------------------------------------------------------------------->

<div class="limiter">
    <div class="hamburger-menu">
        <div class="line line-1"></div>
        <div class="line line-2"></div>
        <div class="line line-3"></div>
    </div>

    <div class="container-content">






    </div>
</div>

<!----------------------------------------------------------------SCRIPTS-------------------------------------------------------------------->
    <script type="text/javascript">
        var noUser = <%=request.getAttribute("NO_USER")%>;
    </script>
    <!---------------------------------------------------------------------------------------------------------------------------------->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/@popperjs/core@2"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!---------------------------------------------------------------------------------------------------------------------------------->
    <script src="js/validate.js"></script>

</body>
</html>