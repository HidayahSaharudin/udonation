package com.example.udonation;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SpeakerServlet
 */
@WebServlet("/ApplicantHandler")
public class ApplicantHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ApplicantDao applicantDao;
    private StudentDao studentDao;
    private EmployeeDao employeeDao;
    private SpouseDao spouseDao;
    private DependentDao dependentDao;

    public void init() {
        applicantDao = new ApplicantDao();
        studentDao = new StudentDao();
        employeeDao = new EmployeeDao();
        spouseDao = new SpouseDao();
        dependentDao = new DependentDao();
    }

    public ApplicantHandler() {
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
	                case "logoutApplicant":
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
  	        session.removeAttribute("applicantID");
  	        session.removeAttribute("applicantName");
  	        session.invalidate();
  	        response.sendRedirect("index.jsp");
  	}

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html");
        String action = request.getParameter("action");
        try {
            switch (action) {
            case "createApplicant":
                createApplicant(request,response);
                break;
            case "createSpouse":
                createSpouse(request,response);
                break;
            case "createDependent":
                createDependent(request,response);
                break;
                
            case "updateApplicant":
                updateApplicant(request,response);
                break;
                
            case "deleteApplicant":
                deleteApplicant(request,response);
                break;
            case "deleteSpouse":
                 deleteSpouse(request,response);
                 break;
            case "deleteDependent":
                 deleteDependent(request,response);
                 break;
                 
            case "loginApplicant":
            	loginApplicant(request, response);
            	break;
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }
    private void createApplicant(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {

        String applicantID = request.getParameter("applicantID");
        String applicantName = request.getParameter("applicantName");
        String applicantPhoneNumber = request.getParameter("applicantPhoneNumber");
        String applicantEmail = request.getParameter("applicantEmail");
        String applicantAddress = request.getParameter("applicantAddress");
        String applicantCity = request.getParameter("applicantCity");
        int applicantPostcode = Integer.parseInt(request.getParameter("applicantPostcode"));
        String applicantState = request.getParameter("applicantState");
        String applicantEmploymentType = request.getParameter("applicantEmploymentType");
        String applicantPassword = request.getParameter("applicantPassword");
        Applicant applicant = new Applicant();
        if(applicantEmploymentType.equalsIgnoreCase("Pelajar"))
        {
            String studentLevel = request.getParameter("studentLevel");
            String studentInstitution = request.getParameter("studentInstitution");
            applicant = new Student(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,applicantPassword,studentLevel,studentInstitution);
            studentDao.createStudent((Student) applicant);
        }
        else if(applicantEmploymentType.equalsIgnoreCase("Pekerja"))
        {
            String employeeOccupation = request.getParameter("employeeOccupation");
            Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
            applicant = new Employee(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,applicantPassword,employeeOccupation,employeeSalary);
            employeeDao.createEmployee((Employee) applicant);
        }
        else if(applicantEmploymentType.equalsIgnoreCase("Tidak Bekerja")){
            applicant = new Applicant(applicantID, applicantName, applicantPhoneNumber, applicantEmail, applicantAddress, applicantCity, applicantPostcode, applicantState, applicantEmploymentType,applicantPassword);
            applicantDao.createApplicant(applicant);
        }
        response.sendRedirect("applicantLogin.jsp");
    }
    
    private void updateApplicant(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {

        String applicantID = request.getParameter("applicantID");
        String applicantName = request.getParameter("applicantName");
        String applicantPhoneNumber = request.getParameter("applicantPhoneNumber");
        String applicantEmail = request.getParameter("applicantEmail");
        String applicantAddress = request.getParameter("applicantAddress");
        String applicantCity = request.getParameter("applicantCity");
        int applicantPostcode = Integer.parseInt(request.getParameter("applicantPostcode"));
        String applicantState = request.getParameter("applicantState");
        String applicantEmploymentType = request.getParameter("applicantEmploymentType");
        String applicantPassword = request.getParameter("applicantPassword");
        Applicant applicant;
        if(applicantEmploymentType.equals("Pelajar"))
        {
            String studentLevel = request.getParameter("studentLevel");
            String studentInstitution = request.getParameter("studentInstitution");
            applicant = new Student(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,applicantPassword,studentLevel,studentInstitution);
            studentDao.updateStudent((Student) applicant);
        }
        else if(applicantEmploymentType.equals("Pekerja"))
        {
            String employeeOccupation = request.getParameter("employeeOccupation");
            Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
            applicant = new Employee(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,applicantPassword,employeeOccupation,employeeSalary);
            employeeDao.updateEmployee((Employee) applicant);
        }
        else {
            applicant = new Applicant(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,applicantPassword);
            applicantDao.updateApplicant(applicant);
        }
        response.sendRedirect("applicantAccount.jsp");
        //set null dekat child table, which are spouse dan dependent
    }

    private void deleteApplicant(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
    {
        String applicantID =request.getParameter("applicantID");
        applicantDao.deleteApplicant(applicantID);
        response.sendRedirect("index.jsp");
    }

    private void createSpouse(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {

        String spouseID = request.getParameter("spouseID");
        String spouseName = request.getParameter("spouseName");
        String spousePhoneNumber = request.getParameter("spousePhoneNumber");
        String spouseOccupation = request.getParameter("spouseOccupation");
        Double spouseSalary = Double.parseDouble(request.getParameter("spouseSalary"));
        String applicantID = request.getParameter("applicantID");

        Spouse spouse = new Spouse(spouseID,spouseName,spousePhoneNumber,spouseOccupation,spouseSalary,applicantID);
        spouseDao.insertSpouse(spouse);
        response.sendRedirect("spouse.jsp");
    }

    private void deleteSpouse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
    {
        String applicantID = request.getParameter("applicantID");
        spouseDao.deleteSpouse(applicantID);
        response.sendRedirect("otherInfoApplicantDetails.jsp");
    }

    private void createDependent(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {

            String dependentID = request.getParameter("dependentID");
            String dependentName = request.getParameter("dependentName");
            String dependentRelationship = request.getParameter("dependentRelationship");
            String applicantID = request.getParameter("applicantID");
            
            Dependent dependent = new Dependent(dependentID,dependentName,dependentRelationship,applicantID);
            dependentDao.insertDependent(dependent);
            response.sendRedirect("dependent.jsp");
    }

    private void deleteDependent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
    {
        String dependentID =request.getParameter("dependentID");
        dependentDao.deleteDependent(dependentID);
        response.sendRedirect("dependent.jsp");
    }
    public void loginApplicant(HttpServletRequest request, HttpServletResponse response)
    		throws SQLException, IOException {
    	
    	HttpSession session = request.getSession();
    	response.setContentType("text/html");
    	StringWriter sWriter = new StringWriter();
    	PrintWriter out = new PrintWriter(sWriter);
    	
    	String username = request.getParameter("applicantID");
    	String password = request.getParameter("applicantPassword"); 
    	
	    Connection con = null;
    	try {
    		Class.forName("org.postgresql.Driver");
    	    String dbURL = "jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0";
    	    String user = "hlcietwdsgkwyq";
    	    String pass = "f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1";
    	    con = DriverManager.getConnection(dbURL,user, pass);
    	    
    	    String sql ="SELECT * From applicant";
    	    Statement stmt=con.createStatement();
    	    ResultSet res=stmt.executeQuery(sql);
                
                while (res.next()){
                    if(username.equals(res.getString("applicantID")) && password.equals(res.getString("applicantPassword")))
                    {
                        Applicant app = new Applicant();
                        
                        app.setApplicantID(res.getString(1));
                        app.setApplicantName(res.getString(2));
                        app.setApplicantPhoneNumber(res.getString(3));
                        app.setApplicantEmail(res.getString(4));
                        app.setApplicantAddress(res.getString(5));
                        app.setApplicantCity(res.getString(6));
                        app.setApplicantPostcode(res.getInt(7));
                        app.setApplicantState(res.getString(8));
                        app.setApplicantEmploymentType(res.getString(9));
                        app.setApplicantPassword(res.getString(10));

                        session.setAttribute("applicantID",app.getApplicantID());
    		         	session.setAttribute("applicantName",app.getApplicantName());
    		         	session.setAttribute("applicantPhoneNumber",app.getApplicantPhoneNumber());
    		         	session.setAttribute("applicantEmail",app.getApplicantEmail());
    		         	session.setAttribute("applicantAddress",app.getApplicantAddress());
    		         	session.setAttribute("applicantCity",app.getApplicantCity());
    		         	session.setAttribute("applicantPostcode",app.getApplicantPostcode());
    		         	session.setAttribute("applicantState",app.getApplicantState());
    		         	session.setAttribute("applicantEmploymentType",app.getApplicantState());
    		         	session.setAttribute("applicantPassword",app.getApplicantPassword());
         	     
                        response.sendRedirect("applicantAccount.jsp");
                    }
                    else{}
                }out.print("Kata Laluan / No Kad Pengenalan tidak sah");
    	}
    	catch (Exception e){
    		e.printStackTrace();
       }
    }
}


