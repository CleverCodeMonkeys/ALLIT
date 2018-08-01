package com.kh.ccms.intro.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.intro.model.dao.IntroDao;
import com.kh.ccms.intro.model.vo.IntroItem;

@Service
public class MainServiceImple implements MainService
{
	@Autowired
	IntroDao mDao;

	@Override
	public List<IntroItem> selectBannerList(String name) {
		// TODO Auto-generated method stub
		return mDao.selectBannerList(name);
	}

	@Override
	public IntroItem selectBannerItem(String name) {
		// TODO Auto-generated method stub
		return mDao.selectBannerItem(name);
	}

}
