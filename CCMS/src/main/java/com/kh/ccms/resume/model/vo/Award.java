package com.kh.ccms.resume.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Award implements Serializable ,ResumeItem
{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int awardId;
	private String awardTitle;
	private String awardOrganization;
	private Date awardDate;
	private String awardContent;
	
	public Award(){}

	/**
	 * @param id
	 * @param awardId
	 * @param awardTitle
	 * @param awardOrganization
	 * @param awardDate
	 * @param awardContent
	 */
	public Award(int id, int awardId, String awardTitle, String awardOrganization, Date awardDate,
			String awardContent) {
		super();
		this.id = id;
		this.awardId = awardId;
		this.awardTitle = awardTitle;
		this.awardOrganization = awardOrganization;
		this.awardDate = awardDate;
		this.awardContent = awardContent;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAwardId() {
		return awardId;
	}

	public void setAwardId(int awardId) {
		this.awardId = awardId;
	}

	public String getAwardTitle() {
		return awardTitle;
	}

	public void setAwardTitle(String awardTitle) {
		this.awardTitle = awardTitle;
	}

	public String getAwardOrganization() {
		return awardOrganization;
	}

	public void setAwardOrganization(String awardOrganization) {
		this.awardOrganization = awardOrganization;
	}

	public Date getAwardDate() {
		return awardDate;
	}

	public void setAwardDate(Date awardDate) {
		this.awardDate = awardDate;
	}

	public String getAwardContent() {
		return awardContent;
	}

	public void setAwardContent(String awardContent) {
		this.awardContent = awardContent;
	}
	
	public static class AwardBuilder{
		private int id;
		private int awardId;
		private String awardTitle;
		private String awardOrganization;
		private Date awardDate;
		private String awardContent;
		
		public AwardBuilder(){
			
		}
		
		public AwardBuilder setTitle(String awardTitle){
			this.awardTitle = awardTitle;
			return this;
		}
		
		public AwardBuilder setId(int id){
			this.id = id;
			return this;
		}
		
		public AwardBuilder setAwardId(int awardId){
			this.awardId = awardId;
			return this;
		}
		
		public AwardBuilder setAwardOrgan(String awardOrganization){
			this.awardOrganization = awardOrganization;
			return this;
		}
		
		public AwardBuilder setAwardDate(Date awardDate){
			this.awardDate = awardDate;
			return this;
		}
		
		public AwardBuilder setAwardContent(String content){
			this.awardContent = content;
			return this;
		}
		
		public Award build(){
			return new Award(this);
		}
	}
	
	public Award(AwardBuilder builder){
		this.id = builder.id;
		this.awardId = builder.awardId;
		this.awardContent = builder.awardContent;
		this.awardDate = builder.awardDate;
		this.awardOrganization = builder.awardOrganization;
		this.awardTitle = builder.awardTitle;
	}

	@Override
	public String toString() {
		return "Award [id=" + id + ", awardId=" + awardId + ", awardTitle=" + awardTitle + ", awardOrganization="
				+ awardOrganization + ", awardDate=" + awardDate + ", awardContent=" + awardContent + "]";
	}
}
