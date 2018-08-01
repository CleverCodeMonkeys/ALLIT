package com.kh.ccms.resume.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class HighSchool implements Serializable, ResumeItem
{
	private static final long serialVersionUID = 1L;
	private int id;
	private int highSchoolId;
	private String schoolName;
	private Date enrollDate;
	private Date graduDate;
	
	public HighSchool(){}

	/**
	 * @param id
	 * @param highSchoolId
	 * @param schoolName
	 * @param enrollDate
	 * @param graduDate
	 */
	public HighSchool(int id, int highSchoolId, String schoolName, Date enrollDate, Date graduDate) {
		super();
		this.id = id;
		this.highSchoolId = highSchoolId;
		this.schoolName = schoolName;
		this.enrollDate = enrollDate;
		this.graduDate = graduDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getHighSchoolId() {
		return highSchoolId;
	}

	public void setHighSchoolId(int highSchoolId) {
		this.highSchoolId = highSchoolId;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getGraduDate() {
		return graduDate;
	}

	public void setGraduDate(Date graduDate) {
		this.graduDate = graduDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "HighSchool [id=" + id + ", highSchoolId=" + highSchoolId + ", schoolName=" + schoolName
				+ ", enrollDate=" + enrollDate + ", graduDate=" + graduDate + "]";
	}
	
}
