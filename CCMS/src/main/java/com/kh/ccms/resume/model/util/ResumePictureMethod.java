package com.kh.ccms.resume.model.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class ResumePictureMethod
{
	public ResumePictureMethod(){}
	
	public String SavePicture(String memberId, MultipartFile f , HttpServletRequest request){
		String result = null;
		
		if(memberId == null || memberId.equals("") || f == null){
			return result;
		}
		
		 //파일 저장 경로 생성하기 [유저 아이디]
		 String saveDir = request.getSession().getServletContext().
				 getRealPath("/resources/uploadFiles/picture") + "/" + memberId;
		 
		 File dir = new File(saveDir);
		 
		 // If not
		 if(!dir.exists()) {
			 dir.mkdirs();			 
		 }
		
		 String originFileName = f.getOriginalFilename();
		 
		 String ext = originFileName.substring(originFileName.lastIndexOf(".") + 1);
		 
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		 
		 int randomNum = (int)(Math.random() * 1000);
		 
		 String renameFileName = sdf.format(new Date(System.currentTimeMillis())) +"_" +
				 randomNum + "_" + "." + ext;
		 
		 // Save Singleton
		 TempPictureMemorize memorize = TempPictureMemorize.getInstance();
		 memorize.setPictureName(renameFileName);
		 
		 try{
			 f.transferTo(new File(saveDir + "/" + renameFileName));
			 result = renameFileName;
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		
		return result;
	}
	
	// Remove Picture Method.
	public boolean removePicture(String memberId , HttpServletRequest request, String fileName)
	{
		boolean result = false;
		
		if(memberId == null || memberId.equals(""))
			return result;
		
		String loadDir = request.getSession().getServletContext().
				 getRealPath("/resources/uploadFiles/picture") + "/" + memberId;
		
		 File dir = new File(loadDir);
		 
		 if(!dir.exists()) return result;
		 
		 File[] file = dir.listFiles();
		 for(File f : file){
			 if(f.getName().equals(fileName)){
				 f.delete();
				 result = true;
				 break;
			 }
		 }
		
		return result;
	}
	
	// remove Folder
	public boolean removeUserFile(String memberId , HttpServletRequest request)
	{
		boolean result = false;
		
		if(memberId == null || memberId.equals(""))
			return result;
		
		String loadDir = request.getSession().getServletContext().
				 getRealPath("/resources/uploadFiles/picture") + "/" + memberId;
		
		 File dir = new File(loadDir);
		 
		 if(!dir.exists()) return result;
		 		
		return dir.delete();
	}
	

}
