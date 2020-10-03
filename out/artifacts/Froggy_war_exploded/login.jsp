<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>&#128056; Login</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--imports-->
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> BOOTSTRAP CSS LIB
  <link rel="stylesheet" type="text/css" href="web-lib/Linearicons-Free-v1.0.0/icon-font.min.css">
  <link rel="stylesheet" type="text/css" href="web-lib/font-awesome-4.7.0/css/font-awesome.min.css">
  <!-- <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"> HAMBURGER MENU LIB **need to add to logged-in pages -->
  <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/util.css">

  <!--main css-->
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <!---------------------------------------------------------------------------------------------------------------------------------->
</head>

<body>
<!---------------------------------------------------------------------------------------------------------------------------------->

<header>
  <div class="headerbar">
    <div class="title">
      <h1>&#128056; Froggy</h1>
    </div>
    <div class="container-navbar">
      <div class="container-navbar">
        <nav>
          <ul class="navlinks">
            <li><a href="index.jsp" class="nav-link navs">Home</a></li>
            <li><a href="contact.jsp" class="nav-link navs">Contact</a></li>
            <li><a href="about.jsp" class="nav-link navs">About</a></li>
            <li><a href="#" class="nav-link navs">Login</a></li>
          </ul>
        </nav>
      </div>
  </div>
  </div>
</header>

<c:url var="listbugs" value="BugControllerServlet">
  <c:param name="command" value="LIST" />
</c:url>
<c:url var="addbug" value="BugControllerServlet">
  <c:param name="command" value="ADD" />
</c:url>
<div id="user-nav">
  <nav>
    <ul class="navlinks">
      <li><a href="${listbugs}" class="nav-link navs">Bug List</a></li>
      <li><a href="${addbug}" class="nav-link navs">Add a Bug</a></li>
    </ul>
  </nav>
</div>
<!---------------------------------------------------------------------------------------------------------------->
<div id="no-user">
  <p class="message">The login information that you have entered does not match any account.</p>
</div>
<!---------------------------------------------------------------------------------------------------------------------------------->

<div class="limiter">
  <div class="container-content">
    <div class="wrap-login p-l-50 p-r-50 p-t-77 p-b-30">
      <form class="login-form validate-form" action="UserControllerServlet" method="POST">
					<span class="login-form-title p-b-55">
						Login
					</span>

        <div class="wrap-input validate-input m-b-16" data-validate = "Password is required">
          <input class="input" type="text" name="userName" placeholder="User Name">
          <span class="focus-input"></span>
          <span class="symbol-input">
								<span class="lnr lnr-user"></span>
							</span>
        </div>

        <div class="wrap-input validate-input m-b-16" data-validate = "Password is required">
          <input class="input" type="password" name="password" placeholder="Password">
          <span class="focus-input"></span>
          <span class="symbol-input">
								<span class="lnr lnr-lock"></span>
							</span>
        </div>
        <input type="hidden" name="command" value="LOGIN"/>
        <div class="container-login-form-btn p-t-25">
          <button type="submit" class="login-form-btn">
            Login
          </button>
          <div class="container-login-form-btn p-t-25">
            <input type="button" class="login-form-btn" onclick="location.href='new-user.jsp';" value="Create Account">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

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

</body>
</html>