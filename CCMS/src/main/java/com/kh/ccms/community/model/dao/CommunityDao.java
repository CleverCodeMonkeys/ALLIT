package com.kh.ccms.community.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ccms.community.model.vo.Community;

public interface CommunityDao {

	List<Map<String, String>> selectCommunityList(int cPage, int numPerPage);

	int selectCommunityTotalContents();

	Community selectCommunityOneView(int board_id);

	int communityInsert(Community community);

	int increaseCommunitySee(int board_id);

	Community communityUpdateForm(int board_id);

	int communityUpdateEnd(Community community);

	int communityDelete(int board_id);
	
	// add delete from member
	int communityDeleteFromUser(String id);

	List<Map<String, String>> selectCommunitySearch(int cPage, int numPerPage, String community, String searchSelect);

	int selectCommunityTotalContentsSer(String searchComu);

	int selectCommentCount(int board_id);


}
