package com.kh.ccms.intro.model.service;

import java.util.List;

import com.kh.ccms.intro.model.vo.IntroItem;

public interface MainService 
{
			//Items
			public List<IntroItem> selectBannerList(String name);
			
			public IntroItem selectBannerItem(String name);

}
