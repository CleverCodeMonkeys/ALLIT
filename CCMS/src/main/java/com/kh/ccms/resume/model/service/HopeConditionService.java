package com.kh.ccms.resume.model.service;

import com.kh.ccms.resume.model.vo.HopeCondition;

public interface HopeConditionService 
{
	// HopeCondition Interface [Standard]	
	public HopeCondition selectOneHopeCondition(int id);
	public int insertHopeCondition(HopeCondition hope);
	public int updateHopeCondition(HopeCondition hope);
	public int deleteHopeCondition(int id);
}
