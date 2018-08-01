package com.kh.ccms.correction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CorrectionController 
{
	@RequestMapping(value ="/correction/correction.correct", method=RequestMethod.GET)
	public String gotoCorrection(Model model){
		return "correction/correction";
	}
}
