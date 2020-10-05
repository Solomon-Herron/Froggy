
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>&#128056; Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--imports-->
    <link rel="stylesheet" type="text/css" href="web-lib/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> BOOTSTRAP CSS LIB
    <link rel="stylesheet" type="text/css" href="web-lib/Linearicons-Free-v1.0.0/icon-font.min.css"> icons
    <!-- <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"> HAMBURGER MENU LIB **need to add to logged-in pages -->
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/util.css">

    <!--main css-->
    <link rel="stylesheet" type="text/css" href="css/add-bug.css">
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
        <div class="wrap-login p-l-50 p-r-50 p-t-77 p-b-30">
            <form class="login-form validate-form" action="BugControllerServlet" method="GET">
					<span class="login-form-title p-b-55">
						Update Bug
					</span>

                <div class="wrap-input validate-input m-b-16" data-validate = "Please provide an update">
                    <textarea class="input" type="text" name="eventDescription">${UPDATE_BUG.eventDescription}</textarea>
                    <span class="focus-input"></span>
                </div>

                <div class="wrap-input validate-input m-b-16" data-validate = "Please provide an update">
                    <textarea class="input" type="text" name="bugDescription">${UPDATE_BUG.bugDescription}</textarea>
                    <span class="focus-input"></span>
                </div>

                <input type="hidden" name="command" value="UPDATE"/>
                <input type="hidden" name="referenceID" value="${UPDATE_BUG.referenceID}"/>
                <div class="container-login-form-btn p-t-25">
                    <button type="submit" class="login-form-btn">
                        Submit
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>

    <!---------------------------------------------------------------------------------------------------------------------------------->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/@popperjs/core@2"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!---------------------------------------------------------------------------------------------------------------------------------->
    <script src="js/validate.js"></script>
    <script src="js/nouser.js"></script>

</body>
</html>