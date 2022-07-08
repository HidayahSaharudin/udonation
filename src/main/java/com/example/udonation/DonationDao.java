package com.example.udonation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.sql.*;

import static java.lang.System.out;

public class DonationDao{
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
    public void createDonation (Donation don) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into donation(donationName,donationDescription,donationOpenDate, donationCloseDate) values(?,?,?,?)"))
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