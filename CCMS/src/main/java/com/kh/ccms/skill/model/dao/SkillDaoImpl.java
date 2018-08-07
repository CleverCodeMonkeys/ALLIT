package com.kh.ccms.skill.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.skill.model.vo.Skill;

@Repository
public class SkillDaoImpl implements SkillDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectSkillList(int cPage, int numPerPage) 
	{
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("skill.selectSkillList", null, rows);
	}

	@Override
	public int selectSkillTotalContents() 
	{
		return sqlSession.selectOne("skill.selectSkillTotalContents");
	}

	@Override
	public Skill selectSkillOneView(int board_id) 
	{
		return sqlSession.selectOne("skill.selectSkillOneView", board_id);
	}

	@Override
	public int skillInsert(Skill skill) 
	{
		return sqlSession.insert("skill.skillInsert", skill);
	}

	@Override
	public int increaseSkillSee(int board_id) 
	{
		return sqlSession.update("skill.increaseSkillSee", board_id);
	}

	@Override
	public int skillUpdateEnd(Skill skill) 
	{
		return sqlSession.update("skill.skillUpdateEnd", skill);
	}

	@Override
	public int skillDelete(int board_id) 
	{
		return sqlSession.delete("skillDelete", board_id);
	}

	@Override
	public List<Map<String, String>> selectSkillSearch(int cPage, int numPerPage, String searchSki,
			String searchSelect) 
	{
		RowBounds rows = new RowBounds((cPage -1) * numPerPage, numPerPage);
		
		Map<String, String> map = new HashMap<>();
		map.put("searchSki", searchSki);
		map.put("searchSelect", searchSelect);
		
		return sqlSession.selectList("skill.selectSkillSearch", map, rows);
	}

	@Override
	public int selectSkillTotalContentsSer(String searchSki) 
	{
		return sqlSession.selectOne("skill.selectSkillTotalContentsSer", searchSki);
	}

	@Override
	public int selectCommentSCount(int board_id)
	{
		return sqlSession.selectOne("skill.selectCommentSCount", board_id);
	}

	@Override
	public Skill skillUpdateForm(int board_id) 
	{
		return sqlSession.selectOne("skill.skillUpdateForm", board_id);
	}

	@Override
	public int skillDeleteFromUser(String id) {
		// TODO Auto-generated method stub
		return sqlSession.delete("skill.deleteFromUser" , id);
	}

}
