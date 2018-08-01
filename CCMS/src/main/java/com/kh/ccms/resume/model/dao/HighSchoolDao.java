package com.kh.ccms.resume.model.dao;

import com.kh.ccms.resume.model.vo.HighSchool;

public interface HighSchoolDao 
{
	public HighSchool selectOneHighSchool(int id);
	public int insertHighSchool(HighSchool school);
	public int updateHighSchool(HighSchool school);
	public int deleteHighSchool(int id);
}
