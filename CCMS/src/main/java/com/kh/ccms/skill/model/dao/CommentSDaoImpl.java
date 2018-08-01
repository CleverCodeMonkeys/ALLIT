package com.kh.ccms.skill.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.skill.model.vo.CommentS;

@Repository
public class CommentSDaoImpl implements CommentSDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> commentList(int board_id) 
	{
		return sqlSession.selectList("commentS.commentSList", board_id);
	}

	@Override
	public int commentSInsert(CommentS comment) 
	{
		return sqlSession.insert("commentS.commentSInsert", comment);
	}

	@Override
	public int commentSUpdate(CommentS co) 
	{
		return sqlSession.update("commentS.commentSUpdate", co);
	}

	@Override
	public int commentSDelete(int comment_id) 
	{
		return sqlSession.delete("commentS.commentSDelete", comment_id);
	}
}
