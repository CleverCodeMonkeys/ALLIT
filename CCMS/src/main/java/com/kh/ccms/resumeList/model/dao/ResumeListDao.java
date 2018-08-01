package com.kh.ccms.resumeList.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ccms.resume.model.vo.Resume;

public interface ResumeListDao {
	List<Map<String, String>> selectResumeList(String memberId);

	int selectResumeTotalLists(String memberId);

	int deleteResume(int id);

	int displayResume(Resume resume);

	List<Resume> filterResume(String memberId,String chk);

	Resume selectOneResume(int id);
}
