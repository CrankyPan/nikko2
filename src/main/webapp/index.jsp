<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ page import="pack.connection.AzureSqlDatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="pack.model.Package" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Package Page</title>
<link rel="stylesheet" href="IndexPackageStyle.css">
</head>
<body>
<div class="container">
    <h1>Package List</h1>
    <table border="1">
      <tr>
        <th>Package Id</th>
        <th>Package Name</th>
        <th>Package Price</th>
        <th colspan="3">Action</th>
      </tr>

      <%
        try {
          Connection con = AzureSqlDatabaseConnection.getConnection();
          String sql = "SELECT * FROM package ORDER BY packageID";
          Statement stmt = con.createStatement();
	  ResultSet rs = stmt.executeQuery(sql);

          while (rs.next()) { 
      %>
      <tr>
        <td><%= rs.getInt("packageID") %></td>
        <td><%= rs.getString("packageName") %></td>
        <td><%= rs.getDouble("packagePrice") %></td>
        <td><a class="btn btn-info" href="ViewPackageController?id=<%= rs.getInt("packageID") %>">View</a></td>
        <td><a class="btn btn-primary" href="UpdatePackageController?id=<%= rs.getInt("packageID") %>">Update</a></td>
        <td><button class=deleteBtn id="<%= rs.getInt("packageID") %>" onclick="confirmation(this.id)">Delete</button></td> 
      </tr>
      <% 
          }

          rs.close();
          con.close();

        } catch (Exception e) {
          e.printStackTrace();
        }
      %>

    </table>
    </div>
	<script>
	function confirmation(packageID){					  		 
		  console.log(packageID);
		  var r = confirm("Are you sure you want to delete?");
		  if (r == true) {				 		  
			  location.href = 'DeletePackageController?id=' + packageID;
			  alert("Selected package successfully deleted");			
		  } else {				  
		      return false;	
		  }
	}
	</script>
</body>
</html>
