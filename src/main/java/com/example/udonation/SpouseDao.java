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
    String dbURL = "jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0";
    String user = "hlcietwdsgkwyq";
    String pass = "f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1";

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
            PreparedStatement statement = con.prepareStatement("delete from spouse where spouseID = ?;");){
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //update Spouse
    public void updateSpouse(Spouse spouse,String id) throws SQLException{
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement
                    ("update spouse set spouseID = ?, spouseName = ?, spousePhoneNumber = ?, spouseOccupation = ?, spouseSalary = ?  where spouseID = ?;")){

            statement.setString(1, spouse.getSpouseID());
            statement.setString(2, spouse.getSpouseName());
            statement.setString(3, spouse.getSpousePhoneNumber());
            statement.setString(4, spouse.getSpouseOccupation());
            statement.setDouble(5, spouse.getSpouseSalary());
            statement.setString(6, id);

            statement.executeUpdate() ;
        }

        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
