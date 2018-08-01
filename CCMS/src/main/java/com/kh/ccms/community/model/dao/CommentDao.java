package com.kh.ccms.community.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ccms.community.model.vo.Comment;

public interface CommentDao 
{
	List<Map<String, String>> commentList(int board_id);
	
	int commentInsert(Comment comment);

	int commentDelete(int comment_id);

	int commentUpdate(Comment comment);
	
}
