package com.covidtracker.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "area")
public class AreaEntity extends BaseEntity {

    @NotNull(message = "aX cant be null")
    @Column(name = "aX")
    private String aX;

    @NotNull(message = "aY cant be null")
    @Column(name = "aY")
    private String aY;

    @NotNull(message = "Address cant be null")
    @Column(name = "aAddress",columnDefinition = "NTEXT")
    private String address;

    @NotNull(message = "Detail cant be null")
    @Column(name = "aDetail",columnDefinition = "NTEXT")
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
