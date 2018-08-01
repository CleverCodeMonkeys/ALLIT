package com.kh.ccms.intro.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.intro.model.Factory.MainItemFactory;
import com.kh.ccms.intro.model.vo.IntroItem;

@Repository
public class IntroDaoImple implements IntroDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<IntroItem> selectBannerList(String name) {		
		return sqlSession.selectList(new MainItemFactory().createItem(name));
	}

	@Override
	public IntroItem selectBannerItem(String name) {
		return sqlSession.selectOne(new MainItemFactory().createItem(name));
	}

}
