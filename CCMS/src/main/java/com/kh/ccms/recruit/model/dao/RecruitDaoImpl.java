package com.kh.ccms.recruit.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.recruit.model.vo.FilterQuery;
import com.kh.ccms.recruit.model.vo.Recruit;

@Repository
public class RecruitDaoImpl implements RecruitDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Recruit> selectRecruitList(int cPage, int numPerPage) {

		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("recruit.selectRecruitList", null, rows);
		
	}

	@Override
	public int selectRecruitTotalContents() {
		return sqlSession.selectOne("recruit.selectRecruitTotalContents");
	}

	@Override
	public List<Recruit> filterRecruitList(int cPage, int numPerPage, FilterQuery sql) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		List<Recruit> list = sqlSession.selectList("recruit.filterRecruitList", sql, rows);
		
		for(Recruit rc : list) {
			
			System.out.println(rc.toString());
			
		}
		
		return list;
	}

	@Override
	public int filterRecruitTotalContents(FilterQuery sql) {
		return sqlSession.selectOne("recruit.filterRecruitTotalContents", sql);
	}
	
}
