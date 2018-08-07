package com.kh.ccms.correction.pictureHandler;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class PictureSave {
	
	public void saveRealDate(String content, HttpServletRequest req, String id, int cId, PictureHandler handler){
		 		
		for(int i=0; i<handler.getRealSaveName().size(); i++){
			if(!content.contains(handler.getRealSaveName().get(i))){
				String saveTempDir = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload/temp/")+id+"/rTemp"+ '\\' +handler.getRealSaveName().get(i);
				File file = new File(saveTempDir);
				file.delete();
				
				
			} else {
				//폴더 생성할 이름
				String folderName = id;
				
				//각 아이디 별 폴더 분류
				int correctionId = cId;
				
				//진짜 디렉토리에 생성할 이름 
				String fileName = handler.getRealSaveName().get(i);
				
				//temp파일에서 진짜 디렉토리로 옮겨질  data위치 
				String beforeFilePath = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload/temp/")+id+"/rTemp"+  '\\' +handler.getRealSaveName().get(i);
				
				//temp파일이 옮겨질  경로
				String afterFilePath = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload");
				
				String path =  afterFilePath+"/"+folderName+"/"+correctionId;
				String filePath = path+"/"+fileName;
				
				File dir = new File(path);
				
				if(!dir.exists()) dir.mkdirs();
			
				try{
					File file = new File(beforeFilePath);
					if(file.renameTo(new File(filePath))) System.out.println("파일 이동 성공");
					else System.out.println("파일 이동 실패");
						
					
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
		}
	}
	

	/*public void deleteData(HttpServletRequest req, int cId, String userId){
		// 삭제할 폴더 path
		String path = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload/")+userId+"/"+cId;
		
		File file = new File(path);
		//폴더 내 파일 배열
		File[] deleteFile = file.listFiles();
		
		if(deleteFile.length>0){
			
		}
	}*/
}
