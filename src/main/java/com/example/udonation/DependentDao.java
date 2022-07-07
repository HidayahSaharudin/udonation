package com.example.udonation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.sql.*;

import static java.lang.System.out;
public class DependentDao {
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
    //insert Dependent
    public void insertDependent(Dependent dependent) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("INSERT INTO DEPENDENT"+"(dependentID,dependentName,dependentRelationship,applicantID) VALUES"+"(?,?,?,?);"))
        {
            preparedStatement.setString(1, dependent.getDependentID());
            preparedStatement.setString(2, dependent.getDependentName());
            preparedStatement.setString(3, dependent.getDependentRelationship());
            preparedStatement.setString(4, dependent.getApplicantID());

            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    //delete Dependent
    public boolean deleteDependent(String id) throws SQLException{
        boolean rowDeleted;
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("delete from dependent where dependentID = ?;");){
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //update Dependent
    public void updateDependent(Dependent dependent,String id) throws SQLException{
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement
                    ("update dependent set dependentID = ?, dependentName = ?, dependentRelationship = ? where dependentID = ?;")){

            statement.setString(1, dependent.getDependentID());
            statement.setString(2, dependent.getDependentName());
            statement.setString(3, dependent.getDependentRelationship());
            statement.setString(4, id);

            statement.executeUpdate() ;
        }

        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
