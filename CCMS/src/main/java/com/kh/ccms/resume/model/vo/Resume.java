package com.kh.ccms.resume.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Resume implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String title;
	private String memberId;
	private String photo;
	private String address;
	private String tel;
	private Date registDate;
	private Date updateDate;
	private String birthday;
	private String gender;
	private String name;
	
	//
	private String language;
	private String display;
	private String lastEdu;
	private String email;
	
	public Resume(){}

	/**
	 * @param id
	 * @param title
	 * @param memberId
	 * @param photo
	 * @param address
	 * @param tel
	 * @param registDate
	 * @param updateDate
	 * @param birthday
	 * @param gender
	 * @param name
	 * @param language
	 * @param display
	 * @param lastEdu
	 */
	public Resume(int id, String title, String memberId, String photo, String address, String tel, Date registDate,
			Date updateDate, String birthday, String gender, String name, String language, String display,
			String lastEdu, String email) {
		super();
		this.id = id;
		this.title = title;
		this.memberId = memberId;
		this.photo = photo;
		this.address = address;
		this.tel = tel;
		this.registDate = registDate;
		this.updateDate = updateDate;
		this.birthday = birthday;
		this.gender = gender;
		this.name = name;
		this.language = language;
		this.display = display;
		this.lastEdu = lastEdu;
		this.email = email;
	}

	public Resume(int id, String title, String memberId, String photo, String address, String tel, Date registDate,
			Date updateDate, String birthday, String gender, String name) {
		super();
		this.id = id;
		this.title = title;
		this.memberId = memberId;
		this.photo = photo;
		this.address = address;
		this.tel = tel;
		this.registDate = registDate;
		this.updateDate = updateDate;
		this.birthday = birthday;
		this.gender = gender;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getLastEdu() {
		return lastEdu;
	}

	public void setLastEdu(String lastEdu) {
		this.lastEdu = lastEdu;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Resume [id=" + id + ", title=" + title + ", memberId=" + memberId + ", photo=" + photo + ", address="
				+ address + ", tel=" + tel + ", registDate=" + registDate + ", updateDate=" + updateDate + ", birthday="
				+ birthday + ", gender=" + gender + ", name=" + name + ", language=" + language + ", display=" + display
				+ ", lastEdu=" + lastEdu + "]";
	}

	// For Data Base Resume
	public static class ResumeBuilder{
		/*private int id;*/
		private String title ="";
		private String memberId ="";
		private String photo ="";
		private String address ="";
		private String tel = "";
		private String birthday = "";
		private String gender = "";
		private String name = "";
		private String email = "";
		
		// New One
		private String language;
		private String display;
		private String lastEdu;
		
		public ResumeBuilder(String memberId){
			this.memberId = memberId;
		}
		
		public ResumeBuilder setLastEdu(String lastEdu){
			this.lastEdu = lastEdu;
			return this;
		}
		
		public ResumeBuilder setEmail(String email){
			this.email = email;
			return this;
		}
		
		public ResumeBuilder setDisplay(String display){
			this.display = display;
			return this;
		}
		
		public ResumeBuilder setLanguage(String language){
			this.language = language;
			return this;
		}
		
		public ResumeBuilder setTitle(String title){
			this.title = title;
			return this;
		}
		
		public ResumeBuilder setPhoto(String photo){
			this.photo = photo;
			return this;
		}
		
		public ResumeBuilder setAddress(String address){
			this.address = address;
			return this;
		}
		
		public ResumeBuilder setTel(String tel){
			this.tel = tel;
			return this;
		}
		
		public ResumeBuilder setBirthday(String birthday){
			this.birthday = birthday;
			return this;
		}
		
		public ResumeBuilder setGender(String gender){
			this.gender = gender;
			return this;
		}
		
		public ResumeBuilder setName(String name){
			this.name = name;
			return this;
		}
		
		public Resume build(){
			return new Resume(this);
		}
	}
	
	public Resume(ResumeBuilder builder){
		this.memberId = builder.memberId;
		this.address = builder.address;
		this.birthday = builder.birthday;
		this.gender = builder.gender;
		this.name = builder.name;
		this.photo = builder.photo;
		this.tel = builder.tel;
		this.title = builder.title;
		
		// Add New One
		this.language = builder.language;
		this.display = builder.display;
		this.lastEdu = builder.lastEdu;
		this.email = builder.email;
	}
	
	
}
