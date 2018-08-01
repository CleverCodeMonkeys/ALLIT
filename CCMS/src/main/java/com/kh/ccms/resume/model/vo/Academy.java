package com.kh.ccms.resume.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Academy implements Serializable, ResumeItem
{
	private static final long serialVersionUID = 1L;

	private int id;
	private int academyId;
	private String educationTitle;
	private String academyName;
	private Date startDate;
	private Date endDate;
	private String content;
	
	public Academy(){}

	/**
	 * @param id
	 * @param academyId
	 * @param educationTitle
	 * @param academyName
	 * @param startDate
	 * @param endDate
	 * @param content
	 */
	public Academy(int id, int academyId, String educationTitle, String academyName, Date startDate, Date endDate,
			String content) {
		super();
		this.id = id;
		this.academyId = academyId;
		this.educationTitle = educationTitle;
		this.academyName = academyName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAcademyId() {
		return academyId;
	}

	public void setAcademyId(int academyId) {
		this.academyId = academyId;
	}

	public String getEducationTitle() {
		return educationTitle;
	}

	public void setEducationTitle(String educationTitle) {
		this.educationTitle = educationTitle;
	}

	public String getAcademyName() {
		return academyName;
	}

	public void setAcademyName(String academyName) {
		this.academyName = academyName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public static class AcademyBuilder{
		/*private int id;*/
		/*private int academyId;*/
		private String educationTitle = "";
		private String academyName = "";
		private Date startDate = null;
		private Date endDate = null;
		private String content = "";
		
		public AcademyBuilder(){
			
		}
		
		public AcademyBuilder setEducationTitle(String educationTitle){
			this.educationTitle = educationTitle;
			return this;
		}
		
		public AcademyBuilder setContent(String content){
			this.content = content;
			return this;
		}
		
		public AcademyBuilder setAcademyName(String academyName){
			this.academyName = academyName;
			return this;
		}
		
		public AcademyBuilder setStartDate(Date startDate){
			this.startDate = startDate;
			return this;
		}
		
		public AcademyBuilder setEndDate(Date endDate){
			this.endDate = endDate;
			return this;
		}
		
		public Academy build(){
			return new Academy(this);
		}
	}
	
	public Academy(AcademyBuilder builder){
		this.academyName = builder.academyName;
		this.content = builder.content;
		this.educationTitle = builder.educationTitle;
		this.endDate = builder.endDate;
		this.startDate = builder.startDate;
	}

	@Override
	public String toString() {
		return "Academy [id=" + id + ", academyId=" + academyId + ", educationTitle=" + educationTitle
				+ ", academyName=" + academyName + ", startDate=" + startDate + ", endDate=" + endDate + ", content="
				+ content + "]";
	}
	
}
