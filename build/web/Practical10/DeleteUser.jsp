<%--
    Document   : DeleteUser
    Created on : Apr 24, 2022, 11:14:55 AM
    Author     : Bhavin Vasara
--%>

<%@page import="Practical10.contoller.UserController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
    <body>
        <%
	    if (request.getParameter("id") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		UserController controller = new UserController();
		if (controller.deleteUser(id) > 0) {
		    out.println("Deleted user successfully!");
		    out.println("<br><a href='SearchModifyDelete.jsp'>Back</a>");
		} else {
		    out.println("Could not delete user!");
		}
	    } else {
		out.println("id is required!");
	    }
	%>
    </body>
</html>
