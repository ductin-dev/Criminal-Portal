package com.covidtracker.dto;

public class AreaDTO extends AbstractDTO<AreaDTO>{

    private String aX;
    private String aY;
    private String address;
    private String detail;

    public String getaX() {
        return aX;
    }

    public void setaX(String aX) {
        this.aX = aX;
    }

    public String getaY() {
        return aY;
    }

    public void setaY(String aY) {
        this.aY = aY;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
