package com.kh.ccms.intro.model.vo;

import java.io.Serializable;

public abstract class IntroItem implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int mItemID;
	private String mItemTitle;
	private String mItemContent;
	
	public IntroItem(){}
	
	public int getmItemID() {
		return mItemID;
	}
	
	public void setmItemID(int mItemID) {
		this.mItemID = mItemID;
	}
	
	public String getmItemTitle() {
		return mItemTitle;
	}
	
	public void setmItemTitle(String mItemTitle) {
		this.mItemTitle = mItemTitle;
	}
	
	public String getmItemContent() {
		return mItemContent;
	}
	
	public void setmItemContent(String mItemContent) {
		this.mItemContent = mItemContent;
	}
	
}
