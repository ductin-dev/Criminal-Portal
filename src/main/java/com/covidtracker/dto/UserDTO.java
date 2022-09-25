package com.covidtracker.dto;

import java.util.List;

public class UserDTO extends AbstractDTO<UserDTO> {

    private String userName;
    private String password;
    private String fullname;
    private String phone;
    private String address;
    private String email;
    private String avatar;
    private Integer status;
    private List<RoleDTO> roleDTO;
    private String nameRole;
    private String roles;

    public String getNameRole() { return nameRole; }

    public void setNameRole(String nameRole) { this.nameRole = nameRole; }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public List<RoleDTO> getRoleDTO() {
        return roleDTO;
    }

    public void setRoleDTO(List<RoleDTO> roleDTO) {
        this.roleDTO = roleDTO;
    }

    public String getUserName() { return userName; }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}
