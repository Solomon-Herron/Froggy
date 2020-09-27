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
    <link rel="stylesheet" type="text/css" href="css/about.css">
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


<div class="limiter">
    <div class="container-content">
        <div class="content">
            <h1>Froggy</h1>
            <div class="title-line"></div><br><br>
            <h2 class="intro">My first Java project</h2><br>
            <p>Froggy is a java based CRUD application utilizing the model view controller (MVC) design patter. It was created using JSPs and Servlets. I decided to use these technologies in hopes to gain
            more foundational knowledge about back-end web development with Java. Before I move on to using Spring components I'd I wanted to use the least amount of black magic to handle certain processes.</p><br>

            <p>The scope of this project continues to grow as I learn how to incorporate new tools and design practices. Now that the application's core functionality is finished, I will be moving on to learning to
            write my own automated unit test with JUnit, and how to properly refactor my code. I'd also like to incorporate some Spring modules, ultimately moving away from Java expression language to JSON. I will be
            utilizing Spring's IoC container as well as Dependency injection.</p><br>

            <p>I have yet to decide if I will be refactoring this project to utilize Spring core, or begin an entirely separate application. </p>
        </div>
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
<script src="js/nouser.js"></script>
<script src="js/hamburger-menu.js"></script>

</body>
</html>