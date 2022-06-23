package com.example.udonation;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Donation {

    public String donationName;
    public String donationDescription;
    public Date donationOpenDate;
    public int donationID;
    public Date donationCloseDate;

    public Donation() {}

    public int getDonationID() {
        return donationID;
    }

    public void setDonationID(int donationID) {
        this.donationID = donationID;
    }

    public String getDonationName() {
        return donationName;
    }

    public void setDonationName(String donationName) {
        this.donationName = donationName;
    }

    public String getDonationDescription() {
        return donationDescription;
    }

    public void setDonationDescription(String donationDescription) {
        this.donationDescription = donationDescription;
    }

    public Date getDonationOpenDate() {
        return donationOpenDate;
    }

    public void setDonationOpenDate(Date donationOpenDate) {
        this.donationOpenDate = donationOpenDate;
    }

    public Date getDonationCloseDate() {
        return donationCloseDate;
    }

    public void setDonationCloseDate(Date donationCloseDate) {
        this.donationCloseDate = donationCloseDate;
    }
}