package com.kh.ccms.recruit.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.recruit.model.vo.FilterQuery;
import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.Scrab;

@Repository
public class RecruitDaoImpl implements RecruitDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Recruit> selectRecruitList(String id, int cPage, int numPerPage) {

		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("recruit.selectRecruitList", id, rows);
		
	}

	@Override
	public int selectRecruitTotalContents() {
		return sqlSession.selectOne("recruit.selectRecruitTotalContents");
	}

	@Override
	public List<Recruit> filterRecruitList(String id, int cPage, int numPerPage, FilterQuery sql) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("sql", sql);
		
		List<Recruit> list = sqlSession.selectList("recruit.filterRecruitList", map, rows);
		
		for(Recruit rc : list) {
			
			System.out.println(rc.toString());
			
		}
		
		return list;
	}

	@Override
	public int filterRecruitTotalContents(FilterQuery sql) {
		return sqlSession.selectOne("recruit.filterRecruitTotalContents", sql);
	}

	@Override
	public int insertScrab(Scrab scrab) {
		return sqlSession.insert("recruit.insertScrab", scrab);
	}

	@Override
	public int deleteScrab(Scrab scrab) {
		return sqlSession.insert("recruit.deleteScrab", scrab);
	}

	@Override
	public List<Recruit> selectScrabList(String id, int cPage, int numPerPage) {

		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("recruit.selectScrabList", id, rows);
		
	
	}

	@Override
	public int selectScrabTotalContents(String id) {
		return sqlSession.selectOne("recruit.selectScrabTotalContents", id);
	}

	@Override
	public String selectResumeWriter(int rId) {
		return sqlSession.selectOne("recruit.selectResumeWriter", rId);
	}
	
}
