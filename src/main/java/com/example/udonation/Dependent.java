package com.example.udonation;

public class Dependent {
    public String dependentID ="Tiada Info";
    public String dependentName ="Tiada Info";
    public String dependentRelationship ="Tiada Info";
    public String applicantID ="Tiada Info";

    public Dependent(String dependentID, String dependentName, String dependentRelationship, String applicantID) {
        this.dependentID = dependentID;
        this.dependentName = dependentName;
        this.dependentRelationship = dependentRelationship;
        this.applicantID = applicantID;
    }

    public String getDependentID() {
        return dependentID;
    }

    public void setDependentID(String dependentID) {
        this.dependentID = dependentID;
    }

    public String getDependentName() {
        return dependentName;
    }

    public void setDependentName(String dependentName) {
        this.dependentName = dependentName;
    }

    public String getDependentRelationship() {
        return dependentRelationship;
    }

    public void setDependentRelationship(String dependentRelationship) {
        this.dependentRelationship = dependentRelationship;
    }

    public String getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(String applicantID) {
        this.applicantID = applicantID;
    }
}
