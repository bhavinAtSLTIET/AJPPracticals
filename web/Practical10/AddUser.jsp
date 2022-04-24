<%--
    Document   : UserController
    Created on : Apr 21, 2022, 5:36:38 PM
    Author     : Bhavin Vasara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Practical10.model.UserModel" %>
<%@page import="Practical10.contoller.UserController" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>
    <body>
        <%
	    if (request.getParameter("submit") != null) {
		UserModel user = new UserModel();
		user.setEnrollment(Long.parseLong(request.getParameter("entrollment")));
		user.setFname(request.getParameter("Fname"));
		user.setLname(request.getParameter("Lname"));
		user.setSem(Integer.parseInt(request.getParameter("sem")));
		user.setMobile(Long.parseLong(request.getParameter("mobile")));

		UserController userConroller = new UserController();
		if (userConroller.addUserToDB(user)) {
		    out.println("Registration Successful!");
		} else {
		    out.println("Could not Register!");
		}

	    } else {
		response.sendRedirect("Practical10/RegisterStudents.jsp");
	    }
	%>
	<a href="SearchModifyDelete.jsp">Show Users</a>
    </body>
</html>
