package com.covidtracker.dto;

public class PatientDTO extends AbstractDTO<PatientDTO> {

    private String bnX;
    private String bnY;
    private String code;
    private String name;
    private String address;
    private Integer status;

    public String getBnX() {
        return bnX;
    }

    public void setBnX(String bnX) {
        this.bnX = bnX;
    }

    public String getBnY() {
        return bnY;
    }

    public void setBnY(String bnY) {
        this.bnY = bnY;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
