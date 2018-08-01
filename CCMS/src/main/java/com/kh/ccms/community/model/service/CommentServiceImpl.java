package com.kh.ccms.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.community.model.dao.CommentDao;
import com.kh.ccms.community.model.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService 
{
	@Autowired
	CommentDao commentDao;

	@Override
	public List<Map<String, String>> commentList(int board_id) 
	{
		return commentDao.commentList(board_id)	;
	}
	
	@Override
	public int commentInsert(Comment comment) 
	{
		return commentDao.commentInsert(comment);
	}

	@Override
	public int commentDelete(int comment_id) 
	{
		return commentDao.commentDelete(comment_id);
	}

	@Override
	public int commentUpdate(Comment comment) 
	{
		return commentDao.commentUpdate(comment);
	}
}
