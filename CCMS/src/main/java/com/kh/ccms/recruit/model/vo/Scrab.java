package com.kh.ccms.recruit.model.vo;

public class Scrab implements java.io.Serializable {

	private static final long serialVersionUID = 2222L;
	
	private String id;
	private int rId;
	
	public Scrab() {
		super();
	}

	public Scrab(String id, int rId) {
		super();
		this.id = id;
		this.rId = rId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	@Override
	public String toString() {
		return "Scrab [id=" + id + ", rId=" + rId + "]";
	}
	
}
