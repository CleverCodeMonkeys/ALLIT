package com.kh.ccms.recruit.model.vo;

public class RecruitFactory 
{
	public RecruitFactory(){ }
	
	public RecruitFilter makeFilterFactory(String job, String lang, String sal, String loc, String edu,
		String age, String gender) {	
		
		RecruitFilter filter = null;

		filter = new RecruitFilter.RecruitBuilder().
				setJob(job).
				setLang(lang).
				setSal(sal).
				setLoc(loc).
				setEdu(edu).
				setAge(age).
				setGender(gender).
				build();
		
		return filter;
		
	}
}
