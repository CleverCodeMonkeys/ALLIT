package com.kh.ccms.recruit.model.service;

import java.util.List;

import com.kh.ccms.recruit.model.vo.Recruit;
import com.kh.ccms.recruit.model.vo.RecruitFilter;

public interface RecruitService {

	List<Recruit> selectRecruitList(int cPage, int numPerPage);

	int selectRecruitTotalContents();

	List<Recruit> filterRecruitList(int cPage, int numPerPage, RecruitFilter rcFilter, String order,
			String searchSelect, String searchInput);

	int filterRecruitTotalContents(RecruitFilter rcFilter, String order, String searchSelect, String searchInput);

}
