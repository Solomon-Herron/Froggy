<%--
  @author: Solomon Herron
  Date: 8/23/2020
  Time: 8:55 PM
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
  dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
  sunt in culpa qui officia deserunt mollit anim id est laborum.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Welcome</title>
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"  href="/styles/login.css">
  </head>
  <body>

  <div class="container">
    <div class="login-form">
      <h1 class="login">Login</h1>
      <form action="UserControllerServlet" method="get">
        <label>Username:</label><input type="text" value="Enter Username" name="userName">
        <label>Password:</label><input type="password" value="Enter password" name="password">
        <input type="hidden" name="command" value="LOGIN"/>
        <input type="submit" value="Login">
      </form>
    </div>
    <div class="new-account">
      <input type="button" onclick="location.href='${pageContext.request.contextPath}/new-user.jsp';"  value="Create Account">
    </div>
  </div>


  </body>
</html>
