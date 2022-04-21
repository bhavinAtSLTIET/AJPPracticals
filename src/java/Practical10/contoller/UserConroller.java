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
import java.sql.SQLException;

/**
 *
 * @author Bhavin Vasara
 */
public class UserConroller {

    public boolean addUserToDB(UserModel user) {
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "");
	    PreparedStatement stmt = con.prepareStatement("INSERT INTO student_registration(enrollment,fname,lname,sem,mobile) VALUES(?, ?, ?, ?, ?);");
	    stmt.setLong(1, user.getEnrollment());
	    stmt.setString(2, user.getFname());
	    stmt.setString(3, user.getLname());
	    stmt.setInt(4, user.getSem());
	    stmt.setLong(5, user.getMobile());
	    if (stmt.executeUpdate() > 0) {
		return true;
	    }

	} catch (ClassNotFoundException | SQLException e) {
	    System.out.println("ERRORLOG: ");
	    System.out.println(e);

	}
	return false;
    }
}
