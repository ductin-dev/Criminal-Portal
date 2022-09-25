package com.covidtracker.entity;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "coviduser")
public class UserEntity extends BaseEntity {

	@NotNull(message = "Username cant be null")
	@Column(name = "uUsername")
	private String userName;

	@NotNull(message = "Password cant be null")
	@Column(name = "uPassword")
	private String password;

	@NotNull(message = "Full name cant be null")
	@Column(name = "uFullname",columnDefinition = "NTEXT")
	private String fullname;

	@NotNull(message = "Phone number cant be null")
	@Column(name = "uPhone")
	private String phone;

	@NotNull(message = "Address cant be null")
	@Column(name = "uAddress",columnDefinition = "NTEXT")
	private String address;

	@NotNull(message = "Email cant be null")
	@Email
	@Column(name = "uEmail")
	private String email;

	@Column(name = "uAvatar")
	private String avatar;

	@NotNull(message = "Status cant be null")
	@Column
	private Integer status;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), 
								  inverseJoinColumns = @JoinColumn(name = "roleid"))
	private List<RoleEntity> rolez = new ArrayList<>();


	public String getUserName() {
		return userName;
	}

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

	public List<RoleEntity> getRolez() {
		return rolez;
	}

	public void setRolez(List<RoleEntity> rolez) {
		this.rolez = rolez;
	}
}
