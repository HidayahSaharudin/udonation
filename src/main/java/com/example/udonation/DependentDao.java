package com.example.udonation;
import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;
public class DependentDao {
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
    //insert Dependent
    public void insertDependent(Dependent dependent) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("INSERT INTO DEPENDENT"+"(dependentID,dependentName,dependentRelationship,applicantID) VALUES"+"(?,?,?,?);"))
        {
                preparedStatement.setString(1, (dependent.getDependentID()));
                preparedStatement.setString(2, (dependent.getDependentName()));
                preparedStatement.setString(3, (dependent.getDependentRelationship()));
                preparedStatement.setString(4, (dependent.getApplicantID()));
                out.println(preparedStatement);
                preparedStatement.executeUpdate();

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    //delete Dependent
    public boolean deleteDependent(String dependentID) throws SQLException{
        boolean rowDeleted;
        try(Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("delete from dependent where dependentID = ?;");){
            statement.setString(1, dependentID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

}
