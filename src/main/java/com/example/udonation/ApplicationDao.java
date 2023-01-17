package com.example.udonation;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;
//import java.util.ArrayList;
//import java.util.List;
//import java.sql.*;

public class ApplicationDao {
    private final String dbURL = "jdbc:postgresql://localhost:5432/udonation";
    private final String user = "postgres";
    private final String pass = "syauqi2826";

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
    public void insertApplication (Application application) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("INSERT INTO APPLICATION"+"(applicationID,applicationDate,applicationTime,applicationStatus,applicantID,donationID,committeeID) VALUES"+"(nextval('applicationid_seq'),?,?,?,?,?,?);"))
        {
            preparedStatement.setDate(1, application.getApplicationDate());
            preparedStatement.setTime(2, application.getApplicationTime());
            preparedStatement.setString(3, application.getApplicationStatus());
            preparedStatement.setString(4, application.getApplicantID());
            preparedStatement.setInt(5, application.getDonationID());
            preparedStatement.setString(6, application.getCommitteeID());
            out.println(preparedStatement);
            
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //list application based on donationID
    public List<Application> selectList(int donationID) throws SQLException {

    	List<Application> applications = new ArrayList<>();
        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("select * from application where donationID = ?"))
        {
            preparedStatement.setInt(1, donationID);
            out.println(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
            	int applicationID = rs.getInt("applicationID");
            	Date  applicationDate = rs.getDate("applicationDate");
            	Time  applicationTime = rs.getTime("applicationTime");
            	String  applicationStatus = rs.getString("applicationStatus");
            	String  applicantID = rs.getString("applicantID");
            	String  committeeID = rs.getString("committeeID");
            	
            	applications.add(new Application(applicationID,applicationDate,applicationTime,applicationStatus,applicantID,donationID,committeeID));
            	
            }
            
            
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return applications;
    }
    
    public void verifyApplication (Application application) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("update application set applicationStatus = 'Lulus', committeeID = ? where applicationID = ?;"))
        {
            preparedStatement.setString(1, application.getCommitteeID());
            preparedStatement.setInt(2, application.getApplicationID());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void rejectApplication (Application application) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("update application set applicationStatus = 'Gagal', committeeID = ? where applicationID = ?;"))
        {
            preparedStatement.setString(1, application.getCommitteeID());
            preparedStatement.setInt(2, application.getApplicationID());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
