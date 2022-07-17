package com.example.udonation;
import java.sql.Date; 
import java.sql.Time;

import java.time.LocalDate;
import java.time.LocalTime;

public class Collection {
    private LocalTime t = LocalTime.now();
    private LocalDate d = LocalDate.now();

    public int collectionID;
    public Date collectionDate = Date.valueOf(d);
    public Time collectionTime = Time.valueOf(t);
    public String collectionDetails;
    public String applicantID;
    public String committeeID;

    public Collection(Date collectionDate, int collectionID, Time collectionTime, String collectionDetails, String applicantID, String committeeID) {
        this.collectionDate = collectionDate;
        this.collectionID = collectionID;
        this.collectionTime = collectionTime;
        this.collectionDetails = collectionDetails;
        this.applicantID = applicantID;
        this.committeeID = committeeID;
    }

    public Date getCollectionDate() {
        return collectionDate;
    }

    public void setCollectionDate(Date collectionDate) {
        this.collectionDate = collectionDate;
    }

    public int getCollectionID() {
        return collectionID;
    }

    public void setCollectionID(int collectionID) {
        this.collectionID = collectionID;
    }

    public Time getCollectionTime() {
        return collectionTime;
    }

    public void setCollectionTime(Time collectionTime) {
        this.collectionTime = collectionTime;
    }

    public String getCollectionDetails() {
        return collectionDetails;
    }

    public void setCollectionDetails(String collectionDetails) {
        this.collectionDetails = collectionDetails;
    }

    public String getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(String applicantID) {
        this.applicantID = applicantID;
    }

    public String getCommitteeID() {
        return committeeID;
    }

    public void setCommitteeID(String committeeID) {
        this.committeeID = committeeID;
    }
}
