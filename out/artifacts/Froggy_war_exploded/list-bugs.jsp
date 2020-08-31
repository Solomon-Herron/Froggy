<%--
  @author: Solomon Herron
  Date: 8/29/2020
  Time: 3:59 PM
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
  dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
  sunt in culpa qui officia deserunt mollit anim id est laborum.
--%>-
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>&#128056; Froggy</title>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>Bug Tracker</h2>
        </div>
    </div>

    <div id="container">
        <div id="content">
            <!-- put new button: Add bug -->
            <input type="button" value="Add a bug"
                   onclick="window.location.href='add-bug.jsp'; return false;"
                   class="add-bug-button"
            />
            <table>
                <tr>
                    <th>Reference ID</th>
                    <th>User ID</th>
                    <th>Event Description</th>
                    <th>Bug Description</th>
                    <th>Date Reported</th>
                    <th>Change Log</th>
                    <th>Resolution</th>
                </tr>

                <c:forEach var="tempbug" items="${BUG_LIST}">
                    <!-- set up a link for each bug -->
                    <c:url var="tempLink" value="BugControllerServlet">
                        <c:param name="command" value="LOAD" />
                        <c:param name="referenceID" value="${tempbug.referenceID}" />
                    </c:url>

                    <!--  set up a link to delete a bug -->
                    <c:url var="deleteLink" value="BugControllerServlet">
                        <c:param name="command" value="DELETE" />
                        <c:param name="referenceID" value="${tempbug.referenceID}"/>
                    </c:url>

                    <tr>
                        <td> ${tempbug.referenceID} </td>
                        <td> ${tempbug.devID} </td>
                        <td> ${tempbug.eventDescription} </td>
                        <td> ${tempbug.bugDescription} </td>
                        <td> ${tempbug.reportDate} </td>
                        <td> ${tempbug.changeHistory}</td>
                        <td> ${tempbug.resolution} </td>
                        <td>
                        <a href="${tempLink}">Update</a>
                        |
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this bug?'))) return false">
                            Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>


</body>
</html>
