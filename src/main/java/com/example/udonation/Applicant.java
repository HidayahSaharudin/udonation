package com.example.udonation;

public class Applicant {
    public String applicantID;
    public String applicantName;
    public String applicantPhoneNumber;
    public String applicantEmail;
    public String applicantAddress;
    public String applicantCity;
    public int applicantPostcode;
    public String applicantState;
    public String applicantEmploymentType;
    public String applicantPassword;


    public Applicant(String applicantID, String applicantName, String applicantPhoneNumber, String applicantEmail, String applicantAddress, String applicantCity, int applicantPostcode, String applicantState, String applicantEmploymentType, String applicantPassword) {
        this.applicantID = applicantID;
        this.applicantName = applicantName;
        this.applicantPhoneNumber = applicantPhoneNumber;
        this.applicantEmail = applicantEmail;
        this.applicantAddress = applicantAddress;
        this.applicantCity = applicantCity;
        this.applicantPostcode = applicantPostcode;
        this.applicantState = applicantState;
        this.applicantEmploymentType = applicantEmploymentType;
        this.applicantPassword = applicantPassword;

    }
	public Applicant() {
		// TODO Auto-generated constructor stub
	}

    public String getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(String applicantID) {
        this.applicantID = applicantID;
    }

    public String getApplicantName() {
        return applicantName;
    }

    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    public String getApplicantPhoneNumber() {
        return applicantPhoneNumber;
    }

    public void setApplicantPhoneNumber(String applicantPhoneNumber) {
        this.applicantPhoneNumber = applicantPhoneNumber;
    }

    public String getApplicantEmail() {
        return applicantEmail;
    }

    public void setApplicantEmail(String applicantEmail) {
        this.applicantEmail = applicantEmail;
    }

    public String getApplicantAddress() {
        return applicantAddress;
    }

    public void setApplicantAddress(String applicantAddress) {
        this.applicantAddress = applicantAddress;
    }

    public String getApplicantCity() {
        return applicantCity;
    }

    public void setApplicantCity(String applicantCity) {
        this.applicantCity = applicantCity;
    }

    public int getApplicantPostcode() {
        return applicantPostcode;
    }

    public void setApplicantPostcode(int applicantPostcode) {
        this.applicantPostcode = applicantPostcode;
    }

    public String getApplicantState() {
        return applicantState;
    }

    public void setApplicantState(String applicantState) {
        this.applicantState = applicantState;
    }

    public String getApplicantEmploymentType() {
        return applicantEmploymentType;
    }

    public void setApplicantEmploymentType(String applicantEmploymentType) {
        this.applicantEmploymentType = applicantEmploymentType;
    }

	public String getApplicantPassword() {
		return applicantPassword;
	}

	public void setApplicantPassword(String applicantPassword) {
		this.applicantPassword = applicantPassword;
	}
    
}
