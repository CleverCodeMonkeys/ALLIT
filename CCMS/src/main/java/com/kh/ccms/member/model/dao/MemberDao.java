package com.kh.ccms.member.model.dao;

import com.kh.ccms.member.model.vo.Member;

public interface MemberDao 
{
	Member selectOneMember(String userId);
	
	int inserMember(Member member);

	int updateMember(Member member);
	
	int checkIdDuplicate(String userId);
	
	int checkEmailDuplicate(String email);

	String findId(String email);

	String checkIdEmail(String id, String email);

	int changePass(Member member);
}
