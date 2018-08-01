package com.kh.ccms.resume.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Degree implements Serializable, ResumeItem 
{
	private static final long serialVersionUID = 1L;
	private int id;
	private int degreeId;
	private String schoolType;
	private String schoolName;
	private Date enrollDate;
	private Date graduDate;
	/*private String graduState;*/
	private String major;
	private double score;
	private double totalScore;
	
	public Degree(){}

	/**
	 * @param id
	 * @param degreeId
	 * @param schoolType
	 * @param schoolName
	 * @param enrollDate
	 * @param graduDate
	 * @param graduState
	 * @param major
	 * @param score
	 * @param totalScore
	 */
	public Degree(int id, int degreeId,String schoolType ,String schoolName, Date enrollDate, Date graduDate,
			String major, double score, double totalScore) {
		super();
		this.id = id;
		this.degreeId = degreeId;
		this.schoolType = schoolType;
		this.schoolName = schoolName;
		this.enrollDate = enrollDate;
		this.graduDate = graduDate;
		/*this.graduState = graduState;*/
		this.major = major;
		this.score = score;
		this.totalScore = totalScore;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDegreeId() {
		return degreeId;
	}

	public void setDegreeId(int degreeId) {
		this.degreeId = degreeId;
	}

	public String getSchoolType() {
		return schoolType;
	}

	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
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

/*	public String getGraduState() {
		return graduState;
	}*/

/*	public void setGraduState(String graduState) {
		this.graduState = graduState;
	}*/

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Degree [id=" + id + ", degreeId=" + degreeId + ", schoolName=" + schoolName + ", enrollDate="
				+ enrollDate + ", graduDate=" + graduDate +  ", major=" + major
				+ ", score=" + score + ", totalScore=" + totalScore + "]";
	}

	public double getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
	}
	
	public static class DegreeBuilder{
		/*private int id;*/
		/*private int degreeId;*/
		private String schoolType = "";
		private String schoolName = "";
		private Date enrollDate = null;
		private Date graduDate = null;
		private String major = "";
		private double score = 0;
		private double totalScore = 0;
		
		public DegreeBuilder(){
			
		}
		
		public DegreeBuilder setSchoolType(String schoolType){
			this.schoolType = schoolType;
			return this;
		}
		
		
		public DegreeBuilder setSchoolName(String schoolName){
			this.schoolName = schoolName;
			return this;
		}
				
		public DegreeBuilder setEnrollDate(Date enrollDate){
			this.enrollDate = enrollDate;
			return this;
		}
		
		public DegreeBuilder setGraduDate(Date graduDate){
			this.graduDate = graduDate;
			return this;
		}
		
	/*	public DegreeBuilder setGraduState(String graduState){
			this.graduState = graduState;
			return this;
		}*/
		
		public DegreeBuilder setMajor(String major){
			this.major = major;
			return this;
		}
		
		public DegreeBuilder setScore(double score){
			this.score = score;
			return this;
		}
		
		public DegreeBuilder setTotalScore(double totalScore){
			this.totalScore = totalScore;
			return this;
		}
		
		public Degree build(){
			return new Degree(this);
		}
	}
	
	public Degree(DegreeBuilder builder){
		this.enrollDate = builder.enrollDate;
		this.graduDate = builder.graduDate;
		this.major = builder.major;
		this.schoolName = builder.schoolName;
		this.schoolType = builder.schoolType;
		this.score = builder.score;
		this.totalScore = builder.totalScore;
		/*this.graduState = builder.graduState;*/
	}
	
}
