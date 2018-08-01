package com.kh.ccms.myPage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.myPage.model.service.MyPageService;
import com.kh.ccms.myPage.model.vo.Profile;
import com.kh.ccms.resumeList.model.service.ResumeListService;

@Controller
@SessionAttributes("m")
public class MyPageController 
{	
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	ResumeListService resumeListService;
	
	@RequestMapping(value ="/member/myPage.do", method=RequestMethod.GET)
	public String gotoMyPage(@SessionAttribute("m") Member m,Model model)
	{
		int totalResume = myPageService.countResume(m.getId());
		System.out.println(totalResume);
		
		model.addAttribute("totalResume", totalResume);
		
		String msg = (m != null) ?  "member/myPage" : "redirect:/";	
		
		return msg;
	}
	
	
	@RequestMapping(value="/member/myResume.do", method=RequestMethod.GET)
	public String gotoMyResume(Model model,@SessionAttribute("m")Member m){
	
		
		if(m == null){
			model.addAttribute("msg","로그인 필요");
			return "common/msg";
		}
		
		List<Map<String,String>> list = resumeListService.selectResumeList(m.getId());
		
		
		model.addAttribute("list",list);
		
		return "member/myResume";
	}

	@RequestMapping(value="/member/saveProfile.do", method=RequestMethod.POST)
	public String saveProfile(HttpServletRequest req,
							  Profile profile,
							  @SessionAttribute("m")Member m
							  ){
		String name = req.getParameter("name");
		String age = req.getParameter("birth");		
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		
		
		String userId = m.getId();
		Profile pro = new Profile(null,m.getId(),name, age, email, gender,tel,address, null, null);
		
		System.out.println("CONTROLLER 확인 : "+ profile);
		System.out.println("CONTROLLER 확인 : "+ userId);
		
		
		int result = myPageService.saveProfile(profile,userId);
		
		req.setAttribute("pro", pro);
		
		return "member/myProfileResult";
		
		
	}
	
	@RequestMapping("/member/myProfile.do")
	public String gotoMyProfile(Model model,@SessionAttribute("m")Member m){
		Profile pro = myPageService.updateProfile(m.getId());
		System.out.println("CONTROLLER 확인 : "+ pro);
		model.addAttribute("pro",pro);
		
		return "member/myProfile";
		
		
	}
	
	@RequestMapping(value="/member/updateProfileEnd.do", method=RequestMethod.POST)
	public String updateDevEnd(Profile pro,@SessionAttribute("m")Member m,Model model){
		
		
		pro.setMember_id(m.getId());
				
		System.out.println("update한 Profile : "+pro);
		int result = myPageService.updateProfileSave(pro);
		
		model.addAttribute("pro",pro);
		
		return "member/myProfileResult";
	}

}
