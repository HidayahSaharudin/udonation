package com.example.udonation;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

public class Application {
    private LocalTime t = LocalTime.now();
    private LocalDate d = LocalDate.now();

    public int applicationID; //pakai nextval
    public Date applicationDate = Date.valueOf(d);
    public Time applicationTime = Time.valueOf(t);
    public String applicationStatus = "Sedang diproses";
    
    public String applicantID;
    public int donationID;
    public String committeeID = null;
    
    

    public Application() {
		// TODO Auto-generated constructor stub
	}

	public Application(int applicationID, Date applicationDate, Time applicationTime, String applicationStatus,
			String applicantID, int donationID, String committeeID) {
		super();
		this.applicationID = applicationID;
		this.applicationDate = applicationDate;
		this.applicationTime = applicationTime;
		this.applicationStatus = applicationStatus;
		this.applicantID = applicantID;
		this.donationID = donationID;
		this.committeeID = committeeID;
	}

	public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public Time getApplicationTime() {
        return applicationTime;
    }

    public void setApplicationTime(Time applicationTime) {
        this.applicationTime = applicationTime;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus;
    }

    public String getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(String applicantID) {
        this.applicantID = applicantID;
    }

    public int getApplicationID() {
        return applicationID;
    }

    public void setApplicationID(int applicationID) {
        this.applicationID = applicationID;
    }

    public int getDonationID() {
        return donationID;
    }

    public void setDonationID(int donationID) {
        this.donationID = donationID;
    }

    public String getCommitteeID() {
        return committeeID;
    }

    public void setCommitteeID(String committeeID) {
        this.committeeID = committeeID;
    }
}
