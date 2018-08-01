package com.kh.ccms.community.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.community.model.vo.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectCommunityList(int cPage, int numPerPage) 
	{
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("community.selectCommunityList", null, rows);
	}

	@Override
	public int selectCommunityTotalContents() 
	{
		return sqlSession.selectOne("community.selectCommunityTotalContents");
	}

	@Override
	public Community selectCommunityOneView(int board_id) 
	{
		return sqlSession.selectOne("community.selectCommunityOneView", board_id);
	}

	@Override
	public int communityInsert(Community community) 
	{
		return sqlSession.insert("community.communityInsert", community);
	}

	@Override
	public int increaseCommunitySee(int board_id) 
	{
		return sqlSession.update("community.increaseCommunitySee", board_id);
	}

	@Override
	public Community communityUpdateForm(int board_id) 
	{
		return sqlSession.selectOne("community.communityUpdateForm", board_id);
	}

	@Override
	public int communityUpdateEnd(Community community) 
	{
		return sqlSession.update("community.communityUpdateEnd", community);
	}

	@Override
	public int communityDelete(int board_id) 
	{
		int delete = 0;
		
        delete = sqlSession.delete("community.communityDelete", board_id);
        
        int commentsDel = 0;
        
        if(delete > 0){
        	
                commentsDel = sqlSession.delete("community.communityDelCom", board_id);
                System.out.println(commentsDel);
        }
        
        return delete;
	}

	@Override
	public List<Map<String, String>> selectCommunitySearch(int cPage, int numPerPage, String community, String searchSelect) 
	{	
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		Map<String, String> map = new HashMap<>();
		map.put("searchComu", community);
		map.put("searchSelect", searchSelect);
		
		return sqlSession.selectList("community.selectCommunitySearch", map, rows);
	}

	@Override
	public int selectCommunityTotalContentsSer(String searchComu) 
	{
		return sqlSession.selectOne("community.selectCommunityTotalContentsSer", searchComu);
	}

	@Override
	public int selectCommentCount(int board_id) 
	{
		return sqlSession.selectOne("community.selectCommentCount", board_id);
	}

	

}
