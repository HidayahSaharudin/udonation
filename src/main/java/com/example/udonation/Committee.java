package com.example.udonation;

public class Committee {
    public String committeeID;
    public String committeeName;
    public String committeePhoneNumber;
    public String committeeEmail;
    public String committeeAddress;
    public String committeeCity;
    public int committeePostcode;
    public String committeeState;

    public Committee(String committeeID, String committeeName, String committeePhoneNumber, String committeeEmail, String committeeAddress, String committeeCity, int committeePostcode, String committeeState) {
        this.committeeID = committeeID;
        this.committeeName = committeeName;
        this.committeePhoneNumber = committeePhoneNumber;
        this.committeeEmail = committeeEmail;
        this.committeeAddress = committeeAddress;
        this.committeeCity = committeeCity;
        this.committeePostcode = committeePostcode;
        this.committeeState = committeeState;
    }

    public String getCommitteeID() {
        return committeeID;
    }

    public void setCommitteeID(String committeeID) {
        this.committeeID = committeeID;
    }

    public String getCommitteeName() {
        return committeeName;
    }

    public void setCommitteeName(String committeeName) {
        this.committeeName = committeeName;
    }

    public String getCommitteePhoneNumber() {
        return committeePhoneNumber;
    }

    public void setCommitteePhoneNumber(String committeePhoneNumber) {
        this.committeePhoneNumber = committeePhoneNumber;
    }

    public String getCommitteeEmail() {
        return committeeEmail;
    }

    public void setCommitteeEmail(String committeeEmail) {
        this.committeeEmail = committeeEmail;
    }

    public String getCommitteeAddress() {
        return committeeAddress;
    }

    public void setCommitteeAddress(String committeeAddress) {
        this.committeeAddress = committeeAddress;
    }

    public String getCommitteeCity() {
        return committeeCity;
    }

    public void setCommitteeCity(String committeeCity) {
        this.committeeCity = committeeCity;
    }

    public int getCommitteePostcode() {
        return committeePostcode;
    }

    public void setCommitteePostcode(int committeePostcode) {
        this.committeePostcode = committeePostcode;
    }

    public String getCommitteeState() {
        return committeeState;
    }

    public void setCommitteeState(String committeeState) {
        this.committeeState = committeeState;
    }
}
