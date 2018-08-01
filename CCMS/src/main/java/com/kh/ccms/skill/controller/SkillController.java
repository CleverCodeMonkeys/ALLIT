package com.kh.ccms.skill.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.skill.model.exception.SkillException;
import com.kh.ccms.skill.model.service.CommentSService;
import com.kh.ccms.skill.model.service.SkillService;
import com.kh.ccms.skill.model.vo.Skill;

@Controller
public class SkillController 
{
	@Autowired
	SkillService skillService;
	
	@Autowired
	CommentSService commentSService;
	
	// 게시글 리스트 보기
	@RequestMapping(value ="/skill/skill.ski")
	public String gotoSkill(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model)
	{
		int numPerPage = 10;
		
		List<Map<String, String>> list = skillService.selectSkillList(cPage, numPerPage);
		
		int totalContents = skillService.selectSkillTotalContents();
		
		model.addAttribute("list", list).addAttribute("numPerPage", numPerPage)
			 .addAttribute("totalContents", totalContents);
		
		return "skill/skillList";
	}
	
	// 게시글 한 개 보기
	@RequestMapping(value="/skill/skillOneView.ski")
	public String selectskillOneView(@RequestParam("no") int board_id, Model model)
	{
		skillService.increaseSkillSee(board_id);
		
		List<Map<String, String>> list = commentSService.commentList(board_id);
		
		int comment_count = skillService.selectCommentSCount(board_id);

		
		model.addAttribute("skill", skillService.selectSkillOneView(board_id))
		.addAttribute("list", list).addAttribute("comment_count", comment_count);
		
		return "skill/skillOneView";
	}
	
	// 게시글 한 개 등록 페이지
	@RequestMapping(value="skill/skillForm.ski")
	public String skillForm(@SessionAttribute(name = "m", required= false) Member m, Model model)
	{
		String msg = (m != null) ? "skill/skillForm" : "common/msg";
		
		String loc = "/skill/skill.ski";
		String error = "로그인을 해주세요.";
		
		model.addAttribute("loc", loc).addAttribute("msg", error);
		return msg;
	}
	
	// 게시글 한 개 등록하기
	@RequestMapping(value="skill/skillInsert.ski", method = RequestMethod.POST)
	public String skillInsert(Skill skill, Model model, @SessionAttribute(name = "m", required= false) Member m)
	{
		int result;
		
		if(m == null) {
			model.addAttribute("msg", "로그인 안되어있음").addAttribute("loc", "/");
			return "common/msg";
		}
		
		skill.setWriter(m.getId());
		
		try {
			
			result = skillService.skillInsert(skill);	
			
		} catch (Exception e) {
			throw new SkillException("error");
		}
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) 
		{
			msg = "게시글 등록 성공!!";
			loc = "/skill/skill.ski";
			
		} else {
			
			msg = "게시글 등록 실패!!";
			
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping(value="/skill/skillUpdateForm.ski")
	public String communityUpdateForm(@RequestParam("no") int board_id, Model model)
	{
		model.addAttribute("skill", skillService.skillUpdateForm(board_id));
		
		return "skill/skillUpdate";
	}
	
	// 게시글 수정하기
		@RequestMapping(value="/skill/skillUpdateEnd.ski")
		public String skillUpdateEnd(Skill skill, Model model)
		{
			int result = 0;
			
			result = skillService.skillUpdateEnd(skill);
			
			String loc ="/";
			String msg = "";
			
			if(result > 0) 
			{
				msg = "게시글 수정 성공!!";
				loc = "/skill/skill.ski";
				
			} else {
				
				msg = "게시글 수정 실패!!";
				
			}
			
			model.addAttribute("msg", msg).addAttribute("loc", loc);
			
			return "common/msg";
		}
		
		// 게시글 삭제하기
		@RequestMapping(value="/skill/skillDelete.ski")
		public String skillDelete(@RequestParam("no") int board_id, Model model)
		{
			int result = 0;
			
			result = skillService.skillDelete(board_id);

			String loc = "/";
			String msg = "";
			
			if(result > 0)
			{
				msg = "삭제 성공!";
				loc = "/skill/skill.ski";
				
			} else {
				msg = "삭제 실패!";
			}
			
			model.addAttribute("loc", loc).addAttribute("msg", msg);
			
			return "common/msg";
		}
		
		// 게시글 검색하기
		@RequestMapping(value="/skill/skillSearch.ski")
		public String skillSearch(@RequestParam(value="cPage", required=false, defaultValue="1")
		int cPage, Model model, @RequestParam("searchSki") String searchSki, @RequestParam("searchSelect") String searchSelect)
		{
			int numPerPage = 10;
		
			List<Map<String, String>> list = skillService.selectSkillSearch(cPage, numPerPage, searchSki, searchSelect);
			
			int totalContents = skillService.selectSkillTotalContentsSer(searchSki);
			
			model.addAttribute("list", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
			
			return "skill/skillList";
		}
}
