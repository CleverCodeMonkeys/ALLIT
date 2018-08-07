package com.kh.ccms.correction.realSavePicture;

import java.util.ArrayList;
import java.util.List;

public class PictureHandler {
	private static PictureHandler instance = null;
	private static List<String> realSaveName= new ArrayList<String>();
	
	private PictureHandler(){}

	public static synchronized PictureHandler getInstance(){
		if(instance == null){
			instance = new PictureHandler();
		}
		return instance;
	}


	public  List<String> getRealSaveName() {
		return realSaveName;
	}

	public  void setRealSaveName(List<String> realSaveName) {
		PictureHandler.realSaveName = realSaveName;
	}
	
	
	
	
}
