package com.kh.ccms.resume.model.service;

import java.util.List;

import com.kh.ccms.resume.model.vo.Resume;

public interface ResumeService 
{
	// Resume Interface [Standard]	
	public Resume selectOneResume(int id);
	public List<Resume> selectResumeList(String memberId);
	public int insertResume(Resume resume);
	public int updateResume(Resume resume);
	public int deleteResume(int id);
}
