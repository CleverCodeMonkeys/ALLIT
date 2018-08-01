package com.kh.ccms.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.myPage.model.vo.Profile;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int countResume(String userId) {
		System.out.println();
		return sqlSession.selectOne("myPage.countResume",userId);
	}
	
	@Override
	public int countComm(String userId) {
		
		return sqlSession.selectOne("myPage.countComm",userId);
	}
	
	@Override
	public int countSkill(String userId) {
		
		return sqlSession.selectOne("myPage.countSkill",userId);
	}


	@Override
	public int saveProfile(Profile profile, String userId) {
		
		
		profile.setMember_id(userId);
		
		// Temp
		profile.setLanguage("java,c,c++");
		
		System.out.println("DAO 확인 : "+ profile);
		
		return sqlSession.insert("myPage.saveProfile",profile);
	}

	@Override
	public Profile updateProfile(String id) {
		
		return sqlSession.selectOne("myPage.updateProfile",id);
	}

	@Override
	public int updateProfileSave(Profile profile) {
		return sqlSession.update("myPage.updateProfileSave",profile);
	}

	@Override
	public int deleteMember(String id) {
		
		return sqlSession.delete("myPage.deleteMember",id);
	}

	
	

}
