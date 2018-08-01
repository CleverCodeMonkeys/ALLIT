package com.kh.ccms.skill.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.skill.model.dao.CommentSDao;
import com.kh.ccms.skill.model.vo.CommentS;

@Service
public class CommentSServiceImpl implements CommentSService 
{
	@Autowired
	CommentSDao commentSDao;

	@Override
	public List<Map<String, String>> commentList(int board_id) 
	{
		return commentSDao.commentList(board_id);
	}

	@Override
	public int commentSInsert(CommentS comment) 
	{
		return commentSDao.commentSInsert(comment);
	}

	@Override
	public int commentSUpdate(CommentS co) 
	{
		return commentSDao.commentSUpdate(co);
	}

	@Override
	public int commentSDelete(int comment_id) 
	{
		return commentSDao.commentSDelete(comment_id);
	}
}
