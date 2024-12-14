package pack.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class DeletePackageController
 */
@WebServlet("/DeletePackageController")
public class DeletePackageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeletePackageController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null) {
            try {
                int packageId = Integer.parseInt(id);

                Connection con = pack.connection.AzureSqlDatabaseConnection.getConnection();

                String sql = "DELETE FROM package WHERE packageId = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, packageId);
                ps.executeUpdate();
                con.close();

            } catch (NumberFormatException e) {
                System.out.println("Error: Invalid package ID format.");
            } catch (SQLException e) {
                System.out.println("Error deleting package: " + e.getMessage());
            }
        } else {
            System.out.println("Error: No package ID provided.");
        }

        // Redirect to index.jsp after deleting
        response.sendRedirect("listPackage.jsp"); 
    }
}
