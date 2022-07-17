package com.example.udonation;
import java.sql.*;

import static java.lang.System.out;

public class test {
    public static void main(String[] args){

        try{
            //step1 load the driver class
            Class.forName("org.postgresql.Driver");
            //step2 create the connection object
            Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/udonation","postgres","syauqi2826");
            //step3 create the statement object
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO COLLECTION"+"(collectionID,collectionDate,collectionTime,collectionDetails,applicantID,committeeID) VALUES"+"(nextval('applicationid_seq'),'2022-07-13','23:55','Permohonan diluluskan','01234567890',null);";
            //PreparedStatement preparedStatement = con.prepareStatement
                    //("delete from applicant where applicantID = '0121012312';");
           /* preparedStatement.setString(1, "0121012312");
            preparedStatement.setString(2, "Firdaus");
            preparedStatement.setString(3, "0123913212");
            preparedStatement.setString(4, "muhammadfirdaus123@gmail.com");
            preparedStatement.setString(5, "Bangi");
            preparedStatement.setString(6, "Hulu Langat");
            preparedStatement.setInt(7, 41230);
            preparedStatement.setString(8, "Selangor");
            preparedStatement.setString(9, "Student");
            //preparedStatement.setString(10, "Ijazah");
            //preparedStatement.setString(11, "UITM");*/
            //out.println(preparedStatement);
            //preparedStatement.executeUpdate();
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