package com.kh.ccms.myPage.model.service;

import java.util.List;

import com.kh.ccms.myPage.model.vo.Profile;

public interface MyPageService {

	int countResume(String userId);

	int saveProfile(Profile profile,String userId);

	Profile updateProfile(String id);

	int updateProfileSave(Profile pro);

}
