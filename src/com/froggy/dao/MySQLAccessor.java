package com.froggy.dao;

import com.froggy.Bug;
import com.froggy.User;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLAccessor {
    private DataSource dataSource;
    public MySQLAccessor(DataSource dataSource){this.dataSource = dataSource;}

    protected void close(Connection conn, Statement stmnt, ResultSet rs) {
        try{
            if(rs != null){
                rs.close();
            }
            if(conn != null){
                conn.close(); //Does not actually close connection, it just adds connection back to pool.
            }
            if(stmnt != null){
                stmnt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //connectors for remote apis here
}
