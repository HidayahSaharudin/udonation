package com.example.udonation;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.util.ArrayList; 
//import java.util.List;
//import java.sql.*;

import static java.lang.System.out;

public class ApplicantDao {
    private final String dbURL = "jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0";
    private final String user = "hlcietwdsgkwyq";
    private final String pass = "f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1";

    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;

    }
    public void createApplicant (Applicant applicant) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("INSERT INTO APPLICANT(applicantID,applicantName,applicantPhoneNumber,applicantEmail,applicantAddress,"
                     		+ "applicantCity,applicantPostcode,applicantState,applicantEmploymentType, applicantPassword)VALUES(?,?,?,?,?,?,?,?,?,?)"))
        {
            preparedStatement.setString(1, applicant.getApplicantID());
            preparedStatement.setString(2, applicant.getApplicantName());
            preparedStatement.setString(3, applicant.getApplicantPhoneNumber());
            preparedStatement.setString(4, applicant.getApplicantEmail());
            preparedStatement.setString(5, applicant.getApplicantAddress());
            preparedStatement.setString(6, applicant.getApplicantCity());
            preparedStatement.setInt(7, applicant.getApplicantPostcode());
            preparedStatement.setString(8, applicant.getApplicantState());
            preparedStatement.setString(9, applicant.getApplicantEmploymentType());
            preparedStatement.setString(10, applicant.getApplicantPassword());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    //delete Applicant
    public boolean deleteApplicant(String applicantID) throws SQLException{
    	
        boolean rowDeleted;
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("delete from applicant where applicantID = ?");)
        {
            statement.setString(1, applicantID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }


    //update Applicant
    public boolean updateApplicant(Applicant applicant) throws SQLException{
    	
    	boolean rowUpdated = true;
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement
                    ("UPDATE applicant set applicantName=?,applicantPhoneNumber=?,applicantEmail=?,applicantAddress=?,applicantCity=?,applicantPostcode=?, applicantState=?, applicantEmploymentType=?  WHERE applicantID = ?"))
        {
            statement.setString(1, applicant.getApplicantName());
            statement.setString(2, applicant.getApplicantPhoneNumber());
            statement.setString(3, applicant.getApplicantEmail());
            statement.setString(4, applicant.getApplicantAddress());
            statement.setString(5, applicant.getApplicantCity());
            statement.setInt(6, applicant.getApplicantPostcode());
            statement.setString(7, applicant.getApplicantState());
            statement.setString(8, applicant.getApplicantEmploymentType());
            statement.setString(9, applicant.getApplicantID());
            
            //statement.executeUpdate() ;
            rowUpdated = statement.executeUpdate() > 0;    
        }

        catch (Exception e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}