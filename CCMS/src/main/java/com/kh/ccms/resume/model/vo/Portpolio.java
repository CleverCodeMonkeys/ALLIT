package com.kh.ccms.resume.model.vo;

import java.io.Serializable;

public class Portpolio implements Serializable, ResumeItem
{
	private static final long serialVersionUID = 1L;
	private int id;
	private int portId;
	private String url;
	private String data;
	
	public Portpolio(){}

	/**
	 * @param id
	 * @param portId
	 * @param url
	 * @param data
	 */
	public Portpolio(int id, int portId, String url, String data) {
		super();
		this.id = id;
		this.portId = portId;
		this.url = url;
		this.data = data;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPortId() {
		return portId;
	}

	public void setPortId(int portId) {
		this.portId = portId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Portpolio [id=" + id + ", portId=" + portId + ", url=" + url + ", data=" + data + "]";
	}
	
	
}
