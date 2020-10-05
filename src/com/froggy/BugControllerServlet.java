package com.froggy;

import com.froggy.dao.BugDAO;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


//eventDescription = URLDecoder.decode(tempCookie.getValue(), "UTF-8");

public class BugControllerServlet extends javax.servlet.http.HttpServlet {

    private BugDAO bugDAO;
    @Resource(name="jdbc/froggy_bug_tracker")
    private DataSource dataSource;

    @Override//intialize the connection as soon as tomcat starts up
    public void init() throws ServletException {
        super.init();
        try{
            bugDAO = new BugDAO(dataSource);
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        try {
            //read command parameter
            String command = request.getParameter("command");

            //if command is missing, then default to listing students
            if (command == null) {
                command = "LIST";
            }
            //route to the appropriate method
            switch (command) { //you can use the switch conditional to redirect to different servlets that route traffic to different models.
                case "LIST":
                    listBugs(request, response);
                    break;
                case "ADD":
                    addBug(request, response);
                    break;
                case "LOAD":
                    loadBug(request, response);
                    break;
                case "UPDATE":
                    updateBug(request, response);
                    break;
                case "RESOLVE":
                    loadresolveBug(request, response);
                    break;
                case "RESOLVED":
                    resolveBug(request, response);
                    break;
                case "RESOLUTION":
                    getresolution(request, response);
                    break;
                case "CHANGELOG":
                    viewChangeLog(request, response);
                    break;

                default:
                    listBugs(request, response);
            }
            //List the students in MVC fashion.
            listBugs(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void listBugs(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //get bugs from sqlaccessor
        List<Bug> bugs = bugDAO.getBugs();
        //append bug objects to request before sending the request to JSP, so the JSP can read values and display them in the response.
        request.setAttribute("BUG_LIST", bugs); // when you append an attribute(object) to a request, the method signature require you to provide a name for the attribute and a value(the object/data structure you are appending.
        //send to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-bugs.jsp");
        dispatcher.forward(request, response);

    }

    //= URLEncoder.encode(favLang, "UTF-8");
    private void loadBug(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //get bug id from jsp
        String referenceID = request.getParameter("referenceID");
        //get bug info from bugDAO
        Bug tobeupdatedBug = bugDAO.getBug(referenceID);
        //place that student in a request attribute
        request.setAttribute("UPDATE_BUG", tobeupdatedBug);
        //send this to the update-bug.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/update-bug.jsp");
        dispatcher.forward(request,response);

    }

    private void addBug(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String devIDstring = (String) session.getAttribute("currentUser");
        int devID = Integer.parseInt(devIDstring);
        String eventDescription = request.getParameter("eventDescription");
        String bugDescription = request.getParameter("bugDescription");
        LocalDateTime rawTime = LocalDateTime.now();
        DateTimeFormatter formatCurrentTime = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm:ss");
        String reportDate = rawTime.format(formatCurrentTime);
        Bug newBug = new Bug(eventDescription, bugDescription, reportDate, devID);
        System.out.println("devID= " + devID);
        System.out.println("newBug.getDevID()= " + newBug.getDevID());
        //add the bug to the DB
        bugDAO.addBug(newBug);
        //send back to main page
        listBugs(request, response);

    }

    private void updateBug(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int referenceID = Integer.parseInt(request.getParameter("referenceID"));
        HttpSession session = request.getSession();
        String devIDstring = (String) session.getAttribute("currentUser");
        int devID = Integer.parseInt(devIDstring);
        String eventDescription = request.getParameter("eventDescription");
        String bugDescription = request.getParameter("bugDescription");
        LocalDateTime rawTime = LocalDateTime.now();
        DateTimeFormatter formatCurrentTime = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm:ss");
        String reportDate = rawTime.format(formatCurrentTime);


        Bug updatedBug = new Bug(referenceID, eventDescription, bugDescription, reportDate, devID);
        bugDAO.updateBug(updatedBug);
        listBugs(request, response);

    }
    private void resolveBug(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String referenceID = request.getParameter("referenceID");
        System.out.println("this is the reference id: " + referenceID); //debug
        String resolution = request.getParameter("resolution");
        bugDAO.resolveBug(referenceID, resolution);
        listBugs(request, response);
    }

    private void viewChangeLog(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String referenceID = request.getParameter("referenceID");
        String changeLog = bugDAO.getChangeLog(referenceID);
        request.setAttribute("CHANGE_LOG", changeLog);
        //send this to the update-bug.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/bug-changelog.jsp");
        dispatcher.forward(request,response);
    }

    private void loadresolveBug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get bug id from jsp
        String referenceID = request.getParameter("referenceID");;
        //place that student in a request attribute
        request.setAttribute("REFERENCE_ID", referenceID);
        //send this to the update-bug.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/resolve-bug.jsp");
        dispatcher.forward(request,response);
    }


    private void getresolution(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String referenceID = request.getParameter("referenceID");
        Bug bug = bugDAO.getResolution(referenceID);
        request.setAttribute("RESOLUTION", bug);
        //send this to the update-bug.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/resolution.jsp");
        dispatcher.forward(request,response);
    }

}
