package com.kh.ccms.correction.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.correction.model.vo.CorrectionComment;

@Repository
public class CorrectionCommentDaoImple implements CorrectionCommentDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectCommentList(int correctionId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("correction.selectCorrectionComment", correctionId);
	}

	

	@Override
	public int insertComment(CorrectionComment comment) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("correction.insertCorrectionComment", comment);
	}

	@Override
	public int deleteComment(int commentId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("correction.delteCorrectionComment", commentId);
	}



	@Override
	public int selectCommentCount(int correctionId) {
		
		return sqlSession.selectOne("correction.selectCorrectionCommentCounts", correctionId);
	}



	@Override
	public int updateComment(CorrectionComment comment) {
		// TODO Auto-generated method stub
		
		
		return sqlSession.update("correction.updateCorrectionComment", comment);
	}

	
}
