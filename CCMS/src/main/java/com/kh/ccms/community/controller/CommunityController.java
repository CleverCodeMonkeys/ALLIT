package com.kh.ccms.community.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.ccms.community.model.exception.CommunityException;
import com.kh.ccms.community.model.service.CommentService;
import com.kh.ccms.community.model.service.CommunityService;
import com.kh.ccms.community.model.vo.Community;
import com.kh.ccms.member.model.vo.Member;

@Controller
public class CommunityController 
{
	@Autowired
	CommunityService communityService;
	
	@Autowired
	CommentService commentService;
	
	// 게시글 리스트 보기
	@RequestMapping(value ="/community/community.comu")
	public String gotoCommunity(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model)
	{
		int numPerPage = 10;
		
		List<Map<String, String>> list = communityService.selectCommunityList(cPage, numPerPage);
		
		int totalContents = communityService.selectCommunityTotalContents();
		
		
		model.addAttribute("list", list).addAttribute("numPerPage", numPerPage)
		.addAttribute("totalContents", totalContents);
		
		return "community/communityList";
	}
	
	// 게시글 한 개 보기
	@RequestMapping(value="/community/communityOneView.comu")
	public String selectcommunityOneView(@RequestParam("no") int board_id, Model model)
	{
		communityService.increaseCommunitySee(board_id);
		
		List<Map<String, String>> list = commentService.commentList(board_id);
		
		int comment_count = communityService.selectCommentCount(board_id);
		
		model.addAttribute("community", communityService.selectCommunityOneView(board_id))
			 .addAttribute("list", list).addAttribute("comment_count", comment_count);
		
		return "community/communityOneView";
	}
	
	// 게시글 한 개 등록 페이지
	@RequestMapping(value="community/communityForm.comu")
	public String communityForm(@SessionAttribute(name = "m", required= false) Member m, Model model)
	{
		String msg = (m != null) ? "community/communityForm" : "common/msg";
		
		String loc = "/community/community.comu";
		String error = "로그인을 해주세요.";
		
		model.addAttribute("loc", loc).addAttribute("msg", error);
		return msg;
	}
	
	// 게시글 한 개 등록하기
	@RequestMapping(value="community/communityInsert.comu", method = RequestMethod.POST)
	public String communityInsert(Community community, Model model, @SessionAttribute(name = "m", required= false) Member m)
	{
		int result;
		if(m == null) {
			model.addAttribute("msg", "로그인 안되어있음").addAttribute("loc", "/");
			return "common/msg";
		}
		
		community.setWriter(m.getId());
		
		try {
			
			result = communityService.communityInsert(community);	
			
		} catch (Exception e) {
			
			throw new CommunityException("error");
		}
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) 
		{
			msg = "게시글 등록 성공!!";
			loc = "/community/community.comu";
			
		}else
			msg = "게시글 등록 실패!"
					+ "20자 이하로 입력해주세요.";
		
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 게시글 수정하기 보여주기
	@RequestMapping(value="/community/communityUpdateForm.comu")
	public String communityUpdateForm(@RequestParam("no") int board_id, Model model)
	{
		model.addAttribute("community", communityService.communityUpdateForm(board_id));
		
		return "community/communityUpdate";
	}
	
	// 게시글 수정하기
	@RequestMapping(value="/community/communityUpdateEnd.comu")
	public String communityUpdateEnd(Community community, Model model)
	{
		int result = 0;
		
		result = communityService.communityUpdateEnd(community);
		
		String loc;
		String msg;
		
		msg = result > 0 ? "게시글 수정 성공!!" : "게시글 수정 실패!!";
		loc = result > 0 ? "/community/community.comu" : "/";
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 게시글 삭제하기
	@RequestMapping(value="/community/communityDelete.comu")
	public String communityDelete(@RequestParam("no") int board_id, Model model)
	{
		int result = 0;
		
		result = communityService.communityDelete(board_id);

		String loc = "/";
		String msg = "";
		
		if(result > 0)
		{
			msg = "삭제 성공!";
			loc = "/community/community.comu";
			
		} else {
			msg = "삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// 게시글 검색하기
	@RequestMapping(value="/community/communitySearch.comu")
	public String communitySearch(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model, @RequestParam("searchComu") String searchComu, @RequestParam("searchSelect") String searchSelect)
	{
		int numPerPage = 10;
	
		List<Map<String, String>> list = communityService.selectCommunitySearch(cPage, numPerPage, searchComu, searchSelect);
		
		/*
		int temp = 0;
		
		for (Map<String, String> m : list) {
			Set<String> set = m.keySet();
			
			System.out.println("--------------- temp : " + temp + " start ---------------");
			for (String key : set) {
				String value = m.get(key);
				System.out.println("key : " + key + "\t value : " + value);
			}
			System.out.println("--------------- temp : " + temp + " end ---------------\n");
			temp++;
		}
		*/
		int totalContents = communityService.selectCommunityTotalContentsSer(searchComu);
		
		model.addAttribute("list", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
		
		return "community/communityList";
	}
	
	/*// 조회 수 증가 막기
	@RequestMapping("/{board_id}")
	public String blockCountSee(HttpServletResponse response, HttpServletRequest request, @PathVariable int board_id, Model model)
	{
		// 저장된 쿠키 불러오기 
		Cookie cookies[] = request.getCookies(); 
		
		Map mapCookie = new HashMap(); 
		
		if(request.getCookies() != null)
		{ 
			for (int i = 0; i < cookies.length; i++) 
			{ 
				Cookie obj = cookies[i]; 
				
				mapCookie.put(obj.getName(),obj.getValue());
			} 
		} 
		
		// 저장된 쿠키중에 read_count 만 불러오기
		String cookie_read_count = (String) mapCookie.get("see"); 
		
		// 저장될 새로운 쿠키값 생성 
		String new_cookie_read_count = "|" + board_id; 
		
		// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사 
		if ( org.apache.commons.lang3.StringUtils.indexOfIgnoreCase(cookie_read_count, new_cookie_read_count) == -1 ) 
		{ 
			// 없을 경우 쿠키 생성 
			Cookie cookie = new Cookie("see", cookie_read_count + new_cookie_read_count); 
			
			//cookie.setMaxAge(1000); 
			
			// 초단위 
			response.addCookie(cookie); 
			
			// 조회수 업데이트 
			this.communityService.increaseCommunitySee(board_id);
		} 
		
		Community object = this.communityService.selectCommunityOneView(board_id);
		
		model.addAttribute("community", object); 
		
		return "community/communityList";
	}*/
}



































