package com.kh.ccms.skill.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.skill.model.dao.SkillDao;
import com.kh.ccms.skill.model.exception.SkillException;
import com.kh.ccms.skill.model.vo.Skill;

@Service
public class SkillServiceImpl implements SkillService 
{
	@Autowired
	SkillDao skillDao;

	@Override
	public List<Map<String, String>> selectSkillList(int cPage, int numPerPage) 
	{
		return skillDao.selectSkillList(cPage, numPerPage);
	}

	@Override
	public int selectSkillTotalContents() 
	{
		return skillDao.selectSkillTotalContents();
	}

	@Override
	public Skill selectSkillOneView(int board_id) 
	{
		return skillDao.selectSkillOneView(board_id);
	}

	@Override
	public int skillInsert(Skill skill) 
	{
		int result = 0;
		
		try
		{
			result = skillDao.skillInsert(skill);
			
			if(result == 0) throw new SkillException();
		
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public int increaseSkillSee(int board_id) 
	{
		return skillDao.increaseSkillSee(board_id);
	}

	@Override
	public int skillUpdateEnd(Skill skill) 
	{
		return skillDao.skillUpdateEnd(skill);
	}

	@Override
	public int skillDelete(int board_id) 
	{
		return skillDao.skillDelete(board_id);
	}

	@Override
	public List<Map<String, String>> selectSkillSearch(int cPage, int numPerPage, String searchSki,
			String searchSelect) 
	{
		return skillDao.selectSkillSearch(cPage, numPerPage, searchSki, searchSelect);
	}

	@Override
	public int selectSkillTotalContentsSer(String searchSki) 
	{
		return skillDao.selectSkillTotalContentsSer(searchSki);
	}

	@Override
	public int selectCommentSCount(int board_id) 
	{
		return skillDao.selectCommentSCount(board_id);
	}

	@Override
	public Skill skillUpdateForm(int board_id) 
	{
		return skillDao.skillUpdateForm(board_id);
	}

}	
