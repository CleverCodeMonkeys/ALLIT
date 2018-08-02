package com.kh.ccms.resume.model.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ccms.common.vo.DegreeValue;
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


public class SaveResumeFactory 
{
	private HttpServletRequest req;
	private ResumeServiceImple service;
	private final String CHECK_T = "1";
	private final int ERROR_EXCEPTION = -1;
	private String memberId;
	private int resumeId;
	
	// New
	private MultipartFile file;
	
	public SaveResumeFactory(HttpServletRequest req, ResumeServiceImple service, String memberId, MultipartFile file){
		this.req = req;
		this.service = service;
		this.memberId = memberId;
		this.file = file;
	}
	
	public int insertIntoFactory() throws Exception
	{
		int result = 0;
		
		boolean degreeValue = req.getParameter("hiddenDegree") != CHECK_T? true : false;
		boolean eduValue = req.getParameter("hiddenEdu") != CHECK_T ? true : false;
		boolean  certValue = req.getParameter("hiddenCert") != CHECK_T? true : false;
		boolean awardValue = req.getParameter("hiddenAward") != CHECK_T ? true : false;
		boolean langValue = req.getParameter("hiddenLang") != CHECK_T ? true : false;
		boolean portValue = req.getParameter("hiddenPort") != CHECK_T ? true : false;
		boolean introdValue = req.getParameter("hiddenIntrod") != CHECK_T ? true : false;
		
		
		// insert Resume and Hope Condition
		result = (insertResume() != ERROR_EXCEPTION) ? 1 : ERROR_EXCEPTION;
		
		if(result == ERROR_EXCEPTION) return result;
		
		insertHopeCondition();
		insertHighSchool();
		
		if(introdValue) insertIntroduction();
		if(degreeValue) insertDegree();
		
		if(eduValue) insertEducation();
		if(certValue) insertCertification();
		if(awardValue) insertAward();
		if(langValue) insertLanganguage();
				
		if(portValue) insertPortpolio();
			
		return result;
	}
	
	// This Content Only have one
	private void insertHopeCondition() {
	
		String salaryString = req.getParameter(ScriptResumeValue.HOPE_SALARY);
		int salary;
		try{
			salaryString = salaryString.replace("-", "");
			salary = Integer.parseInt(salaryString);}catch(Exception e){
			salary = 0;	
		}
		
		HopeCondition hope = new HopeCondition.HopeBuilder().
				setJob(req.getParameter(ScriptResumeValue.HOPE_JOB)).
				setLocation(req.getParameter(ScriptResumeValue.HOPE_LOCATION)).
				setSalary(salary).build();
		
		hope.setId(resumeId);
		
		if(hope.getJob().equals("") && hope.getLocation().equals("") && hope.getSalary() == 0)
			System.out.println("희망 사항 적힌게 없음.");
		else service.insertHopeCondition(hope);
	}
	
	private void insertHighSchool(){
		String highSchoolName = req.getParameter(ScriptResumeValue.SCHOOL_NAME);
		String enrollDate = req.getParameter(ScriptResumeValue.SCHOOL_ENROLL_DATE);
		String graduDate = req.getParameter(ScriptResumeValue.SCHOOL_GRADU_DATE);
		
		HighSchool highSchool = new HighSchool();
		if(highSchoolName.trim().equals("") && enrollDate.equals("") && graduDate.equals("")){}
		else{
			highSchool.setSchoolName(highSchoolName);
			
			if(!enrollDate.equals("")) highSchool.setEnrollDate(java.sql.Date.valueOf(enrollDate));
			if(!graduDate.equals(""))highSchool.setGraduDate(java.sql.Date.valueOf(graduDate));			
			highSchool.setId(resumeId);
			service.insertHighSchool(highSchool);
		}
		
	}

