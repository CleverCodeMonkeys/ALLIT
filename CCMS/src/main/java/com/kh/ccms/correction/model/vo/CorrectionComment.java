package com.kh.ccms.correction.model.vo;

import java.sql.Date;

public class CorrectionComment {
	private int correctionId;
	private int commentId;
	private String commentContent;
	private String commentUserId;
	private Date commentDate;
	
	
	
	public CorrectionComment() {
		super();
		// TODO Auto-generated constructor stub
	}



	public CorrectionComment(int correctionId, int commentId, String commentContent, String commentUserId,
			Date commentDate) {
		super();
		this.correctionId = correctionId;
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.commentUserId = commentUserId;
		this.commentDate = commentDate;
	}



	public int getCorrectionId() {
		return correctionId;
	}



	public void setCorrectionId(int correctionId) {
		this.correctionId = correctionId;
	}



	public int getCommentId() {
		return commentId;
	}



	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}



	public String getCommentContent() {
		return commentContent;
	}



	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}



	public String getCommentUserId() {
		return commentUserId;
	}



	public void setCommentUserId(String commentUserId) {
		this.commentUserId = commentUserId;
	}



	public Date getCommentDate() {
		return commentDate;
	}



	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	public static class CorrectionCommentBuilder{
		private int correctionId;
		private int commentId;
		private String commentContent;
		private String commentUserId;
		private Date commentDate;
		
		public CorrectionCommentBuilder(){
			
		}
		
		
		
		public CorrectionCommentBuilder(int correctionId, String commentContent, String commentUserId) {
			super();
			this.correctionId = correctionId;
			this.commentContent = commentContent;
			this.commentUserId = commentUserId;
		}


		public CorrectionCommentBuilder setCorrectionId(int correctionId){
			this.correctionId = correctionId;
			return this;
		}
		
		public CorrectionCommentBuilder setCommentId(int commentId){
			this.commentId = commentId;
			return this;
		}
		
		public CorrectionCommentBuilder setCommentContent(String commentContent){
			this.commentContent = commentContent;
			return this;
		}
		
		public CorrectionCommentBuilder setCommentUserId(String commentUserId){
			this.commentUserId = commentUserId;
			return this;
		}
		
		public CorrectionCommentBuilder setCommentDate(Date commentDate){
			this.commentDate = commentDate;
			return this;
		}
		
		public CorrectionComment build(){
			return new CorrectionComment(this);
		}
	}
	
	public CorrectionComment(CorrectionCommentBuilder builder){
		this.commentContent = builder.commentContent;
		this.commentDate = builder.commentDate;
		this.commentId = builder.commentId;
		this.commentUserId = builder.commentUserId;
		this.correctionId = builder.correctionId;
	}
	
}
