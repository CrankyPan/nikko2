package pack.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import pack.connection.AzureSqlDatabaseConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 * Servlet implementation class AddPackageController
 */
public class AddPackageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	int packageId;
	String packageName;
	double packagePrice;
	
    public AddPackageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
            double packagePrice = Double.parseDouble("packagePriceStr");
            
		
            
             try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		  Connection con = AzureSqlDatabaseConnection.getConnection();
		  String sql = "INSERT INTO package (packageName, packagePrice) VALUES (?, ?)";
            	 PreparedStatement ps = con.prepareStatement(sql);
                 ps.setString(1, packageName);
                 ps.setDouble(2, packagePrice);
                 ps.executeUpdate();
                
                 con.close();    

        } catch (Exception e) {
            System.out.println(e);
        }

        RequestDispatcher req = request.getRequestDispatcher("index.jsp");
        req.forward(request, response);
    }

}
