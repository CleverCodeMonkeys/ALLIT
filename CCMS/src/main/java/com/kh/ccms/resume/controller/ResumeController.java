package com.kh.ccms.resume.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.resume.model.service.ResumeServiceImple;
import com.kh.ccms.resume.model.util.ResumeComplete;
import com.kh.ccms.resume.model.util.ResumeCompleteFactory;

@Controller
public class ResumeController 
{
	@Autowired
	ResumeServiceImple service;
	
	@RequestMapping(value ="/resume/resume.resume", method=RequestMethod.GET)
	public String gotoResume(@SessionAttribute(name = "m", required= false) Member m 
			, Model model , @RequestParam(value ="resumeId", required= false) String resumeId){
		String msg = (m != null) ?  "resume/resume" : "common/msg";
		
		ResumeComplete resume = null;
		String loc ="/";
		String error = "로그인을 해주세요.";
		
		if(resumeId != null){
			int id = Integer.parseInt(resumeId);
			resume = new ResumeCompleteFactory().createResumeComple(id, service);

			// Prevent Other User come into Resume Modify View
			if(!m.getId().equals(resume.getResume().getMemberId())){
				error = "접근 불가 합니다.";
				msg = "common/msg";
			}
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", error).addAttribute("resume", resume);
		return msg;
	}
	
	// Resume View
	@RequestMapping(value ="/resume/resumeView.resume", method=RequestMethod.GET)
	public String gotorResumeView(@RequestParam(value ="resumeId", required= false) String resumeId,
			 Model model, @SessionAttribute(name = "m", required= false) Member m){
		String msg = "";
		String loc ="/";
		String error = "이력서 선택이 되지 않았습니다.";
				
		if(resumeId == null || resumeId.equals("")){
			msg = "common/msg";
		}else{
			int id = Integer.parseInt(resumeId);
			ResumeComplete resume = new ResumeCompleteFactory().createResumeComple(id, service);
			
			// User who own Resume no need to Display, and if other user approach this view. 
			// Should Prevent show from other user.
			if(resume.getResume().getDisplay().equals("N")){
				// But Can Access User who own Resume.				
				boolean show = false;
				
				if(m != null && m.getId() != ""){
					if(resume.getResume().getMemberId().equals(m.getId())){
						model.addAttribute("resume", resume);
						show = true;
					}
				}
				
				msg = show ? "resumeView/resumeView" : "common/msg";
				error = "허용되지 않는 접근 입니다.";
			}
			else{
				model.addAttribute("resume", resume);
				msg = "resumeView/resumeView";
			}
		}
				
		model.addAttribute("loc", loc).addAttribute("msg", error);
		
		return msg;
	}
}
