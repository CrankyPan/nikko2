<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Spectacles</title>
<link rel="stylesheet" href="IndexPackageStyle.css">
</head>
<body>
<header>
	  <nav>
	    <ul class="menu">
	      <li><a href="index.jsp">Home</a></li>
	      <li><a href="addPackage.jsp">Create</a></li>
	      <li><a href="package.jsp">Products</a></li>
	    </ul>
	  </nav>
</header>

  <main>
    <section>
      <h2>All Products</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th colspan="3">Actions</th>
          </tr>
        </thead>
        <tbody>
          
          <% try {
        	  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  			Connection con = DriverManager.getConnection("jdbc:sqlserver://nikkospace.database.windows.net:1433;database=haiya;user=nikko@nikkospace;password=Muhammadyazid01!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
  			
  			Statement stmt = con.createStatement();
  			String sql = "SELECT * FROM package ORDER BY packageid";
  			
  			ResultSet rs = stmt.executeQuery(sql);
  			while(rs.next()) {
  				out.println("<tr>");
  				out.println("<td>" + rs.getInt(1) + "</td>");
  				out.println("<td>" + rs.getString(2) + "</td>");
  				out.println("<td>" + rs.getDouble(3) + "</td>");
  				out.print("<td> <a href=\"viewPackage.jsp?id=" + rs.getInt(1) + "\"> View </a> </td>");
  				out.print("<td> <a href=\"updatePackage.jsp?id=" + rs.getInt(1) + "\"> Update </a> </td>");
  				out.print("<td> <a href=\"delete.jsp?id=" + rs.getInt(1) + "\"> Delete </a> </td>");
  				out.println("</tr>");
  			}
  			con.close();
  		}
  		catch (Exception e){
  			System.out.println(e);
  		} %>
          
        </tbody>
      </table>
    </section>
  </main>

  <footer>
    <p>&copy; 2024  Management System</p>
  </footer>
</body>
</html>
