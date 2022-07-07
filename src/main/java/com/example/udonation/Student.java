package com.example.udonation;

public class Student extends Applicant{

    public String studentLevel;
    public String studentInstitute;

    public Student(String applicantID, String applicantName, String applicantPhoneNumber, String applicantEmail, String applicantAddress, String applicantCity, int applicantPostcode, String applicantState, String applicantEmploymentType, String studentLevel, String studentInstitute) {
        super(applicantID, applicantName, applicantPhoneNumber, applicantEmail, applicantAddress, applicantCity, applicantPostcode, applicantState, applicantEmploymentType);
        this.studentLevel = studentLevel;
        this.studentInstitute = studentInstitute;
    }

    public String getStudentLevel() {
        return studentLevel;
    }

    public void setStudentLevel(String studentLevel) {
        this.studentLevel = studentLevel;
    }

    public String getStudentInstitute() {
        return studentInstitute;
    }

    public void setStudentInstitute(String studentInstitute) {
        this.studentInstitute = studentInstitute;
    }
}