	private int insertResume() {
		int result = ERROR_EXCEPTION;
		
		Resume resume = new Resume.ResumeBuilder(memberId)
				.setTitle(req.getParameter(ScriptResumeValue.TITLE)).
				setAddress(req.getParameter(ScriptResumeValue.ADDRESS)).
				setBirthday(req.getParameter(ScriptResumeValue.BIRTH)).
				setGender(req.getParameter(ScriptResumeValue.GENDER)).
				setName(req.getParameter(ScriptResumeValue.NAME)).
				/*setPhoto(req.getParameter(ScriptResumeValue.PHOTO)).*/
				setEmail(req.getParameter(ScriptResumeValue.EMAIL)).
				setTel(req.getParameter(ScriptResumeValue.TEL)).build();
	
		// Photo Handler.
		String resumePhoto = req.getParameter(ScriptResumeValue.PHOTO);
		TempPictureMemorize memorize = TempPictureMemorize.getInstance();

		if(memorize.getBeforeName().equals(resumePhoto)){
			ResumePictureMethod method = new ResumePictureMethod();
			memorize.setPictureName(method.SavePicture(memberId, file, req));
			
			resume.setPhoto(memorize.getPictureName() != null ? 
					memorize.getPictureName() : ScriptResumeValue.DEFAULT_IMAGE);
			
		}else{
			resume.setPhoto(ScriptResumeValue.DEFAULT_IMAGE);
		}
		// Initialize for Singleton.
		memorize.initialize();
		
		if((resume.getTitle() != null) && (!resume.getTitle().equals("")))
		{
			//Test
			/*resume.setLanguage("Java,C,C++");*/
			String langs = req.getParameter(ScriptResumeValue.LANGUAGE);
					
			resume.setLanguage((langs != null) && (!langs.equals("")) ? langs : "기타");
			
			resume.setLastEdu(makeLastEdu());
			
			if(service.insertResume(resume) > 0){
					resumeId = resume.getId();
					result = 0;
				}
		}
		
		return result;
	}
	
	public String makeLastEdu(){
		String result = DegreeValue.HIGH_SCHOOL;
		String[] array = req.getParameterValues(ScriptResumeValue.DEGREE_UNIVERSITY_TYPE);
		
		/*대학교(4년)
		대학(2,3년)
		대학원
		고등학교*/
		
		for(String s : array){
			if(s != null){
				if(s.equals(DegreeValue.POSTGRADE)){ 
					result = DegreeValue.POSTGRADE;
					return result;
				}
				
				if(s.equals(DegreeValue.UNIVERSITY)){
					result = DegreeValue.UNIVERSITY;
				}
				
				if(s.equals(DegreeValue.COLLEGE)){
					if(!result.equals(DegreeValue.UNIVERSITY)){
						result = DegreeValue.UNIVERSITY;
					}
				}
			}
		}
		
		return result;
	}

	private void insertIntroduction() throws Exception{
		// TODO Auto-generated method stub
		String[] introductionTitle = req.getParameterValues(ScriptResumeValue.INTRODUCTION_TITLE);
		String[] contents = req.getParameterValues(ScriptResumeValue.INTRODUCTION_CONTENT);
		
		if(introductionTitle != null){
			for(int i = 0; i < introductionTitle.length; i++){
				Introduction introd = 
						new Introduction(resumeId, ERROR_EXCEPTION, introductionTitle[i], contents[i]);
				
					// 구지 빈 값을 DB에 넣을 필요는 없다.
					if(introd.getTitle().trim().equals("") && introd.getContent().trim().equals("")) {}
					else	service.insertItem(introd, ScriptResumeValue.INSERT, ScriptResumeValue.INTRODUCTION); 
			}
		}
	}

	private void insertPortpolio() {
		// TODO Auto-generated method stub
		String [] portUrl = req.getParameterValues(ScriptResumeValue.PORTPOLIO_URL);
		/*String [] portData = req.getParameterValues(ScriptResumeValue.PORTPOLIO_DATA);*/
		if(portUrl != null){
			for(int i =0; i < portUrl.length; i++){
				Portpolio port = new Portpolio(resumeId, ERROR_EXCEPTION,
						portUrl[i], null);
				
				System.out.println(port.toString());
				if(portUrl[i] != null && !portUrl[i].trim().equals(""))
					service.insertItem(port, ScriptResumeValue.INSERT, ScriptResumeValue.PORTPOLIO);
			}
		}
	}

