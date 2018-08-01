package com.kh.ccms.myPage.model.service;

import java.util.List;

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

}
