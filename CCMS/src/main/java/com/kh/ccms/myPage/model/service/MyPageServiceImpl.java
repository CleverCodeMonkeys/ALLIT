package com.kh.ccms.myPage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.myPage.model.dao.MyPageDao;
import com.kh.ccms.myPage.model.vo.Profile;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageDao myPageDao;
	
	@Override
	public int countResume(String userId) {
		
		return myPageDao.countResume(userId);
	}
	
	@Override
	public int countComm(String userId) {
	
		return myPageDao.countComm(userId);
	}

	@Override
	public int countSkill(String userId) {

		return myPageDao.countSkill(userId);
	}
	
	@Override
	public int saveProfile(Profile profile,String userId) {
		
		return myPageDao.saveProfile(profile, userId);
	}

	@Override
	public Profile updateProfile(String id) {
		
		return myPageDao.updateProfile(id);
	}

	@Override
	public int updateProfileSave(Profile profile) {
		return myPageDao.updateProfileSave(profile);
	}

	@Override
	public int deleteMember(String id) {
		return myPageDao.deleteMember(id);
	}

	@Override
	public List<Map<String, String>> selectCommunityList(int cPage, int numPerPage, String id) {
	
		return myPageDao.selectCommunityList(cPage,numPerPage,id);
	}

	@Override
	public int selectCommunityTotalContents(String id) {
	
		return myPageDao.selectCommunityTotalContents(id);
	}

	@Override
	public List<Map<String, String>> selectCommunitySearch(int cPage, int numPerPage, String searchComu,
			String searchSelect, String id) {
	
		return myPageDao.selectCommunitySearch(cPage, numPerPage,searchComu,searchSelect, id);
	}

	@Override
	public int selectCommunityTotalContentsSer(String searchComu, String id) {
	
		return myPageDao.selectCommunityTotalContentsSer(searchComu, id);
	}

	@Override
	public List<Map<String, String>> selectSkillList(int cPage, int numPerPage, String id) {
	
		return myPageDao.selectSkillList(cPage, numPerPage, id);
	}

	@Override
	public int selectSkillTotalContents(String id) {

		return myPageDao.selectSkillTotalContents(id);
	}

	@Override
	public List<Map<String, String>> selectSkillSearch(int cPage, int numPerPage, String searchSki, String searchSelect,
			String id) {
	
		return myPageDao.selectSkillSearch(cPage, numPerPage,searchSki,searchSelect, id);
	}

	@Override
	public int selectSkillTotalContentsSer(String searchSki, String id) {

		return myPageDao.selectSkillTotalContentsSer(searchSki, id);
	}



}
