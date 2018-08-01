package com.kh.ccms.resume.model.dao;

import com.kh.ccms.resume.model.vo.HopeCondition;

public interface HopeConditionDao 
{
	// HopeCondition Interface [Standard]	
	public HopeCondition selectOneHopeCondition(int id);
	public int insertHopeCondition(HopeCondition hope);
	public int updateHopeCondition(HopeCondition hope);
	public int deleteHopeCondition(int id);
}
