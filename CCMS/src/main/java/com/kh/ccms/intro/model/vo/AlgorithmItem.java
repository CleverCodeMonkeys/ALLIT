package com.kh.ccms.intro.model.vo;

public class AlgorithmItem extends IntroItem 
{
	private static final long serialVersionUID = 1L;
	
	private String mUrl;
	private String mImage;
	
	public AlgorithmItem(){}
	
	public AlgorithmItem(String mUrl, String mImage){
		super();
		this.mUrl = mUrl;
		this.mImage = mImage;
	}
	
	public String getmImage() {
		return mImage;
	}

	public void setmImage(String mImage) {
		this.mImage = mImage;
	}

	public String getmUrl() {
		return mUrl;
	}

	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}
	
}
