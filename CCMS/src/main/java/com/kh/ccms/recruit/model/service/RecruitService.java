package com.kh.ccms.recruit.model.service;

import java.util.List;

import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.RecruitFilter;
import com.kh.ccms.recruit.model.vo.Scrab;

public interface RecruitService {

	List<Recruit> selectRecruitList(String id, int cPage, int numPerPage);

	int selectRecruitTotalContents();

	List<Recruit> filterRecruitList(String id, int cPage, int numPerPage, RecruitFilter rcFilter, String order,
			String searchSelect, String searchInput);

	int filterRecruitTotalContents(RecruitFilter rcFilter, String order, String searchSelect, String searchInput);

	int insertScrab(Scrab scrab);

	int deleteScrab(Scrab scrab);

	List<Recruit> selectScrabList(String id, int cPage, int numPerPage);

	int selectScrabTotalContents(String id);

}
