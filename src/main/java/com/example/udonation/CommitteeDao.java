package com.example.udonation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class CommitteeDao {
    private final String dbURL = "jdbc:postgresql://ec2-3-228-235-79.compute-1.amazonaws.com/ddrev47ip327l0";
    private final String user = "hlcietwdsgkwyq";
    private final String pass = "f6078446e3932c85a4d99b3753e1b04295a6add4a27ee4fdc3649c1efb1a04f1";
    protected Connection getConnection() {
        Connection con = null;
        try {
        	//Load the driver class
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        }
        
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;

    }
    public void createCommittee(Committee com) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("INSERT INTO COMMITTEE(COMMITTEEID,COMMITTEENAME,COMMITTEEPHONENUMBER,COMMITTEEEMAIL,COMMITTEEADDRESS,COMMITTEECITY,COMMITTEEPOSTCODE,COMMITTEESTATE,COMMITTEEPASSWORD) values(?,?,?,?,?,?,?,?,?)"))
        {
            ps.setString(1, com.getCommitteeID());
            ps.setString(2, com.getCommitteeName());
            ps.setString(3, com.getCommitteePhoneNumber());
            ps.setString(4, com.getCommitteeEmail());
            ps.setString(5, com.getCommitteeAddress());
            ps.setString(6, com.getCommitteeCity());
            ps.setInt(7, com.getCommitteePostcode());
            ps.setString(8, com.getCommitteeState());
            ps.setString(9, com.getCommitteePassword());
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean deleteCommittee (String committeeID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM COMMITTEE WHERE COMMITTEEID=?");) {
            statement.setString(1, committeeID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean updateCommittee (Committee com) throws SQLException {
    	
    	boolean rowUpdated = true;
        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("UPDATE committee set committeeName=?,committeePhoneNumber=?,committeeEmail=?,committeeAddress=?,committeeCity=?, committeePostcode=?, committeeState=? WHERE committeeID = ?");)
        {
        	ps.setString(1, com.getCommitteeName());
            ps.setString(2, com.getCommitteePhoneNumber());
            ps.setString(3, com.getCommitteeEmail());
            ps.setString(4, com.getCommitteeAddress());
            ps.setString(5, com.getCommitteeCity());
            ps.setInt(6, com.getCommitteePostcode());
            ps.setString(7, com.getCommitteeState());
            ps.setString(8, com.getCommitteeID());
            
             //ps.executeUpdate();
             rowUpdated = ps.executeUpdate() > 0;        
    	}

        catch (Exception e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
}