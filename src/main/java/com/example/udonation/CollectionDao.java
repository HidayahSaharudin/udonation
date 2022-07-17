package com.example.udonation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

public class CollectionDao {
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

    public void insertCollection (Collection collection) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement preparedStatement = con.prepareStatement
                     ("INSERT INTO COLLECTION"+"(collectionID,collectionDate,collectionTime,collectionDetails,applicantID,committeeID) VALUES"+"(nextval('applicationid_seq'),?,?,?,?,?);"))
        {
            preparedStatement.setDate(1, collection.getCollectionDate());
            preparedStatement.setTime(2, collection.getCollectionTime());
            preparedStatement.setString(3, collection.getCollectionDetails());
            preparedStatement.setString(4, collection.getApplicantID());
            preparedStatement.setString(5, collection.getCommitteeID());
            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
