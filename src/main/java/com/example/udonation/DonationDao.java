package com.example.udonation;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class DonationDao{
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
    public void createDonation (Donation don) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("INSERT INTO DONATION(DONATIONNAME,DONATIONDESCRIPTION,DONATIONOPENDATE,DONATIONID,DONATIONCLOSEDATE) values(?,?,?,nextval('donationid_seq'),?);"))
        {
            ps.setString(1, don.getDonationName());
            ps.setString(2, don.getDonationDescription());
            ps.setDate(3, don.getDonationOpenDate());
            ps.setDate(4, don.getDonationCloseDate());
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean deleteDonation(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from donation where donationID=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public void updateDonation (Donation don) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("update donation set donationName=?,donationDescription=?,donationOpenDate=?,donationCloseDate=? WHERE donationID = ?"))
        {
            ps.setString(1, don.getDonationName());
            ps.setString(2, don.getDonationDescription());
            ps.setDate(3, don.getDonationOpenDate());
            ps.setDate(4, don.getDonationCloseDate());
            ps.setInt(5, don.getDonationID());
            ps.executeUpdate();
        }

        catch (Exception e) {
            e.printStackTrace();
        }
    }
}