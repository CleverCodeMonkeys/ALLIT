package com.kh.ccms.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.community.model.vo.Comment;

@Repository
public class CommentDaoImpl implements CommentDao 
{
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Map<String, String>> commentList(int board_id) 
	{
		return sqlSession.selectList("comment.commentList", board_id);
	}
	
	@Override
	public int commentInsert(Comment comment) 
	{
		return sqlSession.insert("comment.commentInsert", comment);
	}

	@Override
	public int commentDelete(int comment_id) 
	{
		return sqlSession.delete("comment.commentDelete", comment_id);
	}

	@Override
	public int commentUpdate(Comment comment) 
	{
		return sqlSession.update("comment.commentUpdat", comment);
	}
}
