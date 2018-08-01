package com.kh.ccms.recruit.model.dao;

import java.util.List;

import com.kh.ccms.recruit.model.vo.FilterQuery;
import com.kh.ccms.recruit.model.vo.Recruit;

public interface RecruitDao {

	List<Recruit> selectRecruitList(int cPage, int numPerPage);

	int selectRecruitTotalContents();

	List<Recruit> filterRecruitList(int cPage, int numPerPage, FilterQuery sql);

	int filterRecruitTotalContents(FilterQuery sql);

}
