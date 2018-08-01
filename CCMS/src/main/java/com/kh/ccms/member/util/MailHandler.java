package com.kh.ccms.member.util;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler 
{
	private final String subject = "ALL IT 인증번호";
	private final String idsubject = "ALL IT 아이디 확인";
	private final String passsubject = "ALL IT 비밀번호 확인";
	private final String fromName ="fdacare2018@gmail.com";
	
	private String email;
	private String authorized;
	
	JavaMailSender mailSender;
	
	public MailHandler(){}

	public MailHandler(String email, String authorized , JavaMailSender mailSender) {
		super();
		this.email = email;
		this.authorized = authorized;
		this.mailSender = mailSender;
	}
	
	//Find ID Email
	   public boolean sendID(String email, String id, JavaMailSender mailSender){
	      boolean result = false;      
	      try{
	         MimeMessage message = mailSender.createMimeMessage();
	          MimeMessageHelper messageHelper 
	                              = new MimeMessageHelper(message, true, "UTF-8");
	          
	          String content = "님의 아이디는 [" + id + "]";
	          
	          messageHelper.setFrom(fromName);
	          messageHelper.setTo(email);
	          messageHelper.setSubject(idsubject);
	          messageHelper.setText(content);
	          
	          mailSender.send(message);
	          
	         result = true;
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      
	      return result;
	   }
	   
	// Find Password Email
	public boolean sendPass(String email, String authorized, JavaMailSender mailSender){
		
		boolean result = false;      
	      try{
	         MimeMessage message = mailSender.createMimeMessage();
	          MimeMessageHelper messageHelper 
	                              = new MimeMessageHelper(message, true, "UTF-8");
	          
	          String content = "변경 된 임시비밀 번호는 [" + authorized + "]";
	          
	          messageHelper.setFrom(fromName);
	          messageHelper.setTo(email);
	          messageHelper.setSubject(passsubject);
	          messageHelper.setText(content);
	          
	          mailSender.send(message);
	          
	         result = true;
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      
	      return result;
		
	}
	
	// Sending Email 
	public boolean sendEmail(String email, String authNum){
		boolean result = false;
		
		String content = "인증 번호 [" + authNum + "]";
		
		try{
			MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		      
		    messageHelper.setFrom(fromName);
		    messageHelper.setTo(email);
		    messageHelper.setSubject(subject);
		    messageHelper.setText(content);
		    
			mailSender.send(message);
			
			result = true;
		}catch(Exception e){
			result = false;
		}
		
		return result;
	}
	
	public boolean sendEmail(){
		boolean result = false;
		
		String content = "인증 번호 [ " + authorized + "]";
		
		try{
			MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		    
		    messageHelper.setFrom(fromName);
		    messageHelper.setTo(email);
		    messageHelper.setSubject(subject);
		    messageHelper.setText(content);
		    
		    System.out.println(mailSender);
			System.out.println(message);
			
			mailSender.send(message);
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		
		return result;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthorized() {
		return authorized;
	}

	public void setAuthorized(String authorized) {
		this.authorized = authorized;
	}
	
}
