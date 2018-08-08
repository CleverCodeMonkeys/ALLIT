package com.kh.ccms.correction.pictureHandler;

import java.io.File;

public class PictureDelete {
	public static void deleteAllFiles(String path){
	
		File file = new File(path);
		
		//폴더 안의 파일 배열로 가져온다
		File[] delFile = file.listFiles();
		if(delFile != null)
		if(delFile.length>0){
			for(int i=0; i < delFile.length; i++){
				if(delFile[i].isFile()){
					delFile[i].delete();
				}else{
					deleteAllFiles(delFile[i].getPath());
				}
				delFile[i].delete();
			}
			file.delete();
		}
		
	}
}
