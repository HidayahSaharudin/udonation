package com.example.udonation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
