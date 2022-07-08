package com.example.udonation;
import java.sql.*;
public class test {
    public static void main(String args[]){

        try{
            //step1 load the driver class
            Class.forName("org.postgresql.Driver");
            //step2 create the connection object
            Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/udonation","postgres","syauqi2826");
            //step3 create the statement object
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO donation"+"(donationid,donationname,donationdescription,donationopendate,donationclosedate) VALUES"+"(nextval('donationid_seq'),'Skim Raya','B40 Sahaja','2022-06-10','2022-07-30');";
            //step4 execute query
            stmt.executeUpdate(sql);
            //step5 close the connection object
            con.close();
        }

        catch(Exception e){
            System.out.println(e);
        }
    }
}