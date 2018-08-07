package com.kh.ccms.correction.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.correction.model.dao.CorrectionDao;
import com.kh.ccms.correction.model.vo.Correction;
import com.kh.ccms.correction.model.vo.CorrectionSearchFilter;

@Service
public class CorrectionServiceImple implements CorrectionService {
	@Autowired
	CorrectionDao correctionDao;



	@Override
	public int selectCorrectionTotalContents(CorrectionSearchFilter filter) {
		
		return correctionDao.selectCorrectionTotalContents(filter);
	}

	@Override
	public Correction selectCorrectionOne(int correctionId) {
				
		correctionDao.updateCorrectionCount(correctionId);
		return correctionDao.selectCorrectionOne(correctionId);
	}

	@Override
	public List<Map<String, String>> selectCorrectionList(int cPage, int numPerPage, CorrectionSearchFilter filter) {
		
		
		return correctionDao.selectCorrectionList(cPage, numPerPage, filter);
	}

	@Override
	public int insertCorrection(Correction correction) {
		
		return correctionDao.insertCorrection(correction);
	}

	@Override
	public int deleteCorrection(Correction correction) {
		
		return correctionDao.deleteCorrection(correction);
	}

	@Override
	public int updateCorrection(Correction correction) {
		
		return correctionDao.updateCorrection(correction);
	}

	@Override
	public List<Map<String, String>> selectResume(String id) {
		
		return correctionDao.selectResume(id);
	}

	@Override
	public int updateRealPathContent(Correction correction) {
		
		return correctionDao.updateRealPathContent(correction);
	}

}
