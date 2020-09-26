<%@ page import="com.froggy.Bug" %>
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
    <link rel="stylesheet" type="text/css" href="web-lib/Linearicons-Free-v1.0.0/icon-font.min.css"> icons
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/util.css">

    <!--main css-->
    <link rel="stylesheet" type="text/css" href="css/list-bugs.css">
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
                        <th class="referenceID">Reference ID</th>
                        <th class="devID">Developer ID</th>
                        <th class="eventDesc">Event Description</th>
                        <th class="bugDesc">Bug Description</th>
                        <th class="dateReported">Date Reported</th>
                        <th class="changeLog">Change Log</th>
                        <th class="resolution">Resolution</th>
                        <th class="edit">Edit</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tempbug" items="${BUG_LIST}">

                        <c:url var="changeLogLink" value="BugControllerServlet">
                            <c:param name="command" value="CHANGELOG" />
                            <c:param name="referenceID" value="${tempbug.referenceID}"/>
                        </c:url>

                        <!-- set up a link for each bug -->
                        <c:url var="updateLink" value="BugControllerServlet">
                            <c:param name="command" value="LOAD"/>
                            <c:param name="referenceID" value="${tempbug.referenceID}" />
                        </c:url>

                        <!--  set up a link to delete a bug -->
                        <c:url var="resolveLink" value="BugControllerServlet">
                            <c:param name="command" value="RESOLVE"/>
                            <c:param name="referenceID" value="${tempbug.referenceID}"/>
                        </c:url>

                        <tr>
                            <td class="referenceID"> ${tempbug.referenceID} </td>
                            <td class="devID"> ${tempbug.devID} </td>
                            <td class="eventDesc"> ${tempbug.eventDescription} </td>
                            <td class="bugDesc"> ${tempbug.bugDescription} </td>
                            <td class="dateReported"> ${tempbug.reportDate} </td>
                            <td class="changeLog"><a href="${changeLogLink}"><span class="lnr lnr-book"></span></a></td>
                            <td class="resolution">
                    <!--<di-->
                             <c:if test="${!(tempbug.resolution == null)}">
                                 <c:out value="<button><div class='lnr lnr-checkmark-circle'></div></button>" escapeXml="false"/>

                             </c:if>
                                <c:if test="${(tempbug.resolution == null)}">
                                    <c:out value="<span class='x'><span class='lnr lnr-cross-circle'></span></span>" escapeXml="false"/>
                                </c:if>

                            </td>
                            <td class="edit">
                                <a href="${updateLink}">Update</a> | <a href="${resolveLink}">Resolve</a>
                            </td>
                        </tr>


                    </c:forEach>

                    <tr>
                        <td><a href="https://stackoverflow.com/questions/20255458/expanding-a-div-to-reveal-overflow-on-click" target="_blank">*expand over flow</a></td>
                    </tr>
                    <tr>
                        <td><a href="https://stackoverflow.com/questions/17450861/add-scroll-bar-to-table-body" target="_blank">*add scroll bar to table</a></td>
                    </tr>

                    </tbody>
                </table>

                <div class="container-login-form-btn  add-bug">
                    <input type="button" class="login-form-btn" onclick="location.href='add-bug.jsp';" value="Report a new bug">
                </div>

            </div>
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
<script>
    function openResolution() {
        document.getElementById("resolution-popup").style.display = "block"; //<---this is the goddamn problem. Cant select all mactching classes, because that will open every resolution. Cant open a single element by ID because that rules out every other resolution in list :((((
    }
    function closeResolution() {
        document.getElementById("resolution-popup").style.display = "none";
    }
    document.querySelectorAll(".open-button").addEventListener("click", openResolution);
    document.querySelectorAll(".close-button").addEventListener("click", closeResolution);
</script>


</body>
</html>