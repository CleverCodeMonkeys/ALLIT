package com.kh.ccms.member.model.vo;

public class NormalMember extends Member 
{
	private static final long serialVersionUID = 1L;
	
	private String nickName;
	
	public NormalMember(){
		super();
	}

	public NormalMember(String nickName) {
		super();
		this.nickName = nickName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

}
