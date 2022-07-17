package com.example.udonation;

public class Employee extends Applicant{

    public String employeeOccupation;
    public double employeeSalary;

    public Employee(String applicantID, String applicantName, String applicantPhoneNumber, String applicantEmail, String applicantAddress, String applicantCity, int applicantPostcode, String applicantState, String applicantEmploymentType,String applicantPassword, String employeeOccupation, double employeeSalary) {
        super(applicantID, applicantName, applicantPhoneNumber, applicantEmail, applicantAddress, applicantCity, applicantPostcode, applicantState, applicantEmploymentType,applicantPassword);
        this.employeeOccupation = employeeOccupation;
        this.employeeSalary = employeeSalary;
    }

    public String getEmployeeOccupation() {
        return employeeOccupation;
    }

    public void setEmployeeOccupation(String employeeOccupation) {
        this.employeeOccupation = employeeOccupation;
    }

    public double getEmployeeSalary() {
        return employeeSalary;
    }

    public void setEmployeeSalary(double employeeSalary) {
        this.employeeSalary = employeeSalary;
    }
}
