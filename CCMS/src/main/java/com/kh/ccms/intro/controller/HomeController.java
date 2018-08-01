package com.kh.ccms.intro.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ccms.intro.model.Factory.FactoryMenu;
import com.kh.ccms.intro.model.service.MainService;
import com.kh.ccms.intro.model.vo.IntroItem;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MainService mService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		// Banner 
		List<IntroItem> bannerList = mService.selectBannerList(FactoryMenu.BANNER);
		
		// Movie
		List<IntroItem> movieList = mService.selectBannerList(FactoryMenu.ITMOIVE);
		
		// TOP10
		List<IntroItem> top10List = mService.selectBannerList(FactoryMenu.TOP10);
		
		//Algorithm
		//List<IntroItem> algorithmList = mService.selectBannerList(FactoryMenu.ALGORITHM);
		
		model.addAttribute("banner", bannerList);
		model.addAttribute("top10",top10List);
		//model.addAttribute("algorithm",algorithmList);
		model.addAttribute("movie", movieList);
		
		return "home";
	}
		
}
