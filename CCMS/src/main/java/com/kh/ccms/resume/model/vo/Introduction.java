package com.kh.ccms.resume.model.vo;

import java.io.Serializable;

public class Introduction implements Serializable , ResumeItem
{
	private static final long serialVersionUID = 1L;
	private int id;
	private int introId;
	private String title;
	private String content;
	
	public Introduction(){}

	/**
	 * @param id
	 * @param introId
	 * @param title
	 * @param content
	 */
	public Introduction(int id, int introId, String title, String content) {
		super();
		this.id = id;
		this.introId = introId;
		this.title = title;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIntroId() {
		return introId;
	}

	public void setIntroId(int introId) {
		this.introId = introId;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Introduction [id=" + id + ", introId=" + introId + ", Title=" + title + ", Content=" + content + "]";
	}
	
}
