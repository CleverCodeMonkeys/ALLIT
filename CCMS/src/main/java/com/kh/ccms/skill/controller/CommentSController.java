package com.kh.ccms.skill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.skill.model.exception.SkillException;
import com.kh.ccms.skill.model.service.CommentSService;
import com.kh.ccms.skill.model.vo.CommentS;
import com.kh.ccms.skill.model.vo.Skill;

@Controller
public class CommentSController 
{
	@Autowired
	CommentSService commentSService;
	
	@RequestMapping(value="skill/commentSInsert.comm")
	public String commentInsert(CommentS comment, Model model, @SessionAttribute(name = "m", required= false) Member m,
			Skill skill)
	{
		int result;
		
		System.out.println(comment);
		
		if(m == null) {
			
			model.addAttribute("msg", "로그인 해주세요.").addAttribute("loc", "/");
			
			return "common/msg";
			
		}
		
		comment.setWriter_id(m.getId());
		
		try {
			
			result = commentSService.commentSInsert(comment);	
			
		} catch (Exception e) {
			
			throw new SkillException("error");
			
		}
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) 
		{
			loc = "/skill/skillOneView.ski?no=" + skill.getBoard_id();
			
			msg = "댓글 등록 성공";
			
		} else {
			
			msg = "댓글 등록 실패!!";
			
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping(value="skill/commentSUpdat.comm")
	public String commentUpdate(@RequestParam("co") String comment, @RequestParam("bo") int comment_id ,Model model, Skill skill)
	{
		int result;

		CommentS co = new CommentS();
		
		co.setComment_content(comment);
		co.setComment_id(comment_id);
		
		try {
			
			result = commentSService.commentSUpdate(co);	
			
		} catch (Exception e) {
			
			throw new SkillException("error");
			
		}
		
		String loc = "/";
		String msg = "";
		
		if(result < 0) 
		{
			loc = "/skill/skill.ski";
			msg = "수정 오류";
		}	
		
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping(value="skill/commentSDelete.comm")
	public String commentDelete(@RequestParam("no") int comment_id, @RequestParam("bo") int board_id, Model model, Skill skill)
	{
		int result = 0;
		
		try{
			result = commentSService.commentSDelete(comment_id);
			
		} catch (Exception e) {
			
		}

		String loc = "/";
		String msg = "";
		
		try{
			if(result > 0)
			{
				msg = "댓글 삭제 성공!";
				
				loc = "/skill/skillOneView.ski?no=" + board_id;
				
			} else {
				msg = "삭제 실패!";
			}
			
		} catch (Exception e) {
			msg = "댓글이 있으면 삭제가 불가능합니다.";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}

}


































