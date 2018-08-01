package com.kh.ccms.correction.model.vo;

import java.sql.Date;

public class Correction {
	private String correctionTitle;
	private String correctionContent;
	private String correctionUserId;
	private Date correctionDate; 
	private int correctionSee;
	private int correctionId;
	private int correctionResumeId;
	private int correctionCount;
	private int correctionCommentCount;
	
	
	
	public Correction(String correctionTitle, String correctionContent, String correctionUserId,
			Date correctionDate, int correctionSee, int correctionId, int correctionResumeId, int correctionCount,
			int correctionCommentCount) {
		super();
		this.correctionTitle = correctionTitle;
		this.correctionContent = correctionContent;
		this.correctionUserId = correctionUserId;
		this.correctionDate = correctionDate;
		this.correctionSee = correctionSee;
		this.correctionId = correctionId;
		this.correctionResumeId = correctionResumeId;
		this.correctionCount = correctionCount;
		this.correctionCommentCount = correctionCommentCount;
	}

	public Correction(String correctionTitle, String correctionContent,String correctionUserId,
			Date correctionDate, int correctionSee,  int correctionId,
			int correctionResumeId, int correctionCount) {
		super();
		this.correctionTitle = correctionTitle;
		this.correctionContent = correctionContent;
		this.correctionUserId = correctionUserId;
		this.correctionDate = correctionDate;
		this.correctionSee = correctionSee;
		this.correctionId = correctionId;
		this.correctionResumeId = correctionResumeId;
		this.correctionCount = correctionCount;
	}

	
	
	
	public Correction(String correctionUserId, int correctionId) {
		super();
		this.correctionUserId = correctionUserId;
		this.correctionId = correctionId;
	}

	public Correction() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public int getCorrectionCommentCount() {
		return correctionCommentCount;
	}

	public void setCorrectionCommentCount(int correctionCommentCount) {
		this.correctionCommentCount = correctionCommentCount;
	}

	public int getCorrectionCount() {
		return correctionCount;
	}

	public void setCorrectionCount(int correctionCount) {
		this.correctionCount = correctionCount;
	}

	public String getCorrectionUserId() {
		return correctionUserId;
	}

	public void setCorrectionUserId(String correctionUserId) {
		this.correctionUserId = correctionUserId;
	}

	public String getCorrectionTitle() {
		return correctionTitle;
	}

	public void setCorrectionTitle(String correctionTitle) {
		this.correctionTitle = correctionTitle;
	}

	public String getCorrectionContent() {
		return correctionContent;
	}

	public void setCorrectionContent(String correctionContent) {
		this.correctionContent = correctionContent;
	}

	

	public Date getCorrectionDate() {
		return correctionDate;
	}

	public void setCorrectionDate(Date correctionDate) {
		this.correctionDate = correctionDate;
	}

	public int getCorrectionSee() {
		return correctionSee;
	}

	public void setCorrectionSee(int correctionSee) {
		this.correctionSee = correctionSee;
	}


	public int getCorrectionId() {
		return correctionId;
	}

	public void setCorrectionId(int correctionId) {
		this.correctionId = correctionId;
	}

	public int getCorrectionResumeId() {
		return correctionResumeId;
	}

	public void setCorrectionResumeId(int correctionResumeId) {
		this.correctionResumeId = correctionResumeId;
	}
	
	
	public static class CorrectionBuilder{
		private String correctionTitle;
		private String correctionContent;
		private String correctionUserId;
		private Date correctionDate; 
		private int correctionSee;
		private int correctionId;
		private int correctionResumeId;
		private int correctionCount;
		private int correctionCommentCount;
		
		public CorrectionBuilder(){		
		}
		
		
		public CorrectionBuilder(String correctionUserId, int correctionId) {
			this.correctionUserId = correctionUserId;
			this.correctionId = correctionId;
		}


		public CorrectionBuilder setCorrectionTitle(String correctionTitle){
			this.correctionTitle = correctionTitle;
			return this;
		}
		
		public CorrectionBuilder setCorrectionContent(String correctionContent){
			this.correctionContent = correctionContent;
			return this;
		}
		
		
		public CorrectionBuilder setCorrectionUserId(String correctionUserId){
			this.correctionUserId = correctionUserId;
			return this;
		}
		
		public CorrectionBuilder setCorrectionDate(Date correctionDate){
			this.correctionDate = correctionDate;
			return this;
		}
		
		public CorrectionBuilder setCorrectionSee(int correctionSee){
			this.correctionSee = correctionSee;
			return this;
		}
		
		public CorrectionBuilder setCorrectionId(int correctionId){
			this.correctionId = correctionId;
			return this;
		}
		
		public CorrectionBuilder setCorrectionResumeId(int correctionResumeId){
			this.correctionResumeId = correctionResumeId;
			return this;
		}
		
		public CorrectionBuilder setCorrectionCount(int correctionCount){
			this.correctionCount = correctionCount;
			return this;
		}

		public CorrectionBuilder setCorrectionCommentCount(int correctionCommentCount){
			this.correctionCommentCount = correctionCommentCount;
			return this;
		}
		
		public Correction build(){
			return new Correction(this);
		}
		
	}
	
	public Correction(CorrectionBuilder builder){
		this.correctionTitle = builder.correctionTitle;
		this.correctionContent = builder.correctionContent;
		this.correctionCount = builder.correctionCount;
		this.correctionDate = builder.correctionDate;
		this.correctionId = builder.correctionId;
		this.correctionResumeId = builder.correctionResumeId;
		this.correctionSee = builder.correctionSee;
		this.correctionUserId = builder.correctionUserId;
		this.correctionCommentCount = builder.correctionCommentCount;

	}

	@Override
	public String toString() {
		return "Correction [correctionTitle=" + correctionTitle + ", correctionContent=" + correctionContent
				+ ", correctionUserId=" + correctionUserId + ", correctionDate=" + correctionDate + ", correctionSee="
				+ correctionSee + ", correctionId=" + correctionId + ", correctionResumeId=" + correctionResumeId
				+ ", correctionCount=" + correctionCount + ", correctionCommentCount=" + correctionCommentCount + "]";
	}
	

	
	
	
}
