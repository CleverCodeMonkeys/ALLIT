package com.kh.ccms.myPage.model.vo;

public class Profile {
	private String id;
	private String member_id;
	private String name;
	private String birth;
	private String email;
	private String gender;
	private String tel;
	private String address;
	private String language;
	private String photo;
	
	public Profile() {
		super();
	
	}

	public Profile(String id, String member_id, String name, String birth, String email, String gender, String tel,
			String address, String language, String photo) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
		this.tel = tel;
		this.address = address;
		this.language = language;
		this.photo = photo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Profile [id=" + id + ", member_id=" + member_id + ", name=" + name + ", birth=" + birth + ", email="
				+ email + ", gender=" + gender + ", tel=" + tel + ", address=" + address + ", language=" + language
				+ ", photo=" + photo + "]";
	}
	
	
	
}
