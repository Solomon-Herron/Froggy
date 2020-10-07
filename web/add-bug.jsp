<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>&#128056; Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="web-lib/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="web-lib/Linearicons-Free-v1.0.0/icon-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/add-bug.css">
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
						Create new bug
					</span>

                <div class="wrap-input m-b-16" data-validate = "Please describe the event.">
                    <textarea class="input" type="text" name="eventDescription" placeholder="Enter a detailed description of the event where bug the occurs."></textarea>
                    <span class="focus-input"></span>
                </div>

                <div class="wrap-input m-b-16" data-validate = "Please describe the nature of the bug">
                    <textarea class="input" type="text" name="bugDescription" placeholder="Enter a detailed description of the bug. Outline expected functionality as compared to the behavior of the bug."></textarea>
                    <span class="focus-input"></span>
                </div>

                <input type="hidden" name="command" value="ADD"/>
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


</body>
</html>