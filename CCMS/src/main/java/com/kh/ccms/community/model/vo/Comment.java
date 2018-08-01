package com.kh.ccms.community.model.vo;

import java.sql.Date;

public class Comment 
{
	private int board_id;
	private int comment_id;
	private String comment_content;
	private String writer_id;
	private Date writer_date;	

	public Comment() {}

	public Comment(int board_id, int comment_id, String comment_content, String writer_id, Date writer_date) 
	{
		super();
		this.board_id = board_id;
		this.comment_id = comment_id;
		this.comment_content = comment_content;
		this.writer_id = writer_id;
		this.writer_date = writer_date;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public Date getWriter_date() {
		return writer_date;
	}

	public void setWriter_date(Date writer_date) {
		this.writer_date = writer_date;
	}
	
	@Override
	public String toString() {
		return "Comment [board_id=" + board_id + ", comment_id=" + comment_id + ", comment_content=" + comment_content
				+ ", writer_id=" + writer_id + ", writer_date=" + writer_date + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + board_id;
		result = prime * result + ((comment_content == null) ? 0 : comment_content.hashCode());
		result = prime * result + comment_id;
		result = prime * result + ((writer_date == null) ? 0 : writer_date.hashCode());
		result = prime * result + ((writer_id == null) ? 0 : writer_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		if (board_id != other.board_id)
			return false;
		if (comment_content == null) {
			if (other.comment_content != null)
				return false;
		} else if (!comment_content.equals(other.comment_content))
			return false;
		if (comment_id != other.comment_id)
			return false;
		if (writer_date == null) {
			if (other.writer_date != null)
				return false;
		} else if (!writer_date.equals(other.writer_date))
			return false;
		if (writer_id == null) {
			if (other.writer_id != null)
				return false;
		} else if (!writer_id.equals(other.writer_id))
			return false;
		return true;
	}

	
	
	
}
