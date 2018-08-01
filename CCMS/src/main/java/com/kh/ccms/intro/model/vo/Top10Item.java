package com.kh.ccms.intro.model.vo;

public class Top10Item extends IntroItem 
{
	private static final long serialVersionUID = 1L;
	
	private String mUrl;
	
	public Top10Item(){}
	
	public Top10Item(String mUrl){
		super();
		this.mUrl = mUrl;
	}

	public String getmUrl() {
		return mUrl;
	}

	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}
	
}