	private void insertLanganguage() {
		// TODO Auto-generated method stub
		String[] langName = req.getParameterValues(ScriptResumeValue.LANG_NAME);
		String[] testName = req.getParameterValues(ScriptResumeValue.LANG_TEST_NAME);
		String[] score = req.getParameterValues(ScriptResumeValue.LANG_SCORE);
		String[] getDate = req.getParameterValues(ScriptResumeValue.LANG_GET_DATE);
		
		if(langName != null){
			for(int i = 0; i < langName.length; i++){
				CertificateLanguage lang = new CertificateLanguage.LanguageBuilder().
						setLangName(langName[i]).
						setTestName(testName[i]).
						setScore(score[i]).build();
				
				if(getDate[i] != null && !getDate[i].equals(""))
					lang.setGetDate(java.sql.Date.valueOf(getDate[i]));
							
				System.out.println(lang.toString());
				lang.setId(resumeId);
				if(!(lang.getLanguageName().trim().equals("") && lang.getTestName().trim().equals("") &&
						lang.getGetDate() == null && lang.getScore().trim().equals("")))
					service.insertItem(lang, ScriptResumeValue.INSERT, ScriptResumeValue.LANG);				
			}
		}
	}

	private void insertAward() {
		// TODO Auto-generated method stub
		String[] awardTitle = req.getParameterValues(ScriptResumeValue.AWARD_TITLE);
		String[] awardContent = req.getParameterValues(ScriptResumeValue.AWARD_CONTENT);
		String[] awardOrgan = req.getParameterValues(ScriptResumeValue.AWARD_ORGANIZATION);
		String[] getAward =req.getParameterValues(ScriptResumeValue.AWARD_DATE);
		
		if(awardTitle != null){
			for(int i = 0; i <awardTitle.length; i++){
				Award award = new Award.AwardBuilder().
						setAwardContent(awardContent[i]).
						setAwardOrgan(awardOrgan[i]).
						setTitle(awardTitle[i]).build();
				
				if(getAward[i] != null && !getAward[i].equals(""))
					award.setAwardDate(java.sql.Date.valueOf(getAward[i]));
							
				award.setId(resumeId);
				System.out.println(award.toString());
				if(!(award.getAwardContent().trim().equals("") && award.getAwardOrganization().equals("") &&
						award.getAwardDate() == null))
					service.insertItem(award, ScriptResumeValue.INSERT, ScriptResumeValue.AWARD);				
			}
		}
	}

	private void insertCertification() {
		// TODO Auto-generated method stub
		String[] certName = req.getParameterValues(ScriptResumeValue.CERTIFICATE_NAME);
		String[] certFrom = req.getParameterValues(ScriptResumeValue.CERTIFICATE_FROM);
		String[]  certDate = req.getParameterValues(ScriptResumeValue.CERTIFICATE_DATE);
		
		if(certName != null){
			for(int i =0; i <certName.length; i++){
				Certificate cert = new Certificate.CertificationBuilder().
						setCertFrom(certFrom[i]).
						setCertificationName(certName[i]).
						build();
				
				if(certDate[i] != null && !certDate[i].equals(""))
					cert.setCertificateDate(java.sql.Date.valueOf(certDate[i]));
								
				System.out.println(cert.toString());
				cert.setId(resumeId);
				if(!(cert.getCertificateDate() == null && cert.getCertificateFrom().trim().equals("") 
						&& cert.getCertificateName().trim().equals("")))
					service.insertItem(cert, ScriptResumeValue.INSERT, ScriptResumeValue.CERTIFICATE); 
				
			}
		}		
	}

