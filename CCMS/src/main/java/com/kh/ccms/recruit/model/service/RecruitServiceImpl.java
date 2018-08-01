package com.kh.ccms.recruit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.recruit.model.dao.RecruitDao;
import com.kh.ccms.recruit.model.vo.FilterQuery;
import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.RecruitFilter;
import com.kh.ccms.recruit.util.QueryFactory;

@Service
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	RecruitDao recruitDao;
	
	@Override
	public List<Recruit> selectRecruitList(int cPage, int numPerPage) {
		return recruitDao.selectRecruitList(cPage, numPerPage);
	}

	@Override
	public int selectRecruitTotalContents() {
		return recruitDao.selectRecruitTotalContents();
	}

	@Override
	public List<Recruit> filterRecruitList(int cPage, int numPerPage, RecruitFilter rcFilter,
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

		return recruitDao.filterRecruitList(cPage, numPerPage, sql);
		
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

}











