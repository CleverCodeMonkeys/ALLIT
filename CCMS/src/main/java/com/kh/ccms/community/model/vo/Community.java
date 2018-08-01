package com.kh.ccms.community.model.vo;

import java.sql.Date;

public class Community 
{
	private int board_id;
	private String title;
	private String content;
	private String writer;
	private Date writer_date;
	private int see;
	private int comment_count;
	private String searchComu;
	private String searchSelect;
	


	public Community() {}

	public Community(int board_id, String title, String content, String writer, Date writer_date, int see,
			int comment_count) {
		super();
		this.board_id = board_id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writer_date = writer_date;
		this.see = see;
		this.comment_count = comment_count;
	}
	
	public Community(String searchComu, String searchSelect){
		this.searchComu = searchComu;
		this.searchSelect = searchSelect;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWriter_date() {
		return writer_date;
	}

	public void setWriter_date(Date writer_date) {
		this.writer_date = writer_date;
	}

	public int getSee() {
		return see;
	}

	public void setSee(int see) {
		this.see = see;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
	public String getSearchComu() {
		return searchComu;
	}
	
	public void setSearchComu(String searchComu) {
		this.searchComu = searchComu;
	}
	
	public String getSearchSelect() {
		return searchSelect;
	}
	
	public void setSearchSelect(String searchSelect) {
		this.searchSelect = searchSelect;
	}

	@Override
	public String toString() {
		return "Community [board_id=" + board_id + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", writer_date=" + writer_date + ", see=" + see + ", comment_count=" + comment_count + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + board_id;
		result = prime * result + comment_count;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + see;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((writer == null) ? 0 : writer.hashCode());
		result = prime * result + ((writer_date == null) ? 0 : writer_date.hashCode());
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
		Community other = (Community) obj;
		if (board_id != other.board_id)
			return false;
		if (comment_count != other.comment_count)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (see != other.see)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (writer == null) {
			if (other.writer != null)
				return false;
		} else if (!writer.equals(other.writer))
			return false;
		if (writer_date == null) {
			if (other.writer_date != null)
				return false;
		} else if (!writer_date.equals(other.writer_date))
			return false;
		return true;
	}
	
	
	
	
	
}
