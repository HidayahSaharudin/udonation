package com.example.udonation;

public class Spouse {
    public String spouseID;
    public String spouseName;
    public String spousePhoneNumber;
    public String spouseOccupation;
    public double spouseSalary;
    public String applicantID;

    public Spouse(String spouseID, String spouseName, String spousePhoneNumber, String spouseOccupation, double spouseSalary, String applicantID) {
        this.spouseID = spouseID;
        this.spouseName = spouseName;
        this.spousePhoneNumber = spousePhoneNumber;
        this.spouseOccupation = spouseOccupation;
        this.spouseSalary = spouseSalary;
        this.applicantID = applicantID;
    }

    public Spouse() {
		// TODO Auto-generated constructor stub
	}

	public String getSpouseID() {
        return spouseID;
    }

    public void setSpouseID(String spouseID) {
        this.spouseID = spouseID;
    }

    public String getSpouseName() {
        return spouseName;
    }

    public void setSpouseName(String spouseName) {
        this.spouseName = spouseName;
    }

    public String getSpousePhoneNumber() {
        return spousePhoneNumber;
    }

    public void setSpousePhoneNumber(String spousePhoneNumber) {
        this.spousePhoneNumber = spousePhoneNumber;
    }

    public String getSpouseOccupation() {
        return spouseOccupation;
    }

    public void setSpouseOccupation(String spouseOccupation) {
        this.spouseOccupation = spouseOccupation;
    }

    public double getSpouseSalary() {
        return spouseSalary;
    }

    public void setSpouseSalary(double spouseSalary) {
        this.spouseSalary = spouseSalary;
    }

    public String getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(String applicantID) {
        this.applicantID = applicantID;
    }
}
