package com.kh.ccms.resume.model.dao;

import java.util.List;

import com.kh.ccms.resume.model.vo.Resume;

public interface ResumeDao 
{
	// Resume Interface [Standard]	
		public Resume selectOneResume(int id);
		public List<Resume> selectResumeList(String memberId);
		public int insertResume(Resume resume);
		public int updateResume(Resume resume);
		public int deleteResume(int id);
}
