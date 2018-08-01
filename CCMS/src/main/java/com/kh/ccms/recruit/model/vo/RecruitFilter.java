package com.kh.ccms.recruit.model.vo;

import java.util.Arrays;
import java.util.List;

public class RecruitFilter 
{
	private List<String> rcJob;
	private List<String> rcLang;
	private String rcSal;
	private List<String> rcLoc;
	private List<String> rcEdu;
	private String rcAge;
	private List<String> rcGender; // Static [3]
	
	public RecruitFilter() {}
	
	public RecruitFilter(List<String> rcJob, List<String> rcLang, String rcSal, List<String> rcLoc, List<String> rcEdu,
			String rcAge, List<String> rcGender) {
		super();
		this.rcJob = rcJob;
		this.rcLang = rcLang;
		this.rcSal = rcSal;
		this.rcLoc = rcLoc;
		this.rcEdu = rcEdu;
		this.rcAge = rcAge;
		this.rcGender = rcGender;
	}

	//Builder 
	public static class RecruitBuilder {
		
		private List<String> rcJob = null;
		private List<String> rcLang = null;
		private String rcSal = null;
		private List<String> rcLoc = null;
		private List<String> rcEdu = null;
		private String rcAge = null;
		private List<String> rcGender = null;
		
		public RecruitBuilder(){
			
		}
		
		public RecruitBuilder setJob(String job){
			if(!job.equals(""))
				this.rcJob = Arrays.asList(job.split("::"));
			return this;
		}
		
		public RecruitBuilder setLang(String lang){
			if(!lang.equals(""))
				this.rcLang = Arrays.asList(lang.split("::"));
			return this;
		}
		
		public RecruitBuilder setSal(String rcSal){
			if(!rcSal.equals(""))
				this.rcSal = rcSal;
			return this;
		}
		
		public RecruitBuilder setLoc(String loc){
			if(!loc.equals(""))
				this.rcLoc = Arrays.asList(loc.split("::"));
			return this;
		}
		
		public RecruitBuilder setEdu(String edu){
			if(!edu.equals(""))
				this.rcEdu = Arrays.asList(edu.split("::"));
			return this;
		}
		
		public RecruitBuilder setAge(String rcAge){
			if(!rcAge.equals(""))
				this.rcAge = rcAge;
			return this;
		}
		
		public RecruitBuilder setGender(String gender){
			if(!gender.equals(""))
				this.rcGender = Arrays.asList(gender.split("::"));
			return this;
		}
		
		public RecruitFilter build(){
			return new RecruitFilter(this);
		}	
		
	}
	
	/**
	 *  Builder Pattern , Static Way, Show to easy
	 * */
	public RecruitFilter(RecruitBuilder build) {
		
		this.rcJob = build.rcJob;
		this.rcLang = build.rcLang;
		this.rcSal = build.rcSal;
		this.rcLoc = build.rcLoc;
		this.rcEdu = build.rcEdu;
		this.rcAge = build.rcAge;
		this.rcGender = build.rcGender;
		
	}

	public List<String> getRcJob() {
		return rcJob;
	}

	public void setRcJob(List<String> rcJob) {
		this.rcJob = rcJob;
	}

	public List<String> getRcLang() {
		return rcLang;
	}

	public void setRcLang(List<String> rcLang) {
		this.rcLang = rcLang;
	}

	public String getRcSal() {
		return rcSal;
	}

	public void setRcSal(String rcSal) {
		this.rcSal = rcSal;
	}

	public List<String> getRcLoc() {
		return rcLoc;
	}

	public void setRcLoc(List<String> rcLoc) {
		this.rcLoc = rcLoc;
	}

	public List<String> getRcEdu() {
		return rcEdu;
	}

	public void setRcEdu(List<String> rcEdu) {
		this.rcEdu = rcEdu;
	}

	public String getRcAge() {
		return rcAge;
	}

	public void setRcAge(String rcAge) {
		this.rcAge = rcAge;
	}

	public List<String> getRcGender() {
		return rcGender;
	}

	public void setRcGender(List<String> rcGender) {
		this.rcGender = rcGender;
	}

}
