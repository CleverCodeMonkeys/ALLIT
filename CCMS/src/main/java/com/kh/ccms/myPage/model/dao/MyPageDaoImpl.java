package com.kh.ccms.myPage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	@Override
	public List<Map<String, String>> selectCommunityList(int cPage, int numPerPage,String id) {
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("myPage.selectMyComm",id,rows);
	}

	@Override
	public int selectCommunityTotalContents(String id) {
		
		return sqlSession.selectOne("myPage.selectCommunityTotalContents",id);
	}

	@Override
	public List<Map<String, String>> selectCommunitySearch(int cPage, int numPerPage, String searchComu,
			String searchSelect, String id) {
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		Map<String, String> map = new HashMap<>();
		map.put("searchComu", searchComu);
		map.put("searchSelect", searchSelect);
		map.put("id", id);
		
		return sqlSession.selectList("myPage.selectCommunitySearch",map,rows);
	}

	@Override
	public int selectCommunityTotalContentsSer(String searchComu, String id) {
		Map<String, String> map = new HashMap<>();
		map.put("searchComu", searchComu);
		map.put("id", id);
		
		return sqlSession.selectOne("myPage.selectCommunityTotalContentsSer",map);
	}

	@Override
	public List<Map<String, String>> selectSkillList(int cPage, int numPerPage, String id) {
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("myPage.selectSkillList",id, rows);
	}

	@Override
	public int selectSkillTotalContents(String id) {
		
		return sqlSession.selectOne("myPage.selectSkillTotalContents",id);
	}

	@Override
	public List<Map<String, String>> selectSkillSearch(int cPage, int numPerPage, String searchSki, String searchSelect,
			String id) {
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		Map<String, String> map = new HashMap<>();
		map.put("searchSki", searchSki);
		map.put("searchSelect", searchSelect);
		map.put("id", id);
		
		return sqlSession.selectList("myPage.selectSkillSearch",map,rows);
	}

	@Override
	public int selectSkillTotalContentsSer(String searchSki, String id) {
		Map<String, String> map = new HashMap<>();
		map.put("searchSki", searchSki);
		map.put("id", id);
		
		return sqlSession.selectOne("myPage.selectSkillTotalContentsSer",map);
	}

	
	

}
