package com.kh.ccms.recruit.model.vo;

import java.sql.Date;

public class Recruit implements java.io.Serializable {

	private static final long serialVersionUID = 1111L;
	
	String name;
	String gender;
	int birthyear;
	int age; 
	String title;
	String last_edu;
	String location;
	String salary;
	String job;
	Date regist_date;
	Date update_date;
	String language;
	
	public Recruit() {
		super();
	}

	public Recruit(String name, String gender, int birthyear, int age, String title, String last_edu, String location,
			String salary, String job, Date regist_date, Date update_date, String language) {
		super();
		this.name = name;
		this.gender = gender;
		this.birthyear = birthyear;
		this.age = age;
		this.title = title;
		this.last_edu = last_edu;
		this.location = location;
		this.salary = salary;
		this.job = job;
		this.regist_date = regist_date;
		this.update_date = update_date;
		this.language = language;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getBirthyear() {
		return birthyear;
	}

	public void setBirthyear(int birthyear) {
		this.birthyear = birthyear;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLast_edu() {
		return last_edu;
	}

	public void setLast_edu(String last_edu) {
		this.last_edu = last_edu;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Date getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Override
	public String toString() {
		return "Recruit [name=" + name + ", gender=" + gender + ", birthyear=" + birthyear + ", age=" + age + ", title="
				+ title + ", last_edu=" + last_edu + ", location=" + location + ", salary=" + salary + ", job=" + job
				+ ", regist_date=" + regist_date + ", update_date=" + update_date + ", language=" + language + "]";
	}

}
