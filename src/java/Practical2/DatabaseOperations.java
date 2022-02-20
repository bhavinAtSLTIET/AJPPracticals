package Practical2;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Bhavin Vasara
 */
public class DatabaseOperations {

    Connection con;
    Statement stmt;

    public DatabaseOperations() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/practical", "root", "");
        stmt = con.createStatement();
    }

    public int alterTable() throws SQLException {
        return stmt.executeUpdate("ALTER TABLE users MODIFY fname varchar(51)");
    }

    public int updateData(String id) throws SQLException {
        return stmt.executeUpdate("UPDATE users SET fname = 'modifiedfname' WHERE id = " + id);
    }

    public int deleteData(String id) throws SQLException {
        return stmt.executeUpdate("DELETE FROM users WHERE id =" + id);
    }
}
