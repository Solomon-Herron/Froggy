package com.froggy;
//TODO: for login functionality, you will need to include parameters for userName and password;
public class User {
    private int devID;
    private String firstName;
    private String lastName;
    private String email;
    private String userName;
    private String password;

    public User(int devID, String firstName, String lastName, String email) {
        this.devID = devID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }
    public User(String firstName, String lastName, String email, String userName, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userName = userName;
        this.password = password;
    }

    public User(int devID, String userName, String password) {
        this.devID = devID;
        this.userName = userName;
        this.password = password;
    }

    public int getDevID() {
        return devID;
    }

    public void setDevId(Integer devID) {
        this.devID = devID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "userName='" + userName + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}