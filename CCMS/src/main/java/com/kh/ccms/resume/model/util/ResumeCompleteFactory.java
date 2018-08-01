package com.kh.ccms.resume.model.util;

import com.kh.ccms.resume.model.service.ResumeServiceImple;

public class ResumeCompleteFactory implements ResumeFactory
{

	@Override
	public ResumeComplete createResumeComple(int resumeId, ResumeServiceImple service) {
		return new PercadeResume(service).makeResumeComplete(resumeId);
	}

	@Override
	public String makeDaoString(String queryType, String itemType) {
		String query = "";
		String front = "";
		String back = "";
		String list = "";
		
		switch(itemType){
			case ScriptResumeValue.ACADEMY : front = "academy."; back = "Academy"; break; // 1			
			case ScriptResumeValue.CERTIFICATE: front = "certificate."; back = "Cert";break; //3
			case ScriptResumeValue.LANG : front = "lang."; back = "Lang"; break;  //4
			case ScriptResumeValue.PORTPOLIO: front = "portpolio."; back = "Port"; break; //5
			case ScriptResumeValue.INTRODUCTION: front = "introduction."; back = "Introd";break; //6
			case ScriptResumeValue.DEGREE: front = "degree."; back = "Degree"; break; //7
			case ScriptResumeValue.AWARD: front = "award."; back = "Award";break; //8
		}
		
		switch(queryType){
			case ScriptResumeValue.INSERT: query = "insert"; break;
			case ScriptResumeValue.UPDATE: query = "update"; break;
			case ScriptResumeValue.SELECT: query = "select"; list = "List"; break; // Almost This is List
			case ScriptResumeValue.SELECTONE: query = "selectOne"; break;
			case ScriptResumeValue.DELETE: query = "delete"; break;
		}

		return front + query + back + list;
	}

	@Override
	public ResumeComplete updateResumeComplete(int resumeId, ResumeServiceImple service) {
		
		return null;
	}
	
}
