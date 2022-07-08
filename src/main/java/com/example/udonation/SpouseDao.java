package com.example.udonation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.sql.*;

import static java.lang.System.out;
public class SpouseDao {
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

    //insert Spouse
    public void insertSpouse (Spouse spouse) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("INSERT INTO SPOUSE"+"(spouseID,spouseName,spousePhoneNumber,spouseOccupation,spouseSalary,applicantID) VALUES"+"(?,?,?,?,?,?);"))
        {
            preparedStatement.setString(1, spouse.getSpouseID());
            preparedStatement.setString(2, spouse.getSpouseName());
            preparedStatement.setString(3, spouse.getSpousePhoneNumber());
            preparedStatement.setString(4, spouse.getSpouseOccupation());
            preparedStatement.setDouble(5, spouse.getSpouseSalary());
            preparedStatement.setString(6, spouse.getApplicantID());

            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    //delete Spouse
    public boolean deleteSpouse(String id) throws SQLException{
        boolean rowDeleted;
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("delete from spouse where applicantID = ?;");){
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

}
