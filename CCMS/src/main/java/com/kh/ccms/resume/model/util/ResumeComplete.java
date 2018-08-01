package com.kh.ccms.resume.model.util;
import java.io.Serializable;
import java.util.List;

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

public class ResumeComplete implements Serializable
{
	private static final long serialVersionUID = 1L;

	protected Resume resume;
	protected HighSchool highSchool;
	protected HopeCondition hopeCondition;
	
	protected List<Academy> academyList;
	protected List<Award> awardList;
	protected List<Certificate> certificateList;
	protected List<CertificateLanguage> certiLanguageList;
	protected List<Degree> degreeList;
	protected List<Introduction> introductionList;
	protected List<Portpolio> portpolioList;
	
	public static class ResumeBuilder{
		
		private Resume resume = null;
		private HighSchool highSchool = null;

		private List<Academy> academyList = null;
		private List<Award> awardList = null;
		private List<Certificate> certificateList = null;
		private List<CertificateLanguage> certiLanguageList = null;
		private List<Degree> degreeList = null;
		private List<Introduction> introductionList = null;
		private List<Portpolio> portpolioList = null;
		private HopeCondition hopeCondition = null;
		
		public ResumeBuilder(){}
		
		public ResumeBuilder setResume(Resume resume){
			this.resume = resume;
			return this;
		}
	
		//1
		public ResumeBuilder setAcademyList(List<Academy> academyList)
		{
			this.academyList = academyList;
			return this;
		}
		
		public ResumeBuilder setHighSchool(HighSchool highSchool){
			this.highSchool = highSchool;
			return this;
		}
		
		//3
		public ResumeBuilder setAwardList(List<Award> awardList)
		{
			this.awardList = awardList;
			return this;
		}
		
		//5
		public ResumeBuilder setCertificateList(List<Certificate> certificateList)
		{
			this.certificateList = certificateList;
			return this;
		}
		
		//6
		public ResumeBuilder setCertificateLangList(List<CertificateLanguage> certificateLangList){
			this.certiLanguageList = certificateLangList;
			return this;
		}
		
		//7
		public ResumeBuilder setDegreeList(List<Degree> degreeList)
		{
			this.degreeList = degreeList;
			return this;
		}
		
		//8
		public ResumeBuilder setIntroductionList(List<Introduction> introductionList)
		{
			this.introductionList = introductionList;
			return this;
		}
		
		//10
		public ResumeBuilder setPortpolioList(List<Portpolio> portpolioList){
			this.portpolioList = portpolioList;
			return this;
		}
		
		//11
		public ResumeBuilder setHopeCondition(HopeCondition condition){
			this.hopeCondition = condition;
			return this;
		}
		
		public ResumeComplete build(){
			return new ResumeComplete(this);
		}
	}
	
	
	
	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}



	public HighSchool getHighSchool() {
		return highSchool;
	}



	public void setHighSchool(HighSchool highSchool) {
		this.highSchool = highSchool;
	}



	public HopeCondition getHopeCondition() {
		return hopeCondition;
	}


	public void setHopeCondition(HopeCondition hopeCondition) {
		this.hopeCondition = hopeCondition;
	}

	public List<Academy> getAcademyList() {
		return academyList;
	}

	public void setAcademyList(List<Academy> academyList) {
		this.academyList = academyList;
	}

	public List<Award> getAwardList() {
		return awardList;
	}

	public void setAwardList(List<Award> awardList) {
		this.awardList = awardList;
	}

	public List<Certificate> getCertificateList() {
		return certificateList;
	}

	public void setCertificateList(List<Certificate> certificateList) {
		this.certificateList = certificateList;
	}

	public List<CertificateLanguage> getCertiLanguageList() {
		return certiLanguageList;
	}

	public void setCertiLanguageList(List<CertificateLanguage> certiLanguageList) {
		this.certiLanguageList = certiLanguageList;
	}

	public List<Degree> getDegreeList() {
		return degreeList;
	}

	public void setDegreeList(List<Degree> degreeList) {
		this.degreeList = degreeList;
	}

	public List<Introduction> getIntroductionList() {
		return introductionList;
	}

	public void setIntroductionList(List<Introduction> introductionList) {
		this.introductionList = introductionList;
	}

	public List<Portpolio> getPortpolioList() {
		return portpolioList;
	}

	public void setPortpolioList(List<Portpolio> portpolioList) {
		this.portpolioList = portpolioList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "ResumeComplete [resume=" + resume + ", highSchool=" + highSchool + ", hopeCondition=" + hopeCondition
				+ ", academyList=" + academyList + ", awardList=" + awardList + ", certificateList=" + certificateList
				+ ", certiLanguageList=" + certiLanguageList + ", degreeList=" + degreeList + ", introductionList="
				+ introductionList + ", portpolioList=" + portpolioList + "]";
	}

	public ResumeComplete(ResumeBuilder builder){
		this.academyList = builder.academyList; //1
		this.awardList = builder.awardList;  //3
		this.certificateList = builder.certificateList; //5
		this.certiLanguageList = builder.certiLanguageList; //6
		this.degreeList = builder.degreeList; //7
		this.hopeCondition = builder.hopeCondition; //8
		this.introductionList = builder.introductionList; //9
		this.portpolioList = builder.portpolioList; //11
		
		// Resume Value
		this.resume = builder.resume;
		this.highSchool = builder.highSchool;
	}
	
}
