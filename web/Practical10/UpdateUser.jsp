<%--
    Document   : UpdateUser
    Created on : Apr 24, 2022, 11:15:21 AM
    Author     : Bhavin Vasara
--%>

<%@page import="Practical10.model.UserModel"%>
<%@page import="Practical10.contoller.UserController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
    </head>
    <body>
        <%
	    if (request.getParameter("id") != null && request.getParameter("update") == null) {
		int id = Integer.parseInt(request.getParameter("id"));
		UserController controller = new UserController();
		UserModel user = controller.getUserById(id);
	%>
	<form method="post" action="UpdateUser.jsp">
	    Enrollment: <input name="enrollment" value="<%=user.getEnrollment()%>"><br>
	    First Name: <input name="fname" value="<%=user.getFname()%>"><br>
	    Last Name: <input name="lname" value="<%=user.getLname()%>"><br>
	    Semester: <input name="sem" value="<%=user.getSem()%>"><br>
	    Mobile No.: <input name="mobile" value="<%=user.getMobile()%>"><br>
	    <input type="hidden" name="id" value="<%=user.getId()%>">
	    <input type="submit" name="update" value="Update">
	</form>



	<% } else if (request.getParameter("update") != null) {
		UserModel user = new UserModel();
		user.setEnrollment(Long.parseLong(request.getParameter("enrollment")));
		user.setFname(request.getParameter("fname"));
		user.setLname(request.getParameter("lname"));
		user.setSem(Integer.parseInt(request.getParameter("sem")));
		user.setMobile(Long.parseLong(request.getParameter("mobile")));
		user.setId(Integer.parseInt(request.getParameter("id")));

		UserController controller = new UserController();

		if (controller.updateUser(user)) {
		    out.println("User updated successfully!");
		    out.println("<br><a href='SearchModifyDelete.jsp'>Back</a>");
		} else {
		    out.println("Could not update user!");
		}
	    }
	%>

    </body>
</html>
