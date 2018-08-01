package com.kh.ccms.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String password;
	private String eMail;
	private String distinction;
	private Date enrollDate;
	
	public Member(){}

	public Member(String id, String password, String eMail, String distinction) {
		super();
		this.id = id;
		this.password = password;
		this.eMail = eMail;
		this.distinction = distinction;
	}
	
	public Member(String id, String password, String eMail, String distinction, Date enrollDate) {
		super();
		this.id = id;
		this.password = password;
		this.eMail = eMail;
		this.distinction = distinction;
		this.enrollDate = enrollDate;
	}
	
	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getDistiniction() {
		return distinction;
	}

	public void setDistiniction(String distinction) {
		this.distinction = distinction;
	}
	
}
