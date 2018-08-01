package com.kh.ccms.community.model.exception;

public class CommunityException extends RuntimeException 
{
	private static final long serialVersionUID = 155L;

	public CommunityException() {}

	public CommunityException(String msg)
	{
		super("게시판 에러 발생" + msg);
	}
	
}
