package com.kh.ccms.correction.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.correction.model.vo.Correction;
import com.kh.ccms.correction.model.vo.CorrectionSearchFilter;

@Repository
public class CorrectionDaoImple implements CorrectionDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	

	@Override
	public int selectCorrectionTotalContents(CorrectionSearchFilter filter) {
		
		return sqlSession.selectOne("correction.selectCorrectionTotalContents", filter);
	}

	@Override
	public Correction selectCorrectionOne(int correctionId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("correction.selectCorrectionOne", correctionId);
	}

	@Override
	public void updateCorrectionCount(int correctionId) {
		sqlSession.update("correction.updateCorrectionCount", correctionId);
	}

	@Override
	public List<Map<String, String>> selectCorrectionList(int cPage, int numPerPage, CorrectionSearchFilter filter) {
		
		
		int offset = (cPage-1)*numPerPage; 
		int limit = numPerPage;
		
		RowBounds rows = new RowBounds(offset, limit);
		
		return sqlSession.selectList("correction.selectCorrectionList", filter, rows);
	}

	@Override
	public int insertCorrection(Correction correction) {
		
		System.out.println(correction.toString());
		
		return sqlSession.insert("correction.insertCorrection", correction);
	}

	@Override
	public int deleteCorrection(Correction correction) {
		
		return sqlSession.delete("correction.deleteCorrection", correction);
	}

	@Override
	public int updateCorrection(Correction correction) {
		// TODO Auto-generated method stub
		return sqlSession.update("correction.updateCorrection", correction);
	}

}
