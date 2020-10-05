package com.froggy;

import java.util.List;

public class Bug {
    /*
     * eventDescription: A description given be the user that describe the action that cause the bug on application.
     * bugDescription: A description of the bug.
     */
    private int referenceID;
    private int devID;
    private String eventDescription;
    private String bugDescription;
    //  reportDate = DB(creation_date)
    //  1.)This is used when creating and editing a bug. This is variable should be cleaned initialised in the ControllerServlet using parameters sent along with request header for initial bug
    //  creation. This will be passed along with all other bug info to DAO from controller.
    //  2.)This is also used in updateBug() to display the change history in the browser. When a bug is updated all the new event/desc fields a new reportDate will be created,
    //  will be appended to the existing eventHistory/descriptionHistory
    //  4.) event/descHistory will take the form of reportDate: old event/descriptions
    private String reportDate;
    private String changeHistory;
    private String resolution;

    //Create a constructor for obtaining a bug obj from database
    public Bug(int referenceID, int devID, String eventDescription, String bugDescription, String reportDate, String changeHistory, String resolution) {
        this.referenceID = referenceID;
        this.devID = devID;
        this.eventDescription = eventDescription;
        this.bugDescription = bugDescription;
        this.reportDate = reportDate;
        this.changeHistory = changeHistory;
        this.resolution = resolution;
    }

    public Bug(int referenceID, int devID, String eventDescription, String bugDescription, String changeHistory) {
        this.referenceID = referenceID;
        this.devID = devID;
        this.eventDescription = eventDescription;
        this.bugDescription = bugDescription;
        this.changeHistory = changeHistory;
    }
    public Bug(int referenceID,  String eventDescription, String bugDescription, String reportDate, int devID) {
        this.referenceID = referenceID;
        this.devID = devID;
        this.eventDescription = eventDescription;
        this.bugDescription = bugDescription;
        this.reportDate = reportDate;
    }


    //Create a constructor for obtaining a new bug obj from client.
    public Bug(int devID, String eventDescription, String bugDescription) {
        this.devID = devID;
        this.eventDescription = eventDescription;
        this.bugDescription = bugDescription;
    }

    public Bug(int referenceID, String eventDescription, String bugDescription, String reportDate){
        this.referenceID = referenceID;
        this.eventDescription = eventDescription;
        this.bugDescription = bugDescription;
        this.reportDate = reportDate;
    }
    public Bug( String eventDescription, String bugDescription, String reportDate, int devID){
        this.devID = devID;
        this.eventDescription = eventDescription;
        this.bugDescription = bugDescription;
        this.reportDate = reportDate;
    }
    public Bug(String resolution, String eventDescription, String bugDescription){
        this.resolution = resolution;
        this.eventDescription = eventDescription;
        this.bugDescription = bugDescription;
    }

    public Bug(){

    }


    public int getReferenceID() {
        return referenceID;
    }

    public void setReferenceID(int referenceID) {
        this.referenceID = referenceID;
    }

    public int getDevID() {
        return devID;
    }

    public void setDevID(int devID) {
        this.devID = devID;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public String getBugDescription() {
        return bugDescription;
    }

    public void setBugDescription(String bugDescription) {
        this.bugDescription = bugDescription;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getChangeHistory() {
        return changeHistory;
    }

    public void setChangeHistory(String changeHistory) {
        this.changeHistory = changeHistory;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    @Override
    public String toString() {
        return "Bug{" +
                "referenceID='" + referenceID + '\'' +
                ", devID='" + devID + '\'' +
                ", eventDescription='" + eventDescription + '\'' +
                ", bugDescription='" + bugDescription + '\'' +
                '}';
    }
}





