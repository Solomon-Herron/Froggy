<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>&#128056; Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--imports-->
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> BOOTSTRAP CSS LIB
    <link rel="stylesheet" type="text/css" href="../web-lib/Linearicons-Free-v1.0.0/icon-font.min.css"> icons
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/util.css">

    <!--main css-->
    <link rel="stylesheet" type="text/css" href="../css/list-users.css">
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
                    <li><a href="#" class="nav-link navs">Contact</a></li>
                    <li><a href="#" class="nav-link navs">About</a></li>
                    <li><a href="#" class="nav-link navs">Logout</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<div class="limiter">
    <div class="container-table">
        <div class="wrap-table">
            <div class="table">
                <table>
                    <thead>
                    <tr class="table-head">
                        <th class="devID">Developer ID</th>
                        <th class="firstName">First Name</th>
                        <th class="lastName">Last Name</th>
                        <th class="email">Email</th>
                        <th class="edit">Edit</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tempuser" items="${USER_LIST}">
                        <!-- set up a link for each user -- >
                        <c:url var="tempLink" value="BugControllerServlet">
                            <c:param name="command" value="LOAD" />
                            <c:param name="devID" value="${tempuser.devID}" />
                        </c:url>

                        <!--  set up a link to delete a user -->
                        <c:url var="deleteLink" value="BugControllerServlet">
                            <c:param name="command" value="RESOLVE" />
                            <c:param name="devID" value="${tempuser.devID}"/>
                        </c:url>

                        <tr>
                            <td class="devID"> ${tempuser.devID} </td>
                            <td class="firstName"> ${tempuser.fistName} </td>
                            <td class="lastName"> ${tempuser.lastName} </td>
                            <td class="email"> ${tempuser.email} </td>
                            <td class="edit">
                                <a href="${tempLink}">Update</a> | <a href="${deleteLink}">Resolve</a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>




    <!----------------------------------------------------------------SCRIPTS-------------------------------------------------------------------->
    <script type="text/javascript">
        var message = <%=request.getAttribute("MESSAGE")%>;
    </script>
    <!---------------------------------------------------------------------------------------------------------------------------------->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/@popperjs/core@2"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!---------------------------------------------------------------------------------------------------------------------------------->
    <script src="../js/validate.js"></script>

</body>
</html>