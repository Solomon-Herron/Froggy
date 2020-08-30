package com.froggy.dao;

import com.froggy.Bug;

import javax.sql.DataSource;
import javax.swing.plaf.nimbus.State;
import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class BugDAO extends MySQLAccessor{
    private DataSource dataSource;

    public BugDAO(DataSource dataSource) {
        super(dataSource);
        this.dataSource = dataSource;
    }

    public List<Bug> getBugs() throws Exception{
        List<Bug> bugs = null;
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
        return bugs;
    }

    public void addBug(Bug newBug){
        Connection
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
                    changeHistory = changeHistory + "/n/n/n/t" + updatedBug.getReportDate() + ": Event Description- " + updatedBug.getEventDescription() + "/n/t  " + updatedBug.getBugDescription() + ".";
                } else {
                    if (!(currentEventDescription.equals(updatedBug.getEventDescription()))) {
                        changeHistory = changeHistory + "/n/n/n/t" + updatedBug.getReportDate() + ": Event Description- " + updatedBug.getEventDescription() + ".";
                    } else {
                        if (!(currentBugDescription.equals(updatedBug.getBugDescription()))) {
                            changeHistory = changeHistory + "/n/n/n/t" + updatedBug.getReportDate() + ": Bug Description- " + updatedBug.getBugDescription() + ".";
                        }
                    }
                }
            }
            String updateSql = "UPDATE bug SET event_description =" + updatedBug.getEventDescription() + ",  bug_description = " + updatedBug.getBugDescription() + ", report_date= " +
                    updatedBug.getReportDate() + ", change_history=" + changeHistory + "WHERE reference_id=" + updatedBug.getReferenceID();
            stmnt.executeUpdate(updateSql);
        } finally {
            close(conn, stmnt, rs);
        }
    }


}

