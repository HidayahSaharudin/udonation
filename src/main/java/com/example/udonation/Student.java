package com.example.udonation;

public class Student extends Applicant{

    public String studentLevel;
    public String studentInstitution;

    public Student(String applicantID, String applicantName, String applicantPhoneNumber, String applicantEmail, String applicantAddress, String applicantCity, int applicantPostcode, String applicantState, String applicantEmploymentType,String applicantPassword, String studentLevel, String studentInstitution) {
        super(applicantID, applicantName, applicantPhoneNumber, applicantEmail, applicantAddress, applicantCity, applicantPostcode, applicantState, applicantEmploymentType,applicantPassword);
        this.studentLevel = studentLevel;
        this.studentInstitution = studentInstitution;
    }

    public String getStudentLevel() {
        return studentLevel;
    }

    public void setStudentLevel(String studentLevel) {
        this.studentLevel = studentLevel;
    }

    public String getStudentInstitution() {
        return studentInstitution;
    }

    public void setStudentInstitute(String studentInstitution) {
        this.studentInstitution = studentInstitution;
    }
}
