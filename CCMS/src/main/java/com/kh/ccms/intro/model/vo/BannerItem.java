package com.kh.ccms.intro.model.vo;

public class BannerItem extends IntroItem
{
	private static final long serialVersionUID = 1L;
	
	private String mUrl;
	
	public BannerItem(){}
	
	public BannerItem(String mUrl){
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
