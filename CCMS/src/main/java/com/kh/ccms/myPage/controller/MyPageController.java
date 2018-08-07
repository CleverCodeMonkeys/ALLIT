package com.kh.ccms.myPage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ccms.community.model.service.CommunityService;
import com.kh.ccms.correction.model.service.CorrectionService;
import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.myPage.model.service.MyPageService;
import com.kh.ccms.myPage.model.util.PercadeDelete;
import com.kh.ccms.myPage.model.vo.Profile;
import com.kh.ccms.recruit.model.service.RecruitService;
import com.kh.ccms.resumeList.model.service.ResumeListService;
import com.kh.ccms.skill.model.service.SkillService;

@Controller
@SessionAttributes("m")
public class MyPageController {
	@Autowired
	CommunityService communityService;

	@Autowired
	SkillService skillService;

	@Autowired
	MyPageService myPageService;

	@Autowired
	ResumeListService resumeListService;
	
	@Autowired
	CorrectionService correctionService;
	
	@Autowired
	RecruitService recruitService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "/member/myPage.do", method = RequestMethod.GET)
	public String gotoMyPage(@SessionAttribute("m") Member m, Model model) {
		int totalResume = myPageService.countResume(m.getId());
		int totalComm = myPageService.countComm(m.getId());
		int totalSkill = myPageService.countSkill(m.getId());
		int totalCorr = myPageService.countCorr(m.getId());
		int totalScrab= recruitService.selectScrabTotalContents(m.getId());

		System.out.println("totalCorr : " + totalCorr);
		System.out.println("totalScrab : " + totalScrab);
		System.out.println("여기왔냐고");
		model.addAttribute("totalResume", totalResume)
			 .addAttribute("totalComm", totalComm)
			 .addAttribute("totalSkill", totalSkill)
			 .addAttribute("totalCorr",totalCorr)
			 .addAttribute("totalScrab",totalScrab)
			 .addAttribute("page", "home");

		String msg = (m != null) ? "member/myPage" : "redirect:/";

		return msg;
	}

	@RequestMapping(value = "/member/myResume.do", method = RequestMethod.GET)
	public String gotoMyResume(Model model, @SessionAttribute("m") Member m) {

		if (m == null) {
			model.addAttribute("msg", "로그인 필요");
			return "common/msg";
		}

		List<Map<String, String>> list = resumeListService.selectResumeList(m.getId());

		model.addAttribute("list", list).addAttribute("page", "resume");

		return "member/myResume";
	}

	// 게시글 리스트 보기
	@RequestMapping(value = "/member/myComm.do")
	public String gotoCommunity(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, @SessionAttribute("m") Member m) {
		int numPerPage = 10;

		List<Map<String, String>> list = myPageService.selectCommunityList(cPage, numPerPage, m.getId());

		int totalContents = myPageService.selectCommunityTotalContents(m.getId());

		model.addAttribute("list", list).addAttribute("numPerPage", numPerPage)
				.addAttribute("totalContents", totalContents).addAttribute("page", "community");

		return "member/myCommunity";
	}

	// 게시글 검색하기
	@RequestMapping(value = "/member/communitySearch.do")
	public String communitySearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, @RequestParam("searchComu") String searchComu, @SessionAttribute("m") Member m,
			@RequestParam("searchSelect") String searchSelect) {
		int numPerPage = 10;

		List<Map<String, String>> list = myPageService.selectCommunitySearch(cPage, numPerPage, searchComu,
				searchSelect, m.getId());

		int totalContents = myPageService.selectCommunityTotalContentsSer(searchComu, m.getId());

		model.addAttribute("list", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents",
				totalContents);

		return "member/myCommunity";
	}

	// 게시글 리스트 보기
	@RequestMapping(value = "/member/mySkill.do")
	public String gotoSkill(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			@SessionAttribute("m") Member m) {
		int numPerPage = 10;

		List<Map<String, String>> list = myPageService.selectSkillList(cPage, numPerPage, m.getId());

		int totalContents = myPageService.selectSkillTotalContents(m.getId());

		model.addAttribute("list", list).addAttribute("numPerPage", numPerPage)
				.addAttribute("totalContents", totalContents).addAttribute("page", "skill");

		return "member/mySkill";
	}

	// 게시글 검색하기
	@RequestMapping(value = "/member/skillSearch.do")
	public String skillSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, @RequestParam("searchSki") String searchSki, @SessionAttribute("m") Member m,
			@RequestParam("searchSelect") String searchSelect) {
		int numPerPage = 10;

		List<Map<String, String>> list = myPageService.selectSkillSearch(cPage, numPerPage, searchSki, searchSelect,
				m.getId());

		int totalContents = myPageService.selectSkillTotalContentsSer(searchSki, m.getId());

		model.addAttribute("list", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents",
				totalContents);

		return "member/mySkill";
	}

	@RequestMapping(value = "/member/saveProfile.do", method = RequestMethod.POST)
	public String saveProfile(HttpServletRequest req, Profile profile, @SessionAttribute("m") Member m) {
		String name = req.getParameter("name");
		String age = req.getParameter("birth");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");

		String userId = m.getId();
    
		Profile pro = new Profile(null,m.getId(),name, age, email, gender,tel,address, null, null);
		
		myPageService.saveProfile(profile,userId);
		
		req.setAttribute("pro", pro);

		return "member/myProfileResult";

	}

	@RequestMapping("/member/myProfile.do")
	public String gotoMyProfile(Model model, @SessionAttribute("m") Member m) {
		Profile pro = myPageService.updateProfile(m.getId());

		model.addAttribute("pro", pro).addAttribute("page", "profile");

		return "member/myProfile";

	}

	@RequestMapping(value = "/member/updateProfileEnd.do", method = RequestMethod.POST)
	public String updateDevEnd(Profile pro, @SessionAttribute("m") Member m, Model model) {

		pro.setMember_id(m.getId());

		myPageService.updateProfileSave(pro);
    
		model.addAttribute("pro",pro);
		
		return "member/myProfileResult";
	}

	@RequestMapping("/member/gotoDelete.do")
	public String gotoDeleteMember(Model model) {

		model.addAttribute("page", "delete");

		return "member/deleteMember";
	}

	@RequestMapping("/member/deleteMember.do")
	public String deleteMember(HttpServletRequest req, @SessionAttribute("m") Member m) {
		String password = req.getParameter("password");
		String msg = "";
		/*if(m.getPassword().equals(password)){*/
		if(bcryptPasswordEncoder.matches(password, m.getPassword())){
			myPageService.deleteMember(m.getId());
		
			// 1. ALL DB DELETE & 2. ALL FILE DELETE
			PercadeDelete percade = new PercadeDelete();			
			percade.excutePercade(communityService, skillService, correctionService, recruitService, resumeListService, m , req);
			
			msg = "redirect:/member/memberLogout.do";
		} else {
			msg = "common/error";
		}

		return msg;
	}
	
	@RequestMapping("/member/myCorr.do")
	public String gotoCorrection(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage,Model model,@SessionAttribute("m") Member m){
		//@RequestParam으로 페이징 버튼을 눌렀을 때 누른 페이지 값을 가져오며 처음 페이지에 도작했을 경우에는 default값 1을 준다.
		//기본 정렬은 최신순으로 한다.
		
		//한 페이지에  10개 보여줄 꺼임
		int numPerPage = 5;
		
		//글 총 개수 (검색어 포함)
		int totalContents = myPageService.selectCorrectionTotalContents(m.getId());
		
		// 글 리스트 불러오기(최신순) 위에서 쓰는거  기본은 최신순이니까

		List<Map<String, String>> list = myPageService.selectCorrectionList(cPage,numPerPage,m.getId());
		
		model.addAttribute("list", list)
			 .addAttribute("numPerPage",numPerPage)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("page", "correction");
		
			
		  return "member/myCorrection";
		
		
	}

}
