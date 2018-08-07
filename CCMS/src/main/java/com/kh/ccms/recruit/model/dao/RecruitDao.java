package com.kh.ccms.recruit.model.dao;

import java.util.List;

import com.kh.ccms.recruit.model.vo.FilterQuery;
import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.Scrab;

public interface RecruitDao {

	List<Recruit> selectRecruitList(String id, int cPage, int numPerPage);

	int selectRecruitTotalContents();

	List<Recruit> filterRecruitList(String id, int cPage, int numPerPage, FilterQuery sql);

	int filterRecruitTotalContents(FilterQuery sql);

	int insertScrab(Scrab scrab);

	int deleteScrab(Scrab scrab);

	List<Recruit> selectScrabList(String id, int cPage, int numPerPage);

	int selectScrabTotalContents(String id);

	String selectResumeWriter(int rId);
	
	int deleteFromUser(String id);
}
