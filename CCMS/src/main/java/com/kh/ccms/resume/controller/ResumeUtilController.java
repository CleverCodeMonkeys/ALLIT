package com.kh.ccms.resume.controller;

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

import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.resume.model.service.ResumeServiceImple;
import com.kh.ccms.resume.model.util.SaveResumeFactory;
import com.kh.ccms.resume.model.util.TempPictureMemorize;
import com.kh.ccms.resume.model.util.UpdateResumeFactory;

@Controller
public class ResumeUtilController 
{
	@Autowired ResumeServiceImple service;
	
	@RequestMapping(value="/resume/saveResume.resume", method=RequestMethod.POST)
	public String saveResume(HttpServletRequest req, Model model ,
			@RequestParam(value = "file", required=false) MultipartFile[] files,
			@SessionAttribute(name = "m", required= false) Member m){
		
		int result = 0;

		// Make New Resume.
		String distinguish = req.getParameter("modifyResume");
		if(distinguish == null || distinguish.equals("")){
			try{
				result = new SaveResumeFactory(req, service, m.getId(), files[0]).insertIntoFactory();
			}catch(Exception e){
				e.printStackTrace();
				model.addAttribute("msg", "잘못된 접근입니다.").addAttribute("loc", "/");				
				return "common/msg";
			}
		}else{
			try{
				int resumeId = Integer.parseInt(distinguish);
				result = new UpdateResumeFactory(req, service, resumeId, m.getId() , files[0]).updateIntoFactory();
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
			@RequestParam(value = "file", required=false) MultipartFile[] files
			,HttpServletRequest request,
			Model model,
			@SessionAttribute(name = "m", required= false) Member m){
		 Map<String,Object> map = new HashMap<>();
				 
		 // Prevent Data File.
		 if(m == null){
			 map.put("fail", "fail");
			 return map;
		 }
		 
		 boolean result = false;
		 		 
		 // Save Singleton Method
		 TempPictureMemorize memorize = TempPictureMemorize.getInstance();
		 
		 // [WARNNING] This method hope to get One MultipartFile.
		 for(MultipartFile f: files){
			 memorize.setBeforeName(f.getOriginalFilename());
			 memorize.setPictureName(""); // Not yet Setting. When you click to Save Button. Will be Save.
			 result = true;
		 }
		
		 map.put("result", result);
		 
		 return map;
	}
	
}
