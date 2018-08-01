package com.kh.ccms.resume.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class CertificateLanguage implements Serializable , ResumeItem
{
	private static final long serialVersionUID = 1L;
	private int id;
	private int langId;
	private String languageName;
	private String testName;
	private String score;
	private Date getDate;
	
	public CertificateLanguage(){}

	/**
	 * @param id
	 * @param langId
	 * @param languageName
	 * @param testName
	 * @param score
	 * @param getDate
	 */
	public CertificateLanguage(int id, int langId, String languageName, String testName, String score, Date getDate) {
		super();
		this.id = id;
		this.langId = langId;
		this.languageName = languageName;
		this.testName = testName;
		this.score = score;
		this.getDate = getDate;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLangId() {
		return langId;
	}

	public void setLangId(int langId) {
		this.langId = langId;
	}

	public String getLanguageName() {
		return languageName;
	}

	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Date getGetDate() {
		return getDate;
	}

	public void setGetDate(Date getDate) {
		this.getDate = getDate;
	}

	public static class LanguageBuilder{
		private int id;
		private int langId;
		private String languageName = "";
		private String testName = "";
		private String score = "";
		private Date getDate = null;
		
		public LanguageBuilder(){
			
		}
		
		public LanguageBuilder setId(int id){
			this.id = id;
			return this;
		}
		
		public LanguageBuilder setLangId(int langId){
			this.langId = langId;
			return this;
		}
		
		public LanguageBuilder setLangName(String langName){
			this.languageName = langName;
			return this;
		}
		
		public LanguageBuilder setTestName(String testName){
			this.testName = testName;
			return this;
		}
		
		public LanguageBuilder setScore(String score){
			this.score = score;
			return this;
		}
		
		public LanguageBuilder setDate(Date getDate){
			this.getDate = getDate;
			return this;
		}
		
		public CertificateLanguage build(){
			return new CertificateLanguage(this);
		}
		
	}
	
	public CertificateLanguage(LanguageBuilder builder){
		this.id = builder.id;
		this.langId = builder.langId;
		this.getDate = builder.getDate;
		this.languageName = builder.languageName;
		this.score = builder.score;
		this.testName = builder.testName;
	}

	@Override
	public String toString() {
		return "CertificateLanguage [id=" + id + ", langId=" + langId + ", languageName="
				+ languageName + ", testName=" + testName + ", score=" + score + ", getDate=" + getDate + "]";
	}
	
}
