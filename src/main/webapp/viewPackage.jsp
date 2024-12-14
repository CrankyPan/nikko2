<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Package View</title>
  <link rel="stylesheet" href="IndexPackageStyle.css"> 
</head>
<body>

<header>
  </header>

<main>
  <div class="container">
    <h1>View Package</h1>

    <%-- Display the package name and price if they are available --%>
    <% if (request.getAttribute("packageName") != null && request.getAttribute("packagePrice") != null) { %>
      <p>Package Name: <%= request.getAttribute("packageName") %></p> 
      <p>Package Price: <%= request.getAttribute("packagePrice") %></p> 
    <% } else { %>
      <p>No package found.</p> 
    <% } %>

  </div>
</main>

</body>
</html>
