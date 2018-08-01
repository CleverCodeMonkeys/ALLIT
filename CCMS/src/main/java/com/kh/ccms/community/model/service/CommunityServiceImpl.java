package com.kh.ccms.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.community.model.dao.CommunityDao;
import com.kh.ccms.community.model.exception.CommunityException;
import com.kh.ccms.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService 
{
	@Autowired
	CommunityDao communityDao;

	@Override
	public List<Map<String, String>> selectCommunityList(int cPage, int numPerPage) 
	{
		return communityDao.selectCommunityList(cPage, numPerPage);
	}

	@Override
	public int selectCommunityTotalContents() 
	{
		return communityDao.selectCommunityTotalContents();
	}

	@Override
	public Community selectCommunityOneView(int board_id) 
	{
		return communityDao.selectCommunityOneView(board_id);
	}

	@Override
	public int communityInsert(Community community) 
	{
		int result = 0;
		
		try
		{
			result = communityDao.communityInsert(community);
			
			if(result == 0) throw new CommunityException();
		
		} catch (Exception e) {
			
			throw e;
		}
		
		return result;
	}

	@Override
	public int increaseCommunitySee(int board_id) 
	{
		return communityDao.increaseCommunitySee(board_id);
	}
	
	@Override
	public Community communityUpdateForm(int board_id) 
	{
		return communityDao.communityUpdateForm(board_id);
	}

	@Override
	public int communityUpdateEnd(Community community) 
	{
		int result = 0;
		
		try
		{
			result = communityDao.communityUpdateEnd(community);
			
			if(result == 0) throw new CommunityException();
		
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public int communityDelete(int board_id) 
	{
		return communityDao.communityDelete(board_id);
	}

	@Override
	public List<Map<String, String>> selectCommunitySearch(int cPage, int numPerPage, String community, String searchSelect) 
	{
		return communityDao.selectCommunitySearch(cPage, numPerPage, community, searchSelect);
	}

	@Override
	public int selectCommunityTotalContentsSer(String searchComu) 
	{
		return communityDao.selectCommunityTotalContentsSer(searchComu);
	}

	@Override
	public int selectCommentCount(int board_id) 
	{
		return communityDao.selectCommentCount(board_id);
	}

	

}	
