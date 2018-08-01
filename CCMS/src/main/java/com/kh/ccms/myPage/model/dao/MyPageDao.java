package com.kh.ccms.myPage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ccms.myPage.model.vo.Profile;

public interface MyPageDao {

	int countResume(String userId);

	int countComm(String userId);
	
	int countSkill(String userId);

	int saveProfile(Profile profile,String userId);

	Profile updateProfile(String id);

	int updateProfileSave(Profile profile);

	int deleteMember(String id);

	

}
