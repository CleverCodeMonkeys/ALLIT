package com.kh.ccms.recruit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.recruit.model.dao.RecruitDao;
import com.kh.ccms.recruit.model.vo.FilterQuery;
import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.RecruitFilter;
import com.kh.ccms.recruit.model.vo.Scrab;
import com.kh.ccms.recruit.util.QueryFactory;

@Service
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	RecruitDao recruitDao;
	
	@Override
	public List<Recruit> selectRecruitList(String id, int cPage, int numPerPage) {
		return recruitDao.selectRecruitList(id, cPage, numPerPage);
	}

	@Override
	public int selectRecruitTotalContents() {
		return recruitDao.selectRecruitTotalContents();
	}

	@Override
	public List<Recruit> filterRecruitList(String id, int cPage, int numPerPage, RecruitFilter rcFilter,
			String order, String searchSelect, String searchInput) {
		
		FilterQuery sql = new FilterQuery();
		QueryFactory queryFactory = new QueryFactory();
		
		sql.setJobQuery(queryFactory.makeJobQuery(rcFilter.getRcJob()));
		sql.setLanguageQuery(queryFactory.makeLangQuery(rcFilter.getRcLang()));
		sql.setSalaryQuery(queryFactory.makeSalQuery(rcFilter.getRcSal()));
		sql.setLocQuery(queryFactory.makeLocQuery(rcFilter.getRcLoc()));
		sql.setEduQuery(queryFactory.makeEduQuery(rcFilter.getRcEdu()));
		sql.setAgeQuery(queryFactory.makeAgeQuery(rcFilter.getRcAge()));
		sql.setGenderQuery(queryFactory.makeGenderQuery(rcFilter.getRcGender()));
		sql.setOrderQuery(queryFactory.makeOrderQuery(order));
		sql.setSearchQuery(queryFactory.makeSearchQuery(searchSelect, searchInput));
		
		System.out.println("====================================================");
		System.out.println(sql.toString());
		System.out.println("====================================================");

		return recruitDao.filterRecruitList(id, cPage, numPerPage, sql);
		
	}

	@Override
	public int filterRecruitTotalContents(RecruitFilter rcFilter, String order, String searchSelect, String searchInput) {
		
		FilterQuery sql = new FilterQuery();
		QueryFactory queryFactory = new QueryFactory();
		
		sql.setJobQuery(queryFactory.makeJobQuery(rcFilter.getRcJob()));
		sql.setLanguageQuery(queryFactory.makeLangQuery(rcFilter.getRcLang()));
		sql.setSalaryQuery(queryFactory.makeSalQuery(rcFilter.getRcSal()));
		sql.setLocQuery(queryFactory.makeLocQuery(rcFilter.getRcLoc()));
		sql.setEduQuery(queryFactory.makeEduQuery(rcFilter.getRcEdu()));
		sql.setAgeQuery(queryFactory.makeAgeQuery(rcFilter.getRcAge()));
		sql.setGenderQuery(queryFactory.makeGenderQuery(rcFilter.getRcGender()));
		sql.setOrderQuery(queryFactory.makeOrderQuery(order));
		sql.setSearchQuery(queryFactory.makeSearchQuery(searchSelect, searchInput));
		
		return recruitDao.filterRecruitTotalContents(sql);
		
	}

	@Override
	public int insertScrab(Scrab scrab) {
		return recruitDao.insertScrab(scrab);
	}

	@Override
	public int deleteScrab(Scrab scrab) {
		return recruitDao.deleteScrab(scrab);
	}

	@Override
	public List<Recruit> selectScrabList(String id, int cPage, int numPerPage) {
		return recruitDao.selectScrabList(id, cPage, numPerPage);
	}

	@Override
	public int selectScrabTotalContents(String id) {
		return recruitDao.selectScrabTotalContents(id);
	}

}











