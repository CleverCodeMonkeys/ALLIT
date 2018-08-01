package com.kh.ccms.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.member.model.dao.MemberDao;
import com.kh.ccms.member.model.vo.Member;

@Service
public class MemberServiceImple implements MemberService 
{
	@Autowired
	MemberDao mDao;

	@Override
	public Member selectOneMember(String userId) {
		// TODO Auto-generated method stub
		return mDao.selectOneMember(userId);
	}

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return mDao.inserMember(member);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return mDao.updateMember(member);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		// TODO Auto-generated method stub
		return mDao.checkIdDuplicate(userId);
	}

	@Override
	public int checkEmailDuplicate(String email) {
		// TODO Auto-generated method stub
		return mDao.checkEmailDuplicate(email);
	}

	@Override
	public String findId(String email) {
		// TODO Auto-generated method stub
		return mDao.findId(email);
	}

	@Override
	public String checkIdEmail(String id, String email) {
		// TODO Auto-generated method stub
		return mDao.checkIdEmail(id, email);
	}

	@Override
	public int changePass(Member member) {
		// TODO Auto-generated method stub
		return mDao.changePass(member);
	}

	@Override
	public int updatePwd(Member m) {
		// TODO Auto-generated method stub
		return mDao.updatePwd(m);
	}

}
