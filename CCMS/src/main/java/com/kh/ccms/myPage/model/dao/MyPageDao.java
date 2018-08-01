package com.kh.ccms.myPage.model.dao;

import java.util.List;

import com.kh.ccms.myPage.model.vo.Profile;

public interface MyPageDao {

	int countResume(String userId);

	int saveProfile(Profile profile,String userId);

	Profile updateProfile(String id);

	int updateProfileSave(Profile profile);

}
