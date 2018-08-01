package com.kh.ccms.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.ccms.community.model.exception.CommunityException;
import com.kh.ccms.community.model.service.CommentService;
import com.kh.ccms.community.model.vo.Comment;
import com.kh.ccms.community.model.vo.Community;
import com.kh.ccms.member.model.vo.Member;

@Controller
public class CommentController 
{
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value="community/commentInsert.comm")
	public String commentInsert(Comment comment, Model model, @SessionAttribute(name = "m", required= false) Member m,
			Community community)
	{
		int result;
		
		if(m == null) {
			
			model.addAttribute("msg", "로그인 해주세요.").addAttribute("loc", "/");
			
			return "common/msg";
			
		}
		
		comment.setWriter_id(m.getId());
		
		try {
			
			result = commentService.commentInsert(comment);	
			
		} catch (Exception e) {
			
			throw new CommunityException("error");
			
		}
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) 
		{
			loc = "/community/communityOneView.comu?no=" + community.getBoard_id();
			
			msg = "댓글 등록 성공";
			
		} else {
			
			msg = "댓글 등록 실패!!";
			
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping(value="community/commentUpdat.comm")
	public String commentUpdate(@RequestParam("co") String comment, @RequestParam("bo") int comment_id ,Model model, Community community)
	{
		int result;

		Comment co = new Comment();
		
		co.setComment_content(comment);
		co.setComment_id(comment_id);
		
		try {
			
			result = commentService.commentUpdate(co);	
			
		} catch (Exception e) {
			
			throw new CommunityException("error");
			
		}
		
		String loc = "/";
		String msg = "";
		
		if(result < 0) 
		{
			loc = "/community/community.comu";
			msg = "수정 오류";
		}	
		
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping(value="community/commentDelete.comm")
	public String commentDelete(@RequestParam("no") int comment_id, @RequestParam("bo") int board_id, Model model, Community community)
	{
		int result = 0;
		
		try{
			result = commentService.commentDelete(comment_id);
			
		} catch (Exception e) {
			
		}

		String loc = "/";
		String msg = "";
		
		try{
			if(result > 0)
			{
				msg = "댓글 삭제 성공!";
				
				loc = "/community/communityOneView.comu?no=" + board_id;
				
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


































