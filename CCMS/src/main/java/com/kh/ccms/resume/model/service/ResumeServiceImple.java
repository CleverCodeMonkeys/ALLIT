package com.kh.ccms.resume.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccms.resume.model.dao.ResumeDaoImple;
import com.kh.ccms.resume.model.vo.HighSchool;
import com.kh.ccms.resume.model.vo.HopeCondition;
import com.kh.ccms.resume.model.vo.Resume;
import com.kh.ccms.resume.model.vo.ResumeItem;

@Service
public class ResumeServiceImple implements ResumeService, ResumeItemService, HopeConditionService, HighSchoolService 
{
	@Autowired
	ResumeDaoImple resumeDao;

	@Override
	public Resume selectOneResume(int id) {
		// TODO Auto-generated method stub
		return resumeDao.selectOneResume(id);
	}

	@Override
	public int insertResume(Resume resume) {
		// TODO Auto-generated method stub
		return resumeDao.insertResume(resume);
	}

	@Override
	public int updateResume(Resume resume) {
		// TODO Auto-generated method stub
		return resumeDao.updateResume(resume);
	}

	@Override
	public int deleteResume(int id) {
		// TODO Auto-generated method stub
		return resumeDao.deleteResume(id);
	}

	@Override
	public HopeCondition selectOneHopeCondition(int id) {
		// TODO Auto-generated method stub
		return resumeDao.selectOneHopeCondition(id);
	}

	@Override
	public int insertHopeCondition(HopeCondition hope) {
		// TODO Auto-generated method stub
		return resumeDao.insertHopeCondition(hope);
	}

	@Override
	public int updateHopeCondition(HopeCondition hope) {
		// TODO Auto-generated method stub
		return resumeDao.updateHopeCondition(hope);
	}

	@Override
	public int deleteHopeCondition(int id) {
		// TODO Auto-generated method stub
		return resumeDao.deleteHopeCondition(id);
	}


	@Override
	public List<Resume> selectResumeList(String memberId) {
		// TODO Auto-generated method stub
		return resumeDao.selectResumeList(memberId);
	}

	@Override
	public ResumeItem selectItem(int itemId, String querytype, String itemType) {
		// TODO Auto-generated method stub
		return resumeDao.selectItem(itemId, querytype, itemType);
	}

	@Override
	public List<ResumeItem> selectItemList(int resumeId, String querytype, String itemType) {
		// TODO Auto-generated method stub
		return resumeDao.selectItemList(resumeId, querytype, itemType);
	}

	@Override
	public int insertItem(ResumeItem item, String querytype, String itemType) {
		// TODO Auto-generated method stub
		return resumeDao.insertItem(item, querytype, itemType);
	}

	@Override
	public int updateItem(ResumeItem item, String querytype, String itemType) {
		// TODO Auto-generated method stub
		return resumeDao.updateItem(item, querytype, itemType);
	}

	@Override
	public int deleteItem(int itemId, String queryType, String itemType) {
		// TODO Auto-generated method stub
		return resumeDao.deleteItem(itemId, queryType, itemType);
	}

	@Override
	public HighSchool selectOneHighSchool(int id) {
		// TODO Auto-generated method stub
		return resumeDao.selectOneHighSchool(id);
	}

	@Override
	public int insertHighSchool(HighSchool school) {
		// TODO Auto-generated method stub
		return resumeDao.insertHighSchool(school);
	}

	@Override
	public int updateHighSchool(HighSchool school) {
		// TODO Auto-generated method stub
		return resumeDao.updateHighSchool(school);
	}

	@Override
	public int deleteHighSchool(int id) {
		// TODO Auto-generated method stub
		return resumeDao.deleteHighSchool(id);
	}

}
