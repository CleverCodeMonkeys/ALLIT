package com.kh.ccms.member.util;

public class TempKey 
{
	private static TempKey INSTANCE = null;
	private static String AUTHORIZED_KEY = "";
	private static String SENDED_EMAIL = "";
	
	public synchronized static TempKey getInstance(){
		if(INSTANCE == null){
			INSTANCE = new TempKey();
		}
		
		return INSTANCE;
	}
	
	private TempKey(){}
	
	public void set_sendedEmail(String email){
		SENDED_EMAIL = email;
	}
	
	public String getSended_Email(){
		return SENDED_EMAIL;
	}
	
	public String getAuthorized_Key(){
		return AUTHORIZED_KEY;
	}
	
	public String makeAuthor(){
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i <= 6; i++){
			int n  = (int)(Math.random() * 10);
			buffer.append(n);
		}
		
		AUTHORIZED_KEY = buffer.toString();
		
		return AUTHORIZED_KEY;
	}
}
