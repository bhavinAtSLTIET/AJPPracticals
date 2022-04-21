<%--
    Document   : RegisterStudents
    Created on : Apr 21, 2022, 4:58:28 PM
    Author     : Bhavin Vasara
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Students</title>
    </head>
    <body>
	<form method="POST" action="/AJPPracticals/AddUser.jsp">
	    Enrollment No.: <input type="number" name="entrollment" required><br>
	    First Name: <input type="text" name="Fname" required><br>
	    Last Name: <input type="text" name="Lname" required><br>
	    Semester: <input type="number" name="sem" required><br>
	    Contact No.: <input type="number" name="mobile" required><br>
	    <input type="submit" name="submit" value="Register">
	</form>
    </body>
</html>
