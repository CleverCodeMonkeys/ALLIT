package com.kh.ccms.myPage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ccms.correction.model.vo.CorrectionSearchFilter;
import com.kh.ccms.myPage.model.vo.Profile;

public interface MyPageDao {

	int countResume(String userId);

	int countComm(String userId);
	
	int countSkill(String userId);
	
	int countCorr(String userId);

	int saveProfile(Profile profile,String userId);

	Profile updateProfile(String id);

	int updateProfileSave(Profile profile);

	int deleteMember(String id);


	int selectCommunityTotalContents(String id);

	List<Map<String, String>> selectCommunityList(int cPage, int numPerPage, String id);

	List<Map<String, String>> selectCommunitySearch(int cPage, int numPerPage, String searchComu, String searchSelect,
			String id);

	int selectCommunityTotalContentsSer(String searchComu, String id);

	List<Map<String, String>> selectSkillList(int cPage, int numPerPage, String id);

	int selectSkillTotalContents(String id);

	List<Map<String, String>> selectSkillSearch(int cPage, int numPerPage, String searchSki, String searchSelect,
			String id);

	int selectSkillTotalContentsSer(String searchSki, String id);

	int selectCorrectionTotalContents(String id);

	List<Map<String, String>> selectCorrectionList(int cPage, int numPerPage, String id);

	

	

}
