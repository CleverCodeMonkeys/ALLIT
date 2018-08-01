package com.kh.ccms.skill.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ccms.skill.model.vo.CommentS;

public interface CommentSDao 
{

	List<Map<String, String>> commentList(int board_id);

	int commentSInsert(CommentS comment);

	int commentSUpdate(CommentS co);

	int commentSDelete(int comment_id);

}
