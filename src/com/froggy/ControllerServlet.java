package com.froggy;

import com.froggy.dao.BugDAO;
import com.froggy.dao.UserDAO;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.IOException;

public class ControllerServlet extends javax.servlet.http.HttpServlet {

    private BugDAO bugDAO;
    private UserDAO userDAO;
    @Resource(name="jdbc/froggy_bug_tracker")
    private DataSource dataSource;

    @Override //intialize the connection as soon as tomcat starts up
    public void init() throws ServletException {
        super.init();
        try{
            bugDAO = new BugDAO(dataSource);
            userDAO = new UserDAO(dataSource);
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }


    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {





    }

    //as soon as password information is obtained from the request, it needs to be encrypted before sending to DAO or db.
}
