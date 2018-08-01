package com.kh.ccms.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ccms.member.model.service.MemberService;
import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.member.util.MailHandler;
import com.kh.ccms.member.util.TempKey;

@Controller
@SessionAttributes(value={"m"})
public class FindMemberController 
{
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	MemberService memberService;
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/member/findId.join")
	public Map<String, Object> findId(@RequestParam("email") String email, Model model)
	{
		Map<String, Object> map = new HashMap<>();

		String id = memberService.findId(email);
		
		if(id == null){
			map.put("value", "checkF");
			return map;
		}

		TempKey.getInstance().set_sendedEmail(email);
		MailHandler handler = new MailHandler(email, id, mailSender);
		
		if(handler.sendID(email, id, mailSender)){
			map.put("value", "success");
			map.put("aukey", id);
		}else{
			map.put("value", "fail");
		}
				
		return map;
	}
	
	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping("/member/findPass.join")
	public Map<String, Object> findPass(@RequestParam("id") String id, @RequestParam("email") String email, Member member, Model model)
	{
		Map<String, Object> map = new HashMap<>();
		
		String result = memberService.checkIdEmail(id, email);
		
		if(result == null)
		{
			map.put("value", "checkF");
			return map;
		} 
		
		String key = TempKey.getInstance().makeAuthor();
		
		MailHandler handler = new MailHandler();
		handler.sendPass(email, key, mailSender);
		
		member.seteMail(email);
		member.setPassword(bcryptPasswordEncoder.encode(key));
		
		int result2 = memberService.changePass(member);
		
		if (result2 > 0) map.put("value", "success");
		else map.put("value", "fail");
		
		return map;
		
	}
	
}





















