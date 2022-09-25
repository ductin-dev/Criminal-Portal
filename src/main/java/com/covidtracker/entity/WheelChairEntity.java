package com.covidtracker.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "WheelChair")
public class WheelChairEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Name cant be null")
    @Column(name = "wName", columnDefinition = "NTEXT")
    private String name;

    @NotNull(message = "Phone cant be null")
    @Column(name = "wPhone", columnDefinition = "VARCHAR")
    private String phone;

    @NotNull(message = "Address cant be null")
    @Column(name = "wAddress", columnDefinition = "NTEXT")
    private String address;

    @NotNull(message = "Detail cant be null")
    @Column(name = "wDetail",columnDefinition = "NTEXT")
    private String detail;

    @NotNull(message = "Status cant be null")
    @Column(name = "wStatus")
    private Integer status;

    @NotNull(message = "Image cant be null")
    @Column(name = "wBase64",columnDefinition = "NTEXT")
    private String base64;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getBase64() {
        return base64;
    }

    public void setBase64(String base64) {
        this.base64 = base64;
    }
}
