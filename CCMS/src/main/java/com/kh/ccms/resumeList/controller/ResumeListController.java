package com.kh.ccms.resumeList.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.resume.model.util.ResumePictureMethod;
import com.kh.ccms.resume.model.vo.Resume;
import com.kh.ccms.resumeList.model.service.ResumeListService;

@Controller
public class ResumeListController {
	
	@Autowired
	ResumeListService resumeListService;
	
	@RequestMapping("/resumeList/resumeList.resume")
	public String selectResumeList(Model model, @SessionAttribute(name = "m", required= false) Member m
			){
		
		if(m == null){
			model.addAttribute("msg","로그인 필요");
			return "common/msg";
		}
		
		
		List<Map<String,String>> list = resumeListService.selectResumeList(m.getId());
		
		
		model.addAttribute("list",list);
		
		return "resumeList/resumeList";
		
	}
	
	
	@RequestMapping("/resumeList/deleteResume.resume")
	public String deleteResume(@RequestParam int id, Model model 
			, @SessionAttribute(name = "m", required= false) Member m,
			HttpServletRequest request){
		
		if(m == null || m.equals("")) {
			model.addAttribute("msg","권한 없음.").addAttribute("loc","/");
			return "common/msg";
		}
		
		if(id < 0){
			model.addAttribute("msg","잘못된 삭제").addAttribute("loc","/");
			return "common/msg";
		}
				
		//Add Delete Image File. [2018-07-30] [START]
		Resume resume = resumeListService.selectOneResume(id);
		if(resume != null){
			ResumePictureMethod method = new ResumePictureMethod();	
			method.removePicture(m.getId(), request, resume.getPhoto());
		}
		//Add Delete Image File. [2018-07-30] [END]
		
		int result = resumeListService.deleteResume(id);
		
		if(result > 0)
		   return "redirect:/resumeList/resumeList.resume";
		else{
			model.addAttribute("msg","삭제 실패").addAttribute("loc","resumeList/resumeList.resume");
			return "common/msg";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/resumeList/displayResume.resume" , method=RequestMethod.POST)
	public Map<String,Object> displayResume(@RequestParam(value ="chk") String chk,
							 @RequestParam(value="id") int id){
		Map<String,Object> map = new HashMap<>();
	
		Resume resume = new Resume();
		resume.setId(id);
		resume.setDisplay(chk);
		
		int result = resumeListService.displayResume(resume);
		
		boolean success = result > 0 ? true : false; 
		map.put("success", success);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/resumeList/filterResume.resume" , method=RequestMethod.POST)
	public Map<String,Object> filterResume(@SessionAttribute(name = "m", required= false) Member m,
										    @RequestParam("chk") String chk){
		
		Map<String,Object> map = new HashMap<>();
	
		List<Resume> list = resumeListService.filterResume(m.getId(),chk);
		
		map.put("list", list);
				
		return map;
	}
	
	
}
