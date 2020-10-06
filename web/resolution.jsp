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
    <link rel="stylesheet" type="text/css" href="css/resolution.css">
    <!---------------------------------------------------------------------------------------------------------------------------------->
</head>

<body>
<!---------------------------------------------------------------------HEADER-------------------------------------------------------------->

<header>
    <div class="headerbar">
        <div class="title">
            <h1>&#128056; Froggy</h1>
        </div>
        <div class="container-navbar">
            <nav>
                <c:url var="buglist" value="BugControllerServlet">
                    <c:param name="command" value="LIST" />
                </c:url>
                <c:url var="contact" value="UserControllerServlet">
                    <c:param name="command" value="CONTACT" />
                </c:url>
                <c:url var="about" value="UserControllerServlet">
                    <c:param name="command" value="ABOUT" />
                </c:url>
                <c:url var="logout" value="UserControllerServlet">
                    <c:param name="command" value="LOGOUT" />
                </c:url>
                <ul class="navlinks">
                    <li><a href="${buglist}" class="nav-link navs">Bug List</a></li>
                    <li><a href="${contact}" class="nav-link navs">Contact</a></li>
                    <li><a href="${about}" class="nav-link navs">About</a></li>
                    <li><a href="${logout}" class="nav-link navs">Logout</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>



<div class="limiter">
    <div class="container-content">
        <div class="resolution-container">
            <div class="event-description">
                <h2>Event Description</h2>
                <hr>
                <p class="fadetext">${RESOLUTION.eventDescription}</p>
            </div>
            <div class="bug-description">
                <h2>Bug Description</h2>
                <hr>
                <p class="fadetext">${RESOLUTION.bugDescription}</p>
            </div>
        </div>

        <div class="resolution">
            <h2>Resolution</h2>
            <hr>
            <p class="restext">${RESOLUTION.resolution}</p>
        </div>

    </div>
</div>


<!---------------------------------------------------------------------------------------------------------------------------------->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>