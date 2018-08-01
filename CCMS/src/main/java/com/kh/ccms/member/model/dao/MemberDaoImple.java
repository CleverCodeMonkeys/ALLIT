package com.kh.ccms.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.member.model.vo.Member;

@Repository
public class MemberDaoImple implements MemberDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Member selectOneMember(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneMember", userId);
	}

	@Override
	public int inserMember(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.checkIdDuplicate", userId);
	}

	@Override
	public int checkEmailDuplicate(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.checkEmailDuplicate", email);
	}

	@Override
	public String findId(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.findId", email);
	}

	@Override
	public String checkIdEmail(String id, String email) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("eMail", email);
		
		return sqlSession.selectOne("member.checkIdEmail", map);
	}

	@Override
	public int changePass(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.changePass", member);
	}

	@Override
	public int updatePwd(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updatePwd", m);
	}

}
