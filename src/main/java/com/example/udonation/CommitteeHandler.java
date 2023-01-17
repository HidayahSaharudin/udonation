package com.example.udonation;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class CommitteeHandler
 */
@WebServlet("/CommitteeHandler")
public class CommitteeHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommitteeDao cd;
    public void init() {
        cd = new CommitteeDao();
    }
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommitteeHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String action = request.getParameter("action");

	        try {
	            switch (action) {
	                case "logoutCommittee":
	                    logout(request, response);
	                    break;
	            }
	        } 
	        
	        catch (SQLException e) {
	            throw new ServletException(e);
	        }
		
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response)
          throws SQLException, IOException {
		  HttpSession session = request.getSession();
	        session.removeAttribute("committeeID");
	        session.removeAttribute("committeeName");
	        session.invalidate();
	        response.sendRedirect("Index.jsp");
	}
    
	/**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        String action = request.getParameter("action");
        try {
            switch (action) {
            	case "createCommittee":
            		createCommittee(request,response);
                    break;
                case "updateCommittee":
                    updateCommittee(request,response);
                    break;
                case "deleteCommittee":
                    deleteCommittee(request,response);
                    break;
                case "loginCommittee":
                	loginCommittee(request, response);
                	break;
            }
        }
        
        catch (SQLException e) {
            throw new ServletException(e);
        }
	}
	
    private void createCommittee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
    	String committeeID = request.getParameter("committeeID");
    	String committeeName = request.getParameter("committeeName");
    	String committeePhoneNumber = request.getParameter("committeePhoneNumber");
    	String committeeEmail = request.getParameter("committeeEmail");
    	String committeeAddress = request.getParameter("committeeAddress");
    	String committeeCity = request.getParameter("committeeCity");
    	int committeePostcode = Integer.parseInt(request.getParameter("committeePostcode"));
    	String committeeState = request.getParameter("committeeState");
    	String committeePassword = request.getParameter("committeePassword");
        
        Committee com = new Committee();
        
        com.setCommitteeID(committeeID);
        com.setCommitteeName(committeeName);
        com.setCommitteePhoneNumber(committeePhoneNumber);
        com.setCommitteeEmail(committeeEmail);
        com.setCommitteeAddress(committeeAddress);
        com.setCommitteeCity(committeeCity);
        com.setCommitteePostcode(committeePostcode);
        com.setCommitteeState(committeeState);
        com.setCommitteePassword(committeePassword);

        cd.createCommittee(com);
        response.sendRedirect("committeeLogin.jsp");
    }
    
    private void updateCommittee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
    	//HttpSession session = request.getSession();
    	String committeeID = request.getParameter("committeeID");
    	String committeeName = request.getParameter("committeeName");
    	String committeePhoneNumber = request.getParameter("committeePhoneNumber");
    	String committeeEmail = request.getParameter("committeeEmail");
    	String committeeAddress = request.getParameter("committeeAddress");
    	String committeeCity = request.getParameter("committeeCity");
    	int committeePostcode = Integer.parseInt(request.getParameter("committeePostcode"));
    	String committeeState = request.getParameter("committeeState");
    	String committeePassword = request.getParameter("committeePassword");

        Committee com = new Committee();
        
        com.setCommitteeID(committeeID);
        com.setCommitteeName(committeeName);
        com.setCommitteePhoneNumber(committeePhoneNumber);
        com.setCommitteeEmail(committeeEmail);
        com.setCommitteeAddress(committeeAddress);
        com.setCommitteeCity(committeeCity);
        com.setCommitteePostcode(committeePostcode);
        com.setCommitteeState(committeeState);
        com.setCommitteePassword(committeePassword);
        
        cd.updateCommittee(com);
        
        response.sendRedirect("committeeAccount.jsp");
    }

	private void deleteCommittee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
    	//String committeeID=(String)session.getAttribute("committeeID"); 
        String committeeID = request.getParameter("committeeID");
        cd.deleteCommittee(committeeID);
        response.sendRedirect("index.jsp");
    }
    
    public void loginCommittee(HttpServletRequest request, HttpServletResponse response)
    		throws SQLException, IOException {
    	
    	HttpSession session = request.getSession();
    	response.setContentType("text/html");
    	StringWriter sWriter = new StringWriter();
    	PrintWriter out = new PrintWriter(sWriter);
    	
    	String username = request.getParameter("committeeID");
    	String password = request.getParameter("committeePassword"); 
    	
	    Connection con = null;
    	try {
    		Class.forName("org.postgresql.Driver");
    	    String dbURL = "jdbc:postgresql://localhost:5432/udonation";
    	    String user = "postgres";
    	    String pass = "syauqi2826";
    	    con = DriverManager.getConnection(dbURL,user, pass);
    	    
    	    String sql ="SELECT * From committee";
    	    Statement stmt=con.createStatement();
    	    ResultSet res=stmt.executeQuery(sql);
                
                while (res.next()){
                    if(username.equals(res.getString("committeeID")) && password.equals(res.getString("committeePassword")))
                    {
                        Committee com = new Committee();
                        
                        com.setCommitteeID(res.getString(1));
                        com.setCommitteeName(res.getString(2));
                        com.setCommitteePhoneNumber(res.getString(3));
                        com.setCommitteeEmail(res.getString(4));
                        com.setCommitteeAddress(res.getString(5));
                        com.setCommitteeCity(res.getString(6));
                        com.setCommitteePostcode(res.getInt(7));
                        com.setCommitteeState(res.getString(8));
                        com.setCommitteePassword(res.getString(9));

                        session.setAttribute("committeeID",com.getCommitteeID());
    		         	session.setAttribute("committeeName",com.getCommitteeName());
    		         	session.setAttribute("committteePhoneNumber",com.getCommitteePhoneNumber());
    		         	session.setAttribute("committeeEmail",com.getCommitteeEmail());
    		         	session.setAttribute("committeeAddress",com.getCommitteeAddress());
    		         	session.setAttribute("committeeCity",com.getCommitteeCity());
    		         	session.setAttribute("committeePostcode",com.getCommitteePostcode());
    		         	session.setAttribute("committeeState",com.getCommitteeState());
    		         	session.setAttribute("committeePassword",com.getCommitteePassword());
         	     
                        response.sendRedirect("committeeAccount.jsp");
                    }
                    else{}
                }out.print("Kata Laluan / No Kad Pengenalan tidak sah");
    	}
    	catch (Exception e){
    		e.printStackTrace();
       }
    }
}