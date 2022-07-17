package com.example.udonation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginHandler
 */
@WebServlet("/loginHandler")
public class loginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */

    public loginHandler() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
        response.setContentType("text/html");
        String action = request.getParameter("action");
        try {
        	switch (action) {
        	case "login":
        		login(request,response);
    			response.sendRedirect("applicantForm.jsp");
        		break;
        	}
        } catch (SQLException e) {
            throw new ServletException(e);
        }

		}
	

private void login(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {
	String applicantID = request.getParameter("applicantID");
	String password = request.getParameter("password");
	String pass = null;
	String ID = null;
	try(Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/udonation","postgres","syauqi2826");
		PreparedStatement ps = connection.prepareStatement("select password from applicant where applicantID = ?")){
		ps.setString(1, applicantID);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			 pass = rs.getString("password");
			 ID = rs.getString("applicantID");
		}
		
		if(pass.equalsIgnoreCase(password)) {

		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
}
}

		




