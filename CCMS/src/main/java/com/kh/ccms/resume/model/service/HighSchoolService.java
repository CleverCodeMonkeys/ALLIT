package com.kh.ccms.resume.model.service;

import com.kh.ccms.resume.model.vo.HighSchool;

public interface HighSchoolService 
{
		// High School Service, High School is only one graduation
		public HighSchool selectOneHighSchool(int id);
		public int insertHighSchool(HighSchool school);
		public int updateHighSchool(HighSchool school);
		public int deleteHighSchool(int id);
}
