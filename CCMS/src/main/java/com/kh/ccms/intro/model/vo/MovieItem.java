package com.kh.ccms.intro.model.vo;

public class MovieItem extends IntroItem
{
	private static final long serialVersionUID = 1L;
	
	private String mUrl;
	
	public MovieItem(){}
	
	public MovieItem(String mUrl){
		super();
		this.mUrl = mUrl;
	}

	public String getmUrl() {
		return mUrl;
	}

	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
