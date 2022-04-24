/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practical10.model;

/**
 *
 * @author Bhavin Vasara
 */
public class UserModel {

    private int id;
    private long enrollment;
    private String Fname;
    private String Lname;
    private int sem;
    private long mobile;

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public long getEnrollment() {
	return enrollment;
    }

    public void setEnrollment(long enrollment) {
	this.enrollment = enrollment;
    }

    public String getFname() {
	return Fname;
    }

    public void setFname(String Fname) {
	this.Fname = Fname;
    }

    public String getLname() {
	return Lname;
    }

    public void setLname(String Lname) {
	this.Lname = Lname;
    }

    public int getSem() {
	return sem;
    }

    public void setSem(int sem) {
	this.sem = sem;
    }

    public long getMobile() {
	return mobile;
    }

    public void setMobile(long mobile) {
	this.mobile = mobile;
    }
}
