package com.example.udonation;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
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
                case "create":
                    createApplicant(request,response);
                    createSpouse(request,response);
                    createDependent(request,response);
                    break;
                case "update":
                    //nak delete parent kene delete child dulu
                    updateSpouse(request,response);
                    updateDependent(request,response);
                    updateApplicant(request,response);
                    break;

                case "delete":
                    //nak delete parent kene delete child dulu
                    deleteSpouse(request,response);
                    deleteDependent(request,response);
                    deleteApplicant(request,response);
                    break;

             //delete child sahaja
			case "updateSpouse":
				updateSpouse(request,response);
				break;
			case "updateDependent":
				updateDependent(request,response);
				break;
			case "deleteSpouse":
				deleteSpouse(request,response);
				break;
			case "deleteDependent":
				deleteDependent(request,response);
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
        Applicant applicant;
        if(applicantEmploymentType.equals("Student"))
        {
            String studentLevel = request.getParameter("studentLevel");
            String studentInstitution = request.getParameter("studentInstitution");
            applicant = new Student(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,studentLevel,studentInstitution);
            studentDao.insertStudent((Student) applicant);
        }
        else if(applicantEmploymentType.equals("Employee"))
        {
            String employeeOccupation = request.getParameter("employeeOccupation");
            Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
            applicant = new Employee(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,employeeOccupation,employeeSalary);
            employeeDao.insertEmployee((Employee) applicant);
        }

        applicant = new Applicant(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType);
        applicantDao.insertApplicant(applicant);

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
        Applicant applicant;
        if(applicantEmploymentType.equals("Student"))
        {
            String studentLevel = request.getParameter("studentLevel");
            String studentInstitution = request.getParameter("studentInstitution");
            applicant = new Student(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,studentLevel,studentInstitution);
            studentDao.updateStudent((Student) applicant);
        }
        else if(applicantEmploymentType.equals("Employee"))
        {
            String employeeOccupation = request.getParameter("employeeOccupation");
            Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
            applicant = new Employee(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType,employeeOccupation,employeeSalary);
            employeeDao.updateEmployee((Employee) applicant);
        }
        else {
            applicant = new Applicant(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,applicantCity,applicantPostcode,applicantState,applicantEmploymentType);
            applicantDao.updateApplicant(applicant);
        }
        response.sendRedirect("ApplicantDetails.jsp");
        //set null dekat child table, which are spouse dan dependent
    }

    private void deleteApplicant(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
    {
        String applicantID =request.getParameter("applicantID");
        String applicantEmploymentType =request.getParameter("applicantEmploymentType");
        if(applicantEmploymentType.equals("Student"))
            studentDao.deleteStudent(applicantID);
        else if(applicantEmploymentType.equals("Employee"))
            employeeDao.deleteEmployee(applicantID);
        else
            applicantDao.deleteApplicant(applicantID);

        response.sendRedirect("MainMenu.jsp");
        //set null dekat child table, which are spouse dan dependent
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
    }

    private void updateSpouse(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {
        String spouseID = request.getParameter("spouseID");
        String spouseName = request.getParameter("spouseName");
        String spousePhoneNumber = request.getParameter("spousePhoneNumber");
        String spouseOccupation = request.getParameter("spouseOccupation");
        Double spouseSalary = Double.parseDouble(request.getParameter("spouseSalary"));
        String applicantID = request.getParameter("applicantID");

        String existingID = request.getParameter("existingID");
        Spouse spouse = new Spouse(spouseID,spouseName,spousePhoneNumber,spouseOccupation,spouseSalary,applicantID);
        spouseDao.updateSpouse(spouse,existingID);
    }
    private void deleteSpouse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
    {
        String spouseID = request.getParameter("spouseID");
        spouseDao.deleteSpouse(spouseID);

    }
    private void createDependent(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {

        String dependentID = request.getParameter("dependentID");
        String dependentName = request.getParameter("dependentName");
        String dependentRelationship = request.getParameter("dependentRelationship");
        String applicantID = request.getParameter("applicantID");

        Dependent dependent = new Dependent(dependentID,dependentName,dependentRelationship,applicantID);
        dependentDao.insertDependent(dependent);
        response.sendRedirect("ApplicantDetails.jsp");
    }

    private void updateDependent(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {

        String dependentID = request.getParameter("dependentID");
        String dependentName = request.getParameter("dependentName");
        String dependentRelationship = request.getParameter("dependentRelationship");
        String applicantID = request.getParameter("applicantID");

        String existingID = request.getParameter("existingID");
        Dependent dependent = new Dependent(dependentID,dependentName,dependentRelationship,applicantID);
        dependentDao.updateDependent(dependent,existingID);
    }
    private void deleteDependent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
    {
        String dependentID =request.getParameter("dependentID");
        dependentDao.deleteDependent(dependentID);
    }
}
