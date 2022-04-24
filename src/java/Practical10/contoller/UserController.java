/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practical10.contoller;

import Practical10.model.UserModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bhavin Vasara
 */
public class UserController {

    Connection con;

    public UserController() {
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "");

	} catch (ClassNotFoundException | SQLException e) {
	    System.out.println("ERRORLOG: ");
	    System.out.println(e);
	}
    }

    public boolean addUserToDB(UserModel user) {
	try {
	    PreparedStatement stmt = con.prepareStatement("INSERT INTO student_registration(enrollment,fname,lname,sem,mobile) VALUES(?, ?, ?, ?, ?);");
	    stmt.setLong(1, user.getEnrollment());
	    stmt.setString(2, user.getFname());
	    stmt.setString(3, user.getLname());
	    stmt.setInt(4, user.getSem());
	    stmt.setLong(5, user.getMobile());
	    if (stmt.executeUpdate() > 0) {
		return true;
	    }
	    stmt.close();

	} catch (SQLException e) {
	    System.out.println("ERRORLOG: ");
	    System.out.println(e);
	}
	return false;
    }

    public List<UserModel> getUsers() {
	List<UserModel> users = new ArrayList<>();
	try {
	    Statement stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("SELECT * FROM student_registration");
	    while (rs.next()) {
		UserModel user = new UserModel();
		user.setId(rs.getInt("id"));
		user.setEnrollment(rs.getLong("enrollment"));
		user.setFname(rs.getString("fname"));
		user.setLname(rs.getString("lname"));
		user.setSem(rs.getInt("sem"));
		user.setMobile(rs.getLong("mobile"));
		users.add(user);
	    }
	    rs.close();
	    stmt.close();

	} catch (SQLException e) {
	    System.out.println("ERRORLOG: ");
	    System.out.println(e);
	}
	return users;
    }

    public UserModel getUserById(int id) {
	UserModel user = new UserModel();
	try {
	    PreparedStatement stmt = con.prepareStatement("SELECT * FROM student_registration WHERE id = ?");
	    stmt.setInt(1, id);
	    ResultSet rs = stmt.executeQuery();
	    while (rs.next()) {
		user.setId(rs.getInt("id"));
		user.setEnrollment(rs.getLong("enrollment"));
		user.setFname(rs.getString("fname"));
		user.setLname(rs.getString("lname"));
		user.setSem(rs.getInt("sem"));
		user.setMobile(rs.getLong("mobile"));
	    }
	    stmt.close();
	    return user;

	} catch (SQLException e) {
	    System.out.println("ERRORLOG: ");
	    System.out.println(e);
	}
	return user;
    }

    public boolean updateUser(UserModel user) {
	try {
	    PreparedStatement stmt = con.prepareStatement("UPDATE student_registration SET "
		    + "enrollment = ?, fname = ?, lname = ?, sem = ?, mobile = ? WHERE id = ?");
	    stmt.setLong(1, user.getEnrollment());
	    stmt.setString(2, user.getFname());
	    stmt.setString(3, user.getLname());
	    stmt.setInt(4, user.getSem());
	    stmt.setLong(5, user.getMobile());
	    stmt.setInt(6, user.getId());

	    if (stmt.executeUpdate() == 1) {
		stmt.close();
		return true;
	    }
	    stmt.close();

	} catch (SQLException e) {
	    System.out.println("ERRORLOG: ");
	    System.out.println(e);
	}
	return false;
    }

    public int deleteUser(int id) {
	try {
	    PreparedStatement stmt = con.prepareStatement("DELETE FROM student_registration WHERE id = ?;");
	    stmt.setInt(1, id);
	    int deletedRows = stmt.executeUpdate();
	    stmt.close();
	    return deletedRows;
	} catch (SQLException e) {
	    System.out.println("ERRORLOG: ");
	    System.out.println(e);
	}
	return 0;
    }
}
