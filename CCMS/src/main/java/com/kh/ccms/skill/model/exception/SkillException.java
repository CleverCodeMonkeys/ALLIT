package com.kh.ccms.skill.model.exception;

public class SkillException extends RuntimeException 
{
	private static final long serialVersionUID = 155L;

	public SkillException() {}

	public SkillException(String msg)
	{
		super("게시판 에러 발생" + msg);
	}
	
}
