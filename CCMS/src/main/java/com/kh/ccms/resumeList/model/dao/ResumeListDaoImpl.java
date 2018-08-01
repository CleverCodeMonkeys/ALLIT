package com.kh.ccms.resumeList.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ccms.resume.model.vo.Resume;


@Repository
public class ResumeListDaoImpl implements ResumeListDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectResumeList(String memberId) {		
		return sqlSession.selectList("resumeList.selectResumeList",memberId);
	}

	@Override
	public int selectResumeTotalLists(String memberId) {
		return sqlSession.selectOne("resumeList.selectResumeTotalLists", memberId);
	}
	
	@Override
	public int deleteResume(int id) {
		return sqlSession.delete("resumeList.deleteResume",id);
	}

	@Override
	public int displayResume(Resume resume) {
		return sqlSession.update("resumeList.displayResume",resume);
	}

	@Override
	public List<Resume> filterResume(String memberId,String chk) {
		Map<String,String> map = new HashMap<>();
		
		map.put("memberId", memberId);
		map.put("chk", chk);
		
		System.out.println("chk: " + chk);
		return sqlSession.selectList("resumeList.filterResume",map);
	}

	@Override
	public Resume selectOneResume(int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("resumeList.selectOneResume", id);
	}



}
