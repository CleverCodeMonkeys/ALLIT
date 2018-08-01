package com.kh.ccms.resume.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ccms.resume.model.makeBoxHTML.BoxMakerFactory;
import com.kh.ccms.resume.model.vo.ResumeInputBox;

@Controller
public class ResumeBoxMakerController {

	// Degree Form
   @ResponseBody
   @RequestMapping(value="/resume/degreeForm.resume", method=RequestMethod.POST)
   public Map<String, Object> makeDegreeBox(
		   @RequestParam(value ="index") String index){
      Map<String,Object> map = new HashMap<>();
            
      map.put("value", new BoxMakerFactory().
    		  makeStringBoxFactory(BoxMakerFactory.DEGREE , index));
      
      return map;
   }
      
   @ResponseBody
   @RequestMapping(value="/resume/academyForm.resume", method=RequestMethod.POST)
   public Map<String,Object> makeAcademyForm(
		   @RequestParam(value ="index") String index){
      Map<String,Object> map = new HashMap<>();
      
      map.put("value", new BoxMakerFactory().
    		  makeStringBoxFactory(BoxMakerFactory.ACADEMY , index));
      
      return map;      
   }
   
   @ResponseBody
   @RequestMapping(value="/resume/certForm.resume", method=RequestMethod.POST)
   public Map<String,Object> makeCertForm(
		   @RequestParam(value ="index") String index){
      Map<String,Object> map = new HashMap<>();
      
      map.put("value",new BoxMakerFactory().
    		  makeStringBoxFactory(BoxMakerFactory.CERT , index));
      
      return map;      
   }
   
   @ResponseBody
   @RequestMapping(value="/resume/awardForm.resume", method=RequestMethod.POST)
   public Map<String,Object> makeAwardForm(
		   @RequestParam(value ="index") String index){
      Map<String,Object> map = new HashMap<>();
      
      map.put("value",new BoxMakerFactory().
    		  makeStringBoxFactory(BoxMakerFactory.AWARD , index));
      
      return map;
   }
      
   @ResponseBody
   @RequestMapping(value="/resume/langForm.resume", method=RequestMethod.POST)
   public Map<String,Object> makeLangForm(
		   @RequestParam(value ="index") String index){
      Map<String,Object> map = new HashMap<>();
            
      map.put("value",new BoxMakerFactory().
    		  makeStringBoxFactory(BoxMakerFactory.LANG , index));
      
      return map;
      
   }
      
   @ResponseBody
   @RequestMapping(value="/resume/portForm.resume", method=RequestMethod.POST)
   public Map<String,Object> makePortForm(
		   @RequestParam(value ="index") String index){
      Map<String,Object> map = new HashMap<>();
      
      map.put("value",new BoxMakerFactory().
    		  makeStringBoxFactory(BoxMakerFactory.PORT , index));
      
      return map;
      
   }
      
   // This Method Only Add New One Introduction Box.
   @ResponseBody
   @RequestMapping(value="/resume/introForm.resume", method=RequestMethod.POST)
   public Map<String,Object> makeIntroForm(
		   @RequestParam(value ="index") String index){
      Map<String,Object> map = new HashMap<>();
      
      System.out.println(index);
      
      map.put("value",ResumeInputBox.INTRO_START + index+
    		  ResumeInputBox.INTRO_FORM +index + ResumeInputBox.INTRO_FORM_NEXT
    		  +ResumeInputBox.INTRO_PLUS_FORM);
      
      return map;      
   }
   

}