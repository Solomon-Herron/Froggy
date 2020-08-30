package com.froggy.dao;

import com.froggy.User;

import javax.sql.DataSource;
import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


//Admin only should have access to this altering Users
public class UserDAO extends MySQLAccessor {
    private DataSource dataSource;

    public UserDAO(DataSource dataSource) {
        super(dataSource);
        this.dataSource = dataSource;
    }

    public List<User> getUsers() throws Exception{
        List<User> users = new ArrayList<>();
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;

        try{
            //Create Connection
            conn = dataSource.getConnection();
            //create SQL statement
            String sql  = "select * from user"; //sql statement
            stmnt = conn.createStatement(); //statement object created for connection
            //execute query
            rs = stmnt.executeQuery(sql);
            //proccess result set
            while (rs.next()){
                //extract data from rs
                int devID = rs.getInt("dev_id");
                String firstName = rs.getString("first_name");
                String  lastName = rs.getString("last_name");
                String email = rs.getString("email");
                //create new student object
                User tempUser = new User(devID, firstName, lastName, email);
                //add student to array list
                users.add(tempUser);
            }
            return users;
        } finally {
            close(conn, stmnt, rs);
        }
    }

    public void addUser(User newUser) {
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;

        //1.)add user to users table
        try{
            //Create Connection
            conn = dataSource.getConnection();
            //create SQL statement
            String sql  = "INSERT INTO user (first_name, last_name, email) VALUES ('" + newUser.getFirstName() + "','" + newUser.getLastName() + "','" + newUser.getEmail() + "');"; //sql statement
            stmnt = conn.createStatement(); //statement object created for connection
            //execute query
            stmnt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, stmnt, rs);
        }

        //2.) add Users credentials to credential table



    }

    public User getUser(String userId) {
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;
        User tempUser = null;
        int userID;

        try {
            userID = Integer.parseInt(userId);
            conn = dataSource.getConnection();
            String sql = "select * from user where id=" + userID + ";";
            stmnt = conn.createStatement();
            rs = stmnt.executeQuery(sql);
            while (rs.next()) {
                //extract data from rs
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                //create new student object
                tempUser = new User(id, firstName, lastName, email);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            close(conn, stmnt, rs);
        }
        return tempUser;
    }




    public void updateUser(User updatedUser, int userId) {
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;

        try{
            //Create Connection
            conn = dataSource.getConnection();
            //create SQL statement
            String sql  = "update user set first_name = '" + updatedUser.getFirstName() +  "', last_name = '" + updatedUser.getLastName() + "', email='" + updatedUser.getEmail() + "' where id=" + userId;
            stmnt = conn.createStatement(); //statement object created for connection
            //execute query
            stmnt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, stmnt, rs);
        }
    }

    public void deleteUser(String userId) {
        Connection conn = null;
        Statement stmnt = null;
        ResultSet rs = null;

        try{
            int userID = Integer.parseInt(userId);
            //Create Connection
            conn = dataSource.getConnection();
            //create SQL statement
            String sql  = "delete from user where id=" + userID;
            stmnt = conn.createStatement(); //statement object created for connection
            //execute query
            stmnt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, stmnt, rs);
        }
    }




}