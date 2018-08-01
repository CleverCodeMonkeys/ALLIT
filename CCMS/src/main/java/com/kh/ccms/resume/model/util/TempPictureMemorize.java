package com.kh.ccms.resume.model.util;

public class TempPictureMemorize 
{
	private String beforeName = "";
	private String pictureName = "";

	// Initialization on demand holder idiom.
	private TempPictureMemorize(){
		
	}
	
	private static class Singleton{
		private static final TempPictureMemorize INSTANCE = new TempPictureMemorize(); 
	}
	
	public static TempPictureMemorize getInstance(){
		return Singleton.INSTANCE;
	}
	
	public void setPictureName(String pictureName){
		this.pictureName = pictureName;
	}
	
	public String getPictureName(){
		return this.pictureName;
	}
		
	public String getBeforeName() {
		return beforeName;
	}

	public void setBeforeName(String beforeName) {
		this.beforeName = beforeName;
	}
	
	public void initialize()
	{
		this.beforeName = "";
		this.pictureName = "";
	}

}
