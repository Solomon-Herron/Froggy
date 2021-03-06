package com.froggy.dao;

import com.froggy.Bug;
import com.froggy.User;

import javax.sql.DataSource;
import javax.swing.plaf.nimbus.State;
import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BugDAO extends MySQLAccessor{
    private DataSource dataSource;

    public BugDAO(DataSource dataSource) {
        super(dataSource);
        this.dataSource = dataSource;
    }


    public List<Bug> getBugs() throws Exception{
        List<Bug> bugs = new ArrayList<>();
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;
        try{
            conn = dataSource.getConnection();
            String sql = "SELECT * FROM bug";
            stmnt = conn.createStatement();
            rs = stmnt.executeQuery(sql);
            while(rs.next()){
                int referenceID = rs.getInt("reference_id");
                int devID = rs.getInt("dev_id");
                String eventDescription = rs.getString("event_description");
                String bugDescription = rs.getString("bug_description");
                String reportDate = rs.getString("report_date");
                String changeHistory = rs.getString("change_history");
                String resolution = rs.getString("resolution");
                Bug tempbug = new Bug(referenceID, devID, eventDescription, bugDescription, reportDate, changeHistory, resolution);
                bugs.add(tempbug);
            }
        }finally {
            close(conn, stmnt, rs);
        }
        return bugs;//bugs alwats null, thats why list-bugs.jsp blank table
    }

    public void addBug(Bug newBug) throws Exception{
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;
        try {
            conn = dataSource.getConnection();
            String sql = "INSERT INTO bug (dev_id, event_description, bug_description, report_date) VALUES (" + newBug.getDevID() + ", '" + newBug.getEventDescription() + "', '" + newBug.getBugDescription() + "', '" + newBug.getReportDate() + "');";
            System.out.println("In bug DAO, before devID is sent to db" + newBug.getDevID());
            stmnt = conn.createStatement();
            stmnt.execute(sql);
        }finally{
            close(conn, stmnt, rs);
        }
    }

    public Bug getBug(String referenceID) throws Exception {
        Bug bug = null;
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;
        try {
            int referenceId = Integer.parseInt(referenceID);
            conn = dataSource.getConnection();
            String sql = "SELECT * FROM bug WHERE reference_id =" + referenceId;
            stmnt = conn.createStatement();
            rs = stmnt.executeQuery(sql);
            while (rs.next()) {
                int devID = rs.getInt("dev_id");
                String eventDescription = rs.getString("event_description");
                String bugDescription = rs.getString("bug_description");
                String reportDate = rs.getString("report_date");
                String changeHistory = rs.getString("change_history");
                String resolution = rs.getString("resolution");
                bug = new Bug(referenceId, devID, eventDescription, bugDescription, reportDate, changeHistory, resolution);
            }
        } finally {
            close(conn, stmnt, rs);
        }
        return bug;
    }


    public void updateBug(Bug updatedBug) throws Exception{ //int or string I forget
        String changeHistory = null;
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;

        try{
            String referenceID = Integer.toString(updatedBug.getReferenceID());
            //Create Connection
            conn = dataSource.getConnection();
            //create SQL statement
            String SelectSql  = "select event_description, bug_description, change_history from bug where reference_id=" + referenceID;
            stmnt = conn.createStatement(); //statement object created for connection
            //execute query
            rs = stmnt.executeQuery(SelectSql);
            //proccess result set
            while (rs.next()) {
                //extract data from rs
                changeHistory = rs.getString("change_history");
                String currentEventDescription = rs.getString("event_description");
                String currentBugDescription = rs.getString("bug_description");

                if (!(currentEventDescription.equals(updatedBug.getEventDescription())) & !(currentBugDescription.equals(updatedBug.getBugDescription()))) {
                    changeHistory = changeHistory + "    ||||    " + updatedBug.getReportDate() + ", Changes made by " + updatedBug.getDevID() + " : Event Description- " + updatedBug.getEventDescription() + " | Bug Description:-" + updatedBug.getBugDescription() + ".";
                } else {
                    if (!(currentEventDescription.equals(updatedBug.getEventDescription()))) {
                        changeHistory = changeHistory + "    ||||    " + updatedBug.getReportDate() + ", Changes made by " + updatedBug.getDevID() + ": Event Description- " + updatedBug.getEventDescription() + ".";
                    } else {
                        if (!(currentBugDescription.equals(updatedBug.getBugDescription()))) {
                            changeHistory = changeHistory + "    ||||    " + updatedBug.getReportDate() + ", Changes made by " + updatedBug.getDevID() + ": Bug Description- " + updatedBug.getBugDescription() + ".";
                        }
                    }
                }
            }
            String updateSql = "UPDATE bug SET dev_id=" + updatedBug.getDevID() + ", event_description ='" + updatedBug.getEventDescription() + "',  bug_description = '" + updatedBug.getBugDescription() + "', report_date= '" +
                    updatedBug.getReportDate() + "', change_history='" + changeHistory + "' WHERE reference_id=" + referenceID;
            stmnt.executeUpdate(updateSql);
        } finally {
            close(conn, stmnt, rs);
        }
    }


    public void resolveBug(String referenceID, String resolution) throws Exception {
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;
        try {
            int referenceId = Integer.parseInt(referenceID);
            conn = dataSource.getConnection();
            String sql = "UPDATE bug SET resolution= '" + resolution + "' WHERE reference_id=" + referenceId;
            stmnt = conn.createStatement();
            stmnt.executeUpdate(sql);
        }finally{
            close(conn, stmnt, rs);
        }
    }

    public String getChangeLog(String referenceID) throws Exception {
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;
        String changelog = null;
        try {
            int referenceId = Integer.parseInt(referenceID);
            conn = dataSource.getConnection();
            String sql = "SELECT change_history FROM bug WHERE reference_id=" + referenceId;
            stmnt = conn.createStatement();
            rs = stmnt.executeQuery(sql);
            while (rs.next()){
                 changelog = rs.getString("change_history");
            }
            System.out.println(changelog);
            if (changelog == null){
                changelog = "There have been no updates to this issue";
            }
            System.out.println(changelog);
            return changelog;
        }finally{
            close(conn, stmnt, rs);
        }

    }

    public Bug getResolution(String referenceID) throws Exception{
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;
        Bug bug = null;
        String resolution = null;
        String eventDesc = null;
        String bugDesc = null;
        try {
            int referenceId = Integer.parseInt(referenceID);
            conn = dataSource.getConnection();
            String sql = "SELECT resolution, event_description, bug_description FROM bug WHERE reference_id=" + referenceId;
            stmnt = conn.createStatement();
            rs = stmnt.executeQuery(sql);
            while (rs.next()){
                resolution = rs.getString("resolution");
                eventDesc = rs.getString("event_description");
                bugDesc = rs.getString("bug_description");
            }
            if (resolution == null){
                resolution = "There have been no updates to this issue";
            }
            bug = new Bug(resolution, eventDesc, bugDesc);
            return bug;
        }finally{
            close(conn, stmnt, rs);
        }

    }
}

