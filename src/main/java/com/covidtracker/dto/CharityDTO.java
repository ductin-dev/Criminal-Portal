package com.covidtracker.dto;

public class CharityDTO extends AbstractDTO<CharityDTO> {

	private String cX;
	private String cY;
	private String name;
	private String address;
	private String content;

	public String getcX() {
		return cX;
	}

	public void setcX(String cX) {
		this.cX = cX;
	}

	public String getcY() {
		return cY;
	}

	public void setcY(String cY) {
		this.cY = cY;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
