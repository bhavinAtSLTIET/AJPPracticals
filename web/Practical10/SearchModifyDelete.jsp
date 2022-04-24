<%--
    Document   : SearchModifyDelete
    Created on : Apr 24, 2022, 10:27:21 AM
    Author     : Bhavin Vasara
--%>

<%@page import="java.util.List"%>
<%@page import="Practical10.model.UserModel"%>
<%@page import="Practical10.contoller.UserController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Modify Delete</title>
	<style>
	    td{
		text-align: center;
	    }
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!--Script to search user records-->
	<script>
	    $(document).ready(function () {
		$("#myInput").on("keyup", function () {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function () {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		});
	    });
	</script>
    </head>
    <body>
	<table border="1" cellspacing="3" width="100%">
	    <div>
		Search: <input type="text" id="myInput">
	    </div>
	    <thead>
	    <th>
		Enrollment
	    </th>
	    <th>
		First Name
	    </th>
	    <th>
		Last Name
	    </th>
	    <th>
		Semester
	    </th>
	    <th>
		Mobile No.
	    </th>
	    <th>
		Update
	    </th>
	    <th>
		Delete
	    </th>
	</thead>
	<tbody id="myTable">


	    <%
		UserController controller = new UserController();
		List<UserModel> users = controller.getUsers();
		if (!users.isEmpty()) {
		    for (UserModel user : users) {
			out.println("<tr>");
			out.println("<td>" + user.getEnrollment() + "</td>");
			out.println("<td>" + user.getFname() + "</td>");
			out.println("<td>" + user.getLname() + "</td>");
			out.println("<td>" + user.getSem() + "</td>");
			out.println("<td>" + user.getMobile() + "</td>");
			out.println("<td><a href='UpdateUser.jsp?id=" + user.getId() + "'>Update</a></td>");
			out.println("<td><a href='DeleteUser.jsp?id=" + user.getId() + "'>Delete</a></td>");
			out.println("</tr>");
		    }
		} else {
		    out.println("<tr><td colspan='7'>No user records were found!</td></tr>");
		}
		out.println("<tr><td colspan='7'><a href='RegisterStudents.jsp'>Add User</a> </td></tr>");

	    %>
	</tbody>
    </table>
</body>
</html>
