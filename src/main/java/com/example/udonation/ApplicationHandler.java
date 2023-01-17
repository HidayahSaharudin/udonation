package com.example.udonation;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApplicationHandler
 */
@WebServlet("/ApplicationHandler")
public class ApplicationHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ApplicationDao applicationDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init() {
    	applicationDao = new ApplicationDao();
    }
    public ApplicationHandler() {
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
        	switch(action) {
        	
        	      case "createApplication":
        		        createApplication(request,response);
        		      //untuk applicant insert tuple application
                        break;
          	      case "verifyApplication":
          	    	    verifyApplication(request,response);
          	    	//untuk committee update tuple dlm application
          	      case "rejectApplication":
        	    	    rejectApplication(request,response);
        	    	//untuk committee update tuple dlm application 
                        break;
          	      case "selectApplicationList":
          	    	    selectApplicationList(request,response);
      	    	    //untuk select application based on donationID
                        break;
        	}
    	}catch (SQLException e) {
            throw new ServletException(e);
        }	    
	}
	private void createApplication(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException{
		
		String applicantID = request.getParameter("applicantID");
		int donationID = Integer.parseInt(request.getParameter("donationID"));
		Application application = new Application();
		
		application.setApplicantID(applicantID);
		application.setDonationID(donationID);
		
		applicationDao.insertApplication(application);
		response.sendRedirect("applicantApplicationList.jsp");
	}
	
	private void selectApplicationList(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException{
		
		int donationID = Integer.parseInt(request.getParameter("donationID"));
		List<Application> listapplication = applicationDao.selectList(donationID);
		request.setAttribute("listapplication", listapplication);
		response.sendRedirect("committeeApplicationList.jsp");
	}
	
private void verifyApplication(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException{
		
	    int applicationID = Integer.parseInt(request.getParameter("applicationID"));
		String committeeID = request.getParameter("committeeID");
		
		Application application = new Application();
		
		application.setApplicationID(applicationID);
		application.setCommitteeID(committeeID);
		
		applicationDao.verifyApplication(application);
		response.sendRedirect("applicationType.jsp");
	}
private void rejectApplication(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException{
	
    int applicationID = Integer.parseInt(request.getParameter("applicationID"));
	String committeeID = request.getParameter("committeeID");
	
	Application application = new Application();
	
	application.setApplicationID(applicationID);
	application.setCommitteeID(committeeID);
	
	applicationDao.rejectApplication(application);
	response.sendRedirect("applicationType.jsp");
    }

}
