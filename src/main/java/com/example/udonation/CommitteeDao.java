package com.example.udonation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.sql.*;

import static java.lang.System.out;

public class CommitteeDao {
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
    //insert Committee
    public void insertCommittee (Committee committee) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("INSERT INTO COMMITTEE"+"(committeeID,committeeName,committeePhoneNumber,committeeEmail,committeeAddress,committeeCity,committeePostcode,committeeState) VALUES"+"(?,?,?,?,?,?,?,?);"))
        {
            preparedStatement.setString(1, committee.getCommitteeID());
            preparedStatement.setString(2, committee.getCommitteeName());
            preparedStatement.setString(3, committee.getCommitteePhoneNumber());
            preparedStatement.setString(4, committee.getCommitteeEmail());
            preparedStatement.setString(5, committee.getCommitteeAddress());
            preparedStatement.setString(6, committee.getCommitteeCity());
            preparedStatement.setInt(7, committee.getCommitteePostcode());
            preparedStatement.setString(8, committee.getCommitteeState());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    //delete Committee
    public boolean deleteCommittee(String id) throws SQLException{
        boolean rowDeleted;
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("delete from committee where committeeID = ?;")){
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //update Committee
    public void updateCommittee(Committee committee) throws SQLException{
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement
                    ("update committee set committeeName = ?, committeePhoneNumber = ?, committeeEmail = ?, committeeAddress = ?, committeeCity = ?, committeePostcode = ?, committeeState = ? where committeeID = ?;")){

            statement.setString(1, committee.getCommitteeName());
            statement.setString(2, committee.getCommitteePhoneNumber());
            statement.setString(3, committee.getCommitteeEmail());
            statement.setString(4, committee.getCommitteeAddress());
            statement.setString(5, committee.getCommitteeCity());
            statement.setInt(6, committee.getCommitteePostcode());
            statement.setString(7, committee.getCommitteeState());
            statement.setString(8, committee.getCommitteeID());
            statement.executeUpdate() ;
        }

        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
