package com.kh.ccms.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ccms.member.model.service.MemberService;
import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.member.util.MailHandler;
import com.kh.ccms.member.util.TempKey;

@Controller
@SessionAttributes(value={"m"})
public class MemberController 
{
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/common/individual.login" , method=RequestMethod.POST) 
	public ModelAndView checkLogin(
			@RequestParam(value = "userId") String id ,
			@RequestParam(value ="password") String password){
		
		String msg = "";
		String loc = "/";
		
		ModelAndView mv = new ModelAndView();
		
		Member member = memberService.selectOneMember(id);
		
		if(member == null){
			msg = "존재하지 않는 아이디 입니다.";
		}else
		{
			if(bcryptPasswordEncoder.matches(password, member.getPassword())){
				msg =  member.getId() + "님이 로그인 하셨습니다.";
				mv.addObject("m", member);
			}else{
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		
		mv.setViewName("common/msg");	
		
		mv.addObject("msg", msg).addObject("loc",loc);
		
		return mv;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status){
		/*if(logger.isDebugEnabled()) logger.debug("회원 로그아웃 요청");*/
		
		// 현재 세션 상태가 끝났음을 확인
		if (!status.isComplete()){
			status.setComplete();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value ="/common/individual.join" , method=RequestMethod.POST)
	public String memberJoin(
			@RequestParam(value ="userId") String id,
			@RequestParam(value ="password") String password,
			/*@RequestParam(value ="email") String email,*/
			Member member,
			Model model){
		
		String email = TempKey.getInstance().getSended_Email();
		String loc ="/";
		String msg = "Input Wrong Values";
		
		if(id == null || password == null || email == null || id.trim() == "" || password.trim() == "" || email.trim() == ""){
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
			return "common/msg";
		}
		
		member.setPassword(bcryptPasswordEncoder.encode(password));
		member.setDistiniction("N"); // Normal Member Join
		member.setId(id);
		member.seteMail(email);

		// Insert Into Database
		int result = memberService.insertMember(member);
		
		msg = result > 0 ? "회원가입 완료했습니다." : "회원가입에 실패했습니다.";
		
		model.addAttribute("loc",loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/member/mail.join")
	public Map<String, Object> mailSending(@RequestParam(value = "email") String email){
		Map<String, Object> map = new HashMap<>();
		
		// Check for Duplicate Email?
		int result = memberService.checkEmailDuplicate(email);
		if(result > 0){
			map.put("value", "dup");
			return map;
		}
		
		// Singleton Key Method.
		String key = TempKey.getInstance().makeAuthor();
		TempKey.getInstance().set_sendedEmail(email);
		
		MailHandler handler = new MailHandler(email, key, mailSender);
		
		if(handler.sendEmail()){
			map.put("value", "success");
			map.put("aukey", key);
		}else{
			map.put("value", "fail");
		}
				
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/member/confirm.join")
	public Map<String, Object> confirmAuthorized(@RequestParam(value ="confirm") String authorized){
		Map<String, Object> map = new HashMap<>();
		String msg = "";
		String key = TempKey.getInstance().getAuthorized_Key();
		
		if(key == "" || key == null || authorized == null || authorized == "") {
			map.put("value", "error");
		}else
		{
			msg = (key.equals(authorized)) ?  "ok" :  "no";
			map.put("value", msg);
			map.put("email", TempKey.getInstance().getSended_Email());
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/member/checkIdDup.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId){
		
		Map<String, Object> map = new HashMap<>();
		
		boolean isUsable
		  = memberService.checkIdDuplicate(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
}

