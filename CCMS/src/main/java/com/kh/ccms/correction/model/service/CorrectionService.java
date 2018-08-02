package com.kh.ccms.correction.model.service;


import java.util.List;
import java.util.Map;
import com.kh.ccms.correction.model.vo.Correction;
import com.kh.ccms.correction.model.vo.CorrectionSearchFilter;

public interface CorrectionService {
	
	List<Map<String, String>> selectCorrectionList(int cPage, int numPerPage, CorrectionSearchFilter filter);
	
	int selectCorrectionTotalContents(CorrectionSearchFilter filter);

	Correction selectCorrectionOne(int correctionId);

	int insertCorrection(Correction correction);

	int deleteCorrection(Correction correction);

	int updateCorrection(Correction correction);
	
	
}