	private double[] makeDoubleArray(String[] array){
		if(array == null) return null;
		double[] dArray = new double[array.length];
		for(int i = 0; i < array.length; i++){
			if(array[i] != null || array[i].equals("")){
				try{
					dArray[i] = Double.parseDouble(array[i]);
				}catch(Exception e){
					dArray[i] = 0;
				}
			}else{
				dArray[i] = 0;
			}
		}
		return dArray;
	}

	private void insertEducation() {
		// TODO Auto-generated method stub
		String[] educationTitle = req.getParameterValues(ScriptResumeValue.ACADEMY_TITLE);
		String[] academyName = req.getParameterValues(ScriptResumeValue.ACADEMY_NAME);
		String[] contents = req.getParameterValues(ScriptResumeValue.ACADEMY_CONTENT);
		String[] enrollDate = req.getParameterValues(ScriptResumeValue.ACADEMY_START_DATE);
		String[] endDate = req.getParameterValues(ScriptResumeValue.ACADEMY_END_DATE);
		
		if(educationTitle != null){
			for(int i = 0; i < educationTitle.length; i++){
				Academy academy = new Academy.AcademyBuilder().
						setAcademyName(academyName[i]).
						setContent(contents[i]).
						setEducationTitle(educationTitle[i]).
						build();
				
				if(enrollDate[i] != null && !enrollDate[i].equals(""))
					academy.setStartDate(java.sql.Date.valueOf(enrollDate[i]));
				
				if(endDate[i] != null && !endDate[i].equals(""))
					academy.setEndDate(java.sql.Date.valueOf(endDate[i]));
								
				/*System.out.println(academy.toString());*/
				academy.setId(resumeId);
				
				if(!(academy.getContent().trim().equals("") && academy.getAcademyName().equals("") &&
						academy.getEducationTitle().equals("") && academy.getStartDate() == null && 
						academy.getEndDate() == null))
					service.insertItem(academy, ScriptResumeValue.INSERT, ScriptResumeValue.ACADEMY);			
			}
		}
	}

	private void insertDegree(){
		// Degree Name And Confirm exist or not		
		String[] schoolType = req.getParameterValues(ScriptResumeValue.DEGREE_UNIVERSITY_TYPE);		
		String[] enrollDate = req.getParameterValues(ScriptResumeValue.DEGREE_ENROLL_DATE);
				
		String[] graduDate = req.getParameterValues(ScriptResumeValue.DEGREE_GRADU_DATE);
				
		String[] major  = req.getParameterValues(ScriptResumeValue.DEGREE_MAJOR);
		String[] schoolName  = req.getParameterValues(ScriptResumeValue.DEGREE_SCHOOL_NAME);
				
		String[] score = req.getParameterValues(ScriptResumeValue.DEGREE_SCORE);
		double[] scoreDouble = makeDoubleArray(score);
				
		String[] totalScore = req.getParameterValues(ScriptResumeValue.DEGREE_TOTAL_SCORE);
		double[] totalScoreDouble = makeDoubleArray(totalScore);
				
		if(schoolName != null){
			for(int i = 0; i < schoolName.length; i++){
				Degree degree = new Degree.DegreeBuilder().
						setSchoolName(schoolName[i]).
						setMajor(major[i]).
						setSchoolType(schoolType[i]).
						setScore(scoreDouble[i]).
						setTotalScore(totalScoreDouble[i]).build();
				
				if(enrollDate[i] != null && !enrollDate[i].equals(""))
					degree.setEnrollDate(java.sql.Date.valueOf(enrollDate[i]));
				
				if(graduDate[i] != null && !graduDate[i].equals(""))
					degree.setGraduDate(java.sql.Date.valueOf(graduDate[i]));
				
//				System.out.println(degree.toString());
				if(!(degree.getSchoolName().equals("") && degree.getMajor().equals("") && degree.getSchoolType().equals("") &&
						degree.getEnrollDate() == null && degree.getGraduDate() == null && degree.getScore() == 0 &&
						degree.getTotalScore() == 0))
				{
					degree.setId(resumeId);
					service.insertItem(degree, ScriptResumeValue.INSERT, ScriptResumeValue.DEGREE);				
				}
			}
		}
	}
	
}
