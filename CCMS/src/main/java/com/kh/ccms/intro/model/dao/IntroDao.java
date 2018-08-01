package com.kh.ccms.intro.model.dao;

import java.util.List;

import com.kh.ccms.intro.model.vo.IntroItem;

public interface IntroDao
{
	//Items
	public List<IntroItem> selectBannerList(String name);
	
	public IntroItem selectBannerItem(String name);
	
}
