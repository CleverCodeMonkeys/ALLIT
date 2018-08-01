package com.kh.ccms.resume.model.util;

import com.kh.ccms.resume.model.service.ResumeServiceImple;

public interface ResumeFactory 
{
	public ResumeComplete createResumeComple(int resumeId , ResumeServiceImple service);
	
	// Distinguish From String type.
	public String makeDaoString(String queryType, String itemType);
	
	public ResumeComplete updateResumeComplete(int resumeId, ResumeServiceImple service);

}
