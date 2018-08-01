package com.kh.ccms.correction.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.correction.model.dao.CorrectionCommentDao;
import com.kh.ccms.correction.model.vo.CorrectionComment;

@Service
public class CorrectionCommentServiceImple implements CorrectionCommentService {
	@Autowired
	CorrectionCommentDao correctionCommentDao;
	
	@Override
	public List<Map<String, String>> selectCommentList(int correctionId) {
		// TODO Auto-generated method stub
		return correctionCommentDao.selectCommentList(correctionId);
	}


	@Override
	public int insertComment(CorrectionComment comment) {
		// TODO Auto-generated method stub
		return correctionCommentDao.insertComment(comment);
	}

	@Override
	public int deleteComment(int commentId) {
		// TODO Auto-generated method stub
		return correctionCommentDao.deleteComment(commentId);
	}



	@Override
	public int selectCommentCount(int correctionId) {
		// TODO Auto-generated method stub
		return correctionCommentDao.selectCommentCount(correctionId);
	}


	@Override
	public int updateComment(CorrectionComment comment) {
		// TODO Auto-generated method stub
		return correctionCommentDao.updateComment(comment);
	}

}
