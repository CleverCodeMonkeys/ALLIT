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

import com.kh.ccms.recruit.model.service.RecruitService;
import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.RecruitFactory;
import com.kh.ccms.recruit.model.vo.RecruitFilter;

@Controller
public class RecruitController 
{
	
	@Autowired
	RecruitService recruitService;
	
	@RequestMapping(value ="/recruit/recruit.rc", method=RequestMethod.GET)
	public String selectRecuitList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model){
		
		int numPerPage = 10; // 한 페이지 당 게시글 수
		
		// 1. 현재 페이지 컨텐츠 리스트 받아오기
		List<Recruit> list = recruitService.selectRecruitList(cPage, numPerPage);
		
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
		
		RecruitFilter rcFilter = new RecruitFactory().makeFilterFactory(job, lang, sal, loc, edu, age, gender);
		
		// 1. 현재 페이지 컨텐츠 리스트 받아오기
		List<Recruit> list = recruitService.filterRecruitList(
				cPage, numPerPage, rcFilter, order, searchSelect, searchInput);
		
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
		
		RecruitFilter rcFilter = new RecruitFactory().makeFilterFactory(job, lang, sal, loc, edu, age, gender);
		
		// 1. 현재 페이지 컨텐츠 리스트 받아오기
		List<Recruit> list = recruitService.filterRecruitList(
				cPage, numPerPage, rcFilter, order, searchSelect, searchInput);
		
		// 2. 전체 게시글 수 구하기
		int totalContents = recruitService.filterRecruitTotalContents(
				rcFilter, order, searchSelect, searchInput);
		
		model.addAttribute("list", list)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("totalContents", totalContents)
		.addAttribute("rcFilter", rcFilter)
		.addAttribute("cPage", cPage);
	
		return "recruit/recruit";
		
	}
	
}














