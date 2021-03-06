package com.kh.ccms.correction.model.service;


import java.util.List;
import java.util.Map;

import com.kh.ccms.correction.model.vo.Correction;
import com.kh.ccms.correction.model.vo.CorrectionComment;

public interface CorrectionCommentService {

	List<Map<String, String>> selectCommentList(int correctionId);
	
	int selectCommentCount(int correctionId);

	int insertComment(CorrectionComment comment);

	int deleteComment(int commentId);

	int updateComment(CorrectionComment comment);

	
	
}
