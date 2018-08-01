package com.kh.ccms.resume.model.util;

import java.util.List;

import com.kh.ccms.resume.model.service.ResumeServiceImple;
import com.kh.ccms.resume.model.vo.Academy;
import com.kh.ccms.resume.model.vo.Award;
import com.kh.ccms.resume.model.vo.Certificate;
import com.kh.ccms.resume.model.vo.CertificateLanguage;
import com.kh.ccms.resume.model.vo.Degree;
import com.kh.ccms.resume.model.vo.HighSchool;
import com.kh.ccms.resume.model.vo.HopeCondition;
import com.kh.ccms.resume.model.vo.Introduction;
import com.kh.ccms.resume.model.vo.Portpolio;
import com.kh.ccms.resume.model.vo.Resume;

public class PercadeResume 
{
	ResumeServiceImple service;
	
	public PercadeResume(ResumeServiceImple service){
		this.service = service;
	}
	
	public ResumeComplete makeResumeComplete(int resumeId){
		ResumeComplete completeResume = null;
		
		Resume resume = (Resume)service.selectOneResume(resumeId); //1
		
		System.out.println("현재 이력서 : " + resume.toString());
		
		HopeCondition hope = (HopeCondition)service.selectOneHopeCondition(resumeId);
		HighSchool highSchool = (HighSchool)service.selectOneHighSchool(resumeId); // need to Make High School Service
		
		List<Academy> academy =  
				new InstanceOfFactory
				(service.selectItemList(resumeId, 
						ScriptResumeValue.SELECT, ScriptResumeValue.ACADEMY)).
				getAcademyList();
		
		List<Award> award = new 
				InstanceOfFactory
				(service.selectItemList(resumeId, 
						ScriptResumeValue.SELECT, ScriptResumeValue.AWARD)).
				geAwardList(); //3
		
		List<Certificate> cert = new 
				InstanceOfFactory(service.selectItemList(resumeId, 
						ScriptResumeValue.SELECT, ScriptResumeValue.CERTIFICATE)).
				getCertificateList(); //5
		
		List<CertificateLanguage> lang = new 
				InstanceOfFactory(service.selectItemList(resumeId, 
						ScriptResumeValue.SELECT, ScriptResumeValue.LANG)).
				getLangList(); //6
		
		List<Degree> degree = new
				InstanceOfFactory(service.selectItemList(resumeId, 
						ScriptResumeValue.SELECT, ScriptResumeValue.DEGREE)).
				getDegree(); //7
		
		List<Portpolio> portpolio = new 
				InstanceOfFactory(service.selectItemList(resumeId, 
						ScriptResumeValue.SELECT, ScriptResumeValue.PORTPOLIO)).
				getPortPolioList(); //8
		
		List<Introduction> introduction = new 
				InstanceOfFactory(service.selectItemList(resumeId, 
						ScriptResumeValue.SELECT, ScriptResumeValue.INTRODUCTION)).
				getIntroductionList(); //9
		
		// Make Resume Complete
		completeResume = new ResumeComplete.ResumeBuilder().
				setResume(resume).
				setAcademyList(academy).
				setAwardList(award).
				/*setCareerList(career).*/
				setCertificateList(cert).
				setCertificateLangList(lang).
				setDegreeList(degree).
				setPortpolioList(portpolio).
				setIntroductionList(introduction).
				setHighSchool(highSchool).
				setHopeCondition(hope).build();
		
		return completeResume;
	}
}
