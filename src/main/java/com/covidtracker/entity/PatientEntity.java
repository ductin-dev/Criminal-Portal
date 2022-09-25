package com.covidtracker.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "patient")
public class PatientEntity extends BaseEntity{

    @NotNull(message = "Code cant be null")
    @Column(name = "bnCode")
    private String code;

    @NotNull(message = "Name cant be null")
    @Column(name = "bnName",columnDefinition = "NTEXT")
    private String name;

    @NotNull(message = "bX cant be null")
    @Column(name = "bnX")
    private String bnX;

    @NotNull(message = "bY cant be null")
    @Column(name = "bnY")
    private String bnY;

    @NotNull(message = "Address cant be null")
    @Column(name = "bnAddress",columnDefinition = "NTEXT")
    private String address;

    @NotNull(message = "Status cant be null")
    @Column
    private Integer status;

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
