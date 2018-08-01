package com.kh.ccms.resumeList.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.resume.model.vo.Resume;
import com.kh.ccms.resumeList.model.dao.ResumeListDao;


@Service
public class ResumeListServiceImpl implements ResumeListService {

	@Autowired
	ResumeListDao resumeListDao;

	@Override
	public List<Map<String, String>> selectResumeList(String memberId) {
		
		return resumeListDao.selectResumeList(memberId);
	}

	@Override
	public int selectResumeTotalLists(String memberId) {
		return resumeListDao.selectResumeTotalLists(memberId);
	}


	@Override
	public int deleteResume(int id) {
		return resumeListDao.deleteResume(id);
	}

	@Override
	public int displayResume(Resume resume) {
		
		return resumeListDao.displayResume(resume);
	}

	@Override
	public List<Resume> filterResume(String memberId,String chk) {
		if(!chk.equals("true")){
			chk = null;
		}
		return resumeListDao.filterResume(memberId,chk);
	}

	@Override
	public Resume selectOneResume(int id) {
		// TODO Auto-generated method stub
		return resumeListDao.selectOneResume(id);
	}


	
}
