package com.kh.ccms.member.model.service;

import com.kh.ccms.member.model.vo.Member;

public interface MemberService 
{
	Member selectOneMember(String userId);

	int insertMember(Member member);

	int updateMember(Member member);

	int checkIdDuplicate(String userId);
	
	int checkEmailDuplicate(String email);

	String findId(String email);

	String checkIdEmail(String id, String email);

	int changePass(Member member);

	int updatePwd(Member m);
}
