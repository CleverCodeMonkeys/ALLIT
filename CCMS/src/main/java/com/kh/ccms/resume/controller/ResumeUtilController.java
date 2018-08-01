package com.kh.ccms.resume.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.resume.model.service.ResumeServiceImple;
import com.kh.ccms.resume.model.util.SaveResumeFactory;
import com.kh.ccms.resume.model.util.UpdateResumeFactory;

@Controller
public class ResumeUtilController 
{
	@Autowired ResumeServiceImple service;
	
	@RequestMapping(value="/resume/saveResume.resume", method=RequestMethod.POST)
	public String saveResume(HttpServletRequest req, Model model ,
			@SessionAttribute(name = "m", required= false) Member m ){
		
		int result = 0;
		
		// Make New Resume.
		String distinguish = req.getParameter("modifyResume");
		if(distinguish == null || distinguish == ""){
			try{
				result = new SaveResumeFactory(req, service, m.getId()).insertIntoFactory();
			}catch(Exception e){				
				model.addAttribute("msg", "잘못된 접근입니다.").addAttribute("loc", "/");				
				return "common/msg";
			}
		}else{
			try{
				int resumeId = Integer.parseInt(distinguish);
				result = new UpdateResumeFactory(req, service, resumeId, m.getId()).updateIntoFactory();
			}catch(Exception e){
				model.addAttribute("msg", "수정이 잘못되었습니다.").addAttribute("loc", "/");
				e.printStackTrace();
				return "common/msg";
			}
		}
		// Modify Resume.
		
		String msg = result > 0 ? "성공적으로 저장이 되었습니다." : "저장 실패했습니다.";
		
		model.addAttribute("loc", "/resumeList/resumeList.resume");
		model.addAttribute("msg" , msg);
		
		return "common/msg";
	}
	
	// File Upload [Image]
	@ResponseBody
	@RequestMapping(value="/resume/saveImage.resume", method=RequestMethod.POST)
	public Map<String, Object> saveImage(
			@RequestParam(value = "files", required=false) MultipartFile[] files
			,HttpServletRequest request,
			Model model){
		 Map<String,Object> map = new HashMap<>();
		 
		 //파일 저장 경로 생성하기
		 String saveDir = request.getSession().getServletContext().
				 getRealPath("/resources/uploadFiles/picture");
		 File dir = new File(saveDir);
		 System.out.println(dir);
		 for(MultipartFile f: files){
			 System.out.println("들어옴");
			 String originFileName = f.getOriginalFilename();
			 System.out.println("파일 이름:" + originFileName);
		 }
		 System.out.println("완료");
		 
		 return map;
	}
	
}
