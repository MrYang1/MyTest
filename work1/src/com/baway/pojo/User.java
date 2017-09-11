package com.baway.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class User {

	private String name;
	private String username;
	private String password;
	private String sex;
	private String hobby;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private String phonenumber;
	private String email;
	private String address;
	private String myshow;
	private String carId;
	private String photourl;
	public User(String name, String username, String password, String sex,
			String hobby, Date birthday, String phonenumber, String email,
			String address, String myshow, String carId, String photourl) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.hobby = hobby;
		this.birthday = birthday;
		this.phonenumber = phonenumber;
		this.email = email;
		this.address = address;
		this.myshow = myshow;
		this.carId = carId;
		this.photourl = photourl;
	}
	public User() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMyshow() {
		return myshow;
	}
	public void setMyshow(String myshow) {
		this.myshow = myshow;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getPhotourl() {
		return photourl;
	}
	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", username=" + username + ", password="
				+ password + ", sex=" + sex + ", hobby=" + hobby
				+ ", birthday=" + birthday + ", phonenumber=" + phonenumber
				+ ", email=" + email + ", address=" + address + ", myshow="
				+ myshow + ", carId=" + carId + ", photourl=" + photourl + "]";
	}
	  
	
}
