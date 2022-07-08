package com.example.udonation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

public class CollectionDao {
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
