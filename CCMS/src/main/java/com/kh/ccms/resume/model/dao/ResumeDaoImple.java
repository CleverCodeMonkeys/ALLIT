package com.kh.ccms.resume.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.resume.model.util.ResumeCompleteFactory;
import com.kh.ccms.resume.model.vo.HighSchool;
import com.kh.ccms.resume.model.vo.HopeCondition;
import com.kh.ccms.resume.model.vo.Resume;
import com.kh.ccms.resume.model.vo.ResumeItem;

@Repository
public class ResumeDaoImple implements ResumeDao, ResumeItemDao, HopeConditionDao, HighSchoolDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public HopeCondition selectOneHopeCondition(int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hope.selectOne", id);
	} 

	@Override
	public int insertHopeCondition(HopeCondition hope) {
		// TODO Auto-generated method stub
		return sqlSession.insert("hope.insertHope", hope);
	}

	@Override
	public int updateHopeCondition(HopeCondition hope) {
		// TODO Auto-generated method stub
		return sqlSession.update("hope.updateHope", hope);
	}

	@Override
	public int deleteHopeCondition(int id) {
		// TODO Auto-generated method stub
		return sqlSession.delete("hope.deleteHope", id);
	}

	@Override
	public Resume selectOneResume(int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("resume.selectResumeOne", id);
	}

	@Override
	public int insertResume(Resume resume) {
		// TODO Auto-generated method stub
		return sqlSession.insert("resume.insertResume", resume);
	}

	@Override
	public int updateResume(Resume resume) {
		// TODO Auto-generated method stub
		return sqlSession.update("resume.updateResume", resume);
	}

	@Override
	public int deleteResume(int id) {
		// TODO Auto-generated method stub
		return sqlSession.delete("resume.deleteResume", id);
	}

	@Override
	public List<Resume> selectResumeList(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("resume.selectResumeList", memberId);
	}

	@Override
	public ResumeItem selectItem(int itemId, String queryType, String itemType) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(new ResumeCompleteFactory().makeDaoString(queryType, itemType),itemId);
	}

	@Override
	public List<ResumeItem> selectItemList(int resumeId, String queryType, String itemType) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(new ResumeCompleteFactory().makeDaoString(queryType, itemType), resumeId);
	}

	@Override
	public int insertItem(ResumeItem item, String queryType, String itemType) {
		// TODO Auto-generated method stub
		return sqlSession.insert(new ResumeCompleteFactory().makeDaoString(queryType, itemType), item);
	}

	@Override
	public int updateItem(ResumeItem item, String queryType, String itemType) {
		// TODO Auto-generated method stub
		return sqlSession.update(new ResumeCompleteFactory().makeDaoString(queryType, itemType), item);
	}

	@Override
	public int deleteItem(int itemId, String queryType, String itemType) {
		// TODO Auto-generated method stub
		return sqlSession.delete(new ResumeCompleteFactory().makeDaoString(queryType, itemType), itemId);
	}

	@Override
	public HighSchool selectOneHighSchool(int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("highschool.selectOneHighSchool",id);
	}

	@Override
	public int insertHighSchool(HighSchool school) {
		// TODO Auto-generated method stub
		return sqlSession.insert("highschool.insertHighSchool", school);
	}

	@Override
	public int updateHighSchool(HighSchool school) {
		// TODO Auto-generated method stub
		return sqlSession.update("highschool.updateHighSchool",school);
	}

	@Override
	public int deleteHighSchool(int id) {
		// TODO Auto-generated method stub
		return sqlSession.delete("highschool.deleteHighSchool", id);
	}

}
