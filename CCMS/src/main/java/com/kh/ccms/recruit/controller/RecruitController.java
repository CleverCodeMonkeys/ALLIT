package com.kh.ccms.recruit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.recruit.model.service.RecruitService;
import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.RecruitFactory;
import com.kh.ccms.recruit.model.vo.RecruitFilter;
import com.kh.ccms.recruit.model.vo.Scrab;

@Controller
public class RecruitController 
{
	
	@Autowired
	RecruitService recruitService;
	
	@RequestMapping(value ="/recruit/recruit.rc", method=RequestMethod.GET)
	public String selectRecuitList(
			@SessionAttribute(value="m", required=false) Member m,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model){
		
		int numPerPage = 10; // 한 페이지 당 게시글 수
		String id = "";
		if(m != null) id = m.getId();
		
		// 1. 현재 페이지 컨텐츠 리스트 받아오기
		List<Recruit> list = recruitService.selectRecruitList(id, cPage, numPerPage);
		
		// 2. 전체 게시글 수 구하기
		int totalContents = recruitService.selectRecruitTotalContents();
		
		model.addAttribute("list", list)
			.addAttribute("numPerPage", numPerPage)
			.addAttribute("totalContents", totalContents)
			.addAttribute("cPage", cPage);
		
		return "recruit/recruit";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/recruit/filterRecruitList.rc", method=RequestMethod.GET)
	public Map<String, Object> filterRecruitList(
			@SessionAttribute(value="m", required=false) Member m,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam("job") String job,
			@RequestParam("language") String lang,
			@RequestParam("salary") String sal,
			@RequestParam("loc") String loc,
			@RequestParam("edu") String edu,
			@RequestParam("age") String age,
			@RequestParam("gender") String gender,
			@RequestParam("order") String order,
			@RequestParam("searchSelect") String searchSelect,
			@RequestParam("searchInput") String searchInput) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 수
		String id = "";
		if(m != null) id = m.getId();
		
		RecruitFilter rcFilter = new RecruitFactory().makeFilterFactory(job, lang, sal, loc, edu, age, gender);
		
		// 1. 현재 페이지 컨텐츠 리스트 받아오기
		List<Recruit> list = recruitService.filterRecruitList(
				id, cPage, numPerPage, rcFilter, order, searchSelect, searchInput);
		
		// 2. 전체 게시글 수 구하기
		int totalContents = recruitService.filterRecruitTotalContents(
				rcFilter, order, searchSelect, searchInput);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("numPerPage", numPerPage);
		map.put("totalContents", totalContents);
		
		return map;
		
	}
	
	@RequestMapping(value="/recruit/filterRecruitListPage.rc", method=RequestMethod.GET)
	public String filterRecruitListPage(
			@SessionAttribute(value="m", required=false) Member m,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam("job") String job,
			@RequestParam("language") String lang,
			@RequestParam("salary") String sal,
			@RequestParam("loc") String loc,
			@RequestParam("edu") String edu,
			@RequestParam("age") String age,
			@RequestParam("gender") String gender,
			@RequestParam("order") String order,
			@RequestParam("searchSelect") String searchSelect,
			@RequestParam("searchInput") String searchInput,
			Model model) {
		System.out.println("job 왓냐 : " + job);
		int numPerPage = 10; // 한 페이지 당 게시글 수
		String id = "";
		if(m != null) id = m.getId();
		
		RecruitFilter rcFilter = new RecruitFactory().makeFilterFactory(job, lang, sal, loc, edu, age, gender);
		
		// 1. 현재 페이지 컨텐츠 리스트 받아오기
		List<Recruit> list = recruitService.filterRecruitList(
				id, cPage, numPerPage, rcFilter, order, searchSelect, searchInput);
		
		// 2. 전체 게시글 수 구하기
		int totalContents = recruitService.filterRecruitTotalContents(
				rcFilter, order, searchSelect, searchInput);
		
		model.addAttribute("list", list)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("totalContents", totalContents)
		.addAttribute("rcFilter", rcFilter)
		.addAttribute("cPage", cPage);
		
		System.out.println("sal ! : " + sal);
	
		return "recruit/recruit";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/recruit/insertScrab.rc", method=RequestMethod.POST)
	public Map<String, Object> insertScrab(
			@SessionAttribute("m") Member m,
			@RequestParam("rId") int rId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Scrab scrab = new Scrab(m.getId(), rId);
		
		int result = recruitService.insertScrab(scrab);
		
		map.put("result", result);
		
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/recruit/deleteScrab.rc", method=RequestMethod.POST)
	public Map<String, Object> deleteScrab(
			@SessionAttribute("m") Member m,
			@RequestParam("rId") int rId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Scrab scrab = new Scrab(m.getId(), rId);
		
		int result = recruitService.deleteScrab(scrab);
		
		map.put("result", result);
		
		return map;
		
	}
	
	@RequestMapping(value ="/recruit/scrabList.rc", method=RequestMethod.GET)
	public String selectScrabList(
			@SessionAttribute("m") Member m,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model){
		
		int numPerPage = 10; // 한 페이지 당 게시글 수
		String id = m.getId();
		
		List<Recruit> list = recruitService.selectScrabList(id, cPage, numPerPage);
		
		// 2. 전체 게시글 수 구하기
		int totalContents = recruitService.selectScrabTotalContents(id);
		
		model.addAttribute("list", list)
			.addAttribute("numPerPage", numPerPage)
			.addAttribute("totalContents", totalContents)
			.addAttribute("cPage", cPage);
		
		return "recruit/scrabList";
		
	}
	
}














