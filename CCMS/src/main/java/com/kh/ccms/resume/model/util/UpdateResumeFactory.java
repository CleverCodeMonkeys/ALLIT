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

public class UpdateResumeFactory 
{
	private HttpServletRequest req;
	private ResumeServiceImple service;
	private final String CHECK_T = "1";
	private final int ERROR_EXCEPTION = -1;
	private int resumeId;
	private String memberId;
	private ResumeComplete resumeComplete;
	
	// New
	private MultipartFile file;
	
	public UpdateResumeFactory(HttpServletRequest req, ResumeServiceImple service,
			int resumeId, String memberId, MultipartFile file){
		this.req = req;
		this.service = service;
		this.resumeId = resumeId;
		this.memberId = memberId;
		this.file = file;
	}
	
	public int updateIntoFactory() throws Exception
	{
		int result = 0;
		
		boolean degreeValue = req.getParameter("hiddenDegree").equals(CHECK_T) ? true : false;
		boolean eduValue = req.getParameter("hiddenEdu").equals(CHECK_T) ? true : false;
		boolean certValue = req.getParameter("hiddenCert").equals(CHECK_T)? true : false;
		boolean awardValue = req.getParameter("hiddenAward").equals(CHECK_T) ? true : false;
		boolean langValue = req.getParameter("hiddenLang").equals(CHECK_T) ? true : false;
		boolean portValue = req.getParameter("hiddenPort").equals(CHECK_T) ? true : false;
		boolean introdValue = req.getParameter("hiddenIntrod").equals(CHECK_T) ? true : false;
		
		//For Update
		resumeComplete = new ResumeCompleteFactory().createResumeComple(resumeId, service);
		if(resumeComplete == null) return ERROR_EXCEPTION;
		
		// update Resume and Hope Condition
		result = (updateResume() != ERROR_EXCEPTION) ? 1 : ERROR_EXCEPTION;
		
		if(result == ERROR_EXCEPTION) return result;
		
		updateHighSchool();
		updateHopeCondition();
		
		if(degreeValue) updateDegree();
		else deleteAllDegree();
		
		if(eduValue) updateEdu();
		else deleteAllEdu();
		
		if(certValue) updateCert();
		else deleteAllCertificate();
		
		if(awardValue) updateAward();
		else deleteAllAward();
		
		if(langValue) updateLang();
		else deleteAllLang();
		
		if(introdValue) updateIntroduction();
		else deleteAllIntrod();
		
		if(portValue) updatePort();
		else deleteAllPort();
				
		return result;
	}
	
	private void updatePort() {
		String[] url = req.getParameterValues(ScriptResumeValue.PORTPOLIO_URL);
		
		int beforePortSize = resumeComplete.getPortpolioList() == null ? 0 : resumeComplete.getPortpolioList().size();
		
		if(url != null){
			boolean more = beforePortSize > url.length ? true : false;
			
			for(int i = 0; i < url.length; i++){
				Portpolio port = new Portpolio(resumeId, ERROR_EXCEPTION, url[i], null);
				
				if(more){
					port.setPortId(resumeComplete.getPortpolioList().get(i).getPortId());
					UpdateOrDeletePortpolio(port);
				}else{
					if(i < beforePortSize){
						port.setPortId(resumeComplete.getPortpolioList().get(i).getPortId());
						UpdateOrDeletePortpolio(port);
					}else{
						if(canInsertPort(port))
							service.insertItem(port, ScriptResumeValue.INSERT, ScriptResumeValue.PORTPOLIO);
					}
				}
			}
			
			if(more){
				for(int i = url.length; i < beforePortSize; i++){
					service.deleteItem(resumeComplete.getPortpolioList().get(i).getPortId(), 
							ScriptResumeValue.DELETE, ScriptResumeValue.PORTPOLIO);
				}
			}
			
		}else{
			for(int i = 0; i < beforePortSize; i++){
				service.deleteItem(resumeComplete.getPortpolioList().get(i).getPortId(), 
						ScriptResumeValue.DELETE, ScriptResumeValue.PORTPOLIO);
			}
		}
		
	}
	
	private void deleteAllPort(){
		int beforePortSize = resumeComplete.getPortpolioList() == null ? 0 : resumeComplete.getPortpolioList().size();
		for(int i = 0; i < beforePortSize; i++){
			service.deleteItem(resumeComplete.getPortpolioList().get(i).getPortId(), 
					ScriptResumeValue.DELETE, ScriptResumeValue.PORTPOLIO);
		}
	}
	
	private void UpdateOrDeletePortpolio(Portpolio port){
		if(port.getUrl().trim().equals(""))
			service.deleteItem(port.getPortId(), ScriptResumeValue.DELETE, ScriptResumeValue.PORTPOLIO);
		else
			service.updateItem(port, ScriptResumeValue.UPDATE, ScriptResumeValue.PORTPOLIO);
	}
	
	private boolean canInsertPort(Portpolio port){		
		return port.getUrl().trim().equals("") ? false : true;
	}

	private void updateIntroduction() throws Exception
	{
		String[] introductionTitle = req.getParameterValues(ScriptResumeValue.INTRODUCTION_TITLE);
		String[] contents = req.getParameterValues(ScriptResumeValue.INTRODUCTION_CONTENT);
		
		int beforeIntrodSize = resumeComplete.getIntroductionList() == null ? 0 : resumeComplete.getIntroductionList().size();
		
		if(introductionTitle != null){
			
			boolean more = beforeIntrodSize > introductionTitle.length ? true : false;
			
			for(int i = 0; i < introductionTitle.length; i++){
				Introduction introd = 
						new Introduction(resumeId, ERROR_EXCEPTION, introductionTitle[i], contents[i]);
				
				if(more){
					introd.setIntroId(resumeComplete.getIntroductionList().get(i).getIntroId());
					updateOrDeleteIntroduction(introd);
				}else{
					if(i < beforeIntrodSize){
						introd.setIntroId(resumeComplete.getIntroductionList().get(i).getIntroId());
						updateOrDeleteIntroduction(introd);
					}else if(canInsertIntroduction(introd)) service.insertItem(introd, ScriptResumeValue.INSERT, ScriptResumeValue.INTRODUCTION);
				}
				
			}
			// Delete Remain Introduction Data
			if(more){
				for(int i = introductionTitle.length; i < beforeIntrodSize; i++)
					service.deleteItem(resumeComplete.getIntroductionList().get(i).getIntroId(), 
							ScriptResumeValue.DELETE, ScriptResumeValue.INTRODUCTION);
			}
			
		}else{
			for(int i = 0; i < beforeIntrodSize; i++)
				service.deleteItem(resumeComplete.getIntroductionList().get(i).getIntroId(), 
						ScriptResumeValue.DELETE, ScriptResumeValue.INTRODUCTION);
		}
	}
	
	private void deleteAllIntrod(){
		int beforeIntrodSize = resumeComplete.getIntroductionList() == null ? 0 : resumeComplete.getIntroductionList().size();
		for(int i = 0; i < beforeIntrodSize; i++)
			service.deleteItem(resumeComplete.getIntroductionList().get(i).getIntroId(), 
					ScriptResumeValue.DELETE, ScriptResumeValue.INTRODUCTION);
	}
	
	private void updateOrDeleteIntroduction(Introduction introd){
		if(!(introd.getTitle().trim().equals("") && introd.getContent().trim().equals("")))
			service.updateItem(introd, ScriptResumeValue.UPDATE, ScriptResumeValue.INTRODUCTION);
		else 
			service.deleteItem(introd.getIntroId(), ScriptResumeValue.DELETE, ScriptResumeValue.INTRODUCTION);
	}
	
	private boolean canInsertIntroduction(Introduction introd){
		return !(introd.getTitle().trim().equals("") && introd.getContent().trim().equals("")) ? true : false;
	}

	private void updateLang() throws Exception
	{
		String[] langName = req.getParameterValues(ScriptResumeValue.LANG_NAME);
		String[] testName = req.getParameterValues(ScriptResumeValue.LANG_TEST_NAME);
		String[] score = req.getParameterValues(ScriptResumeValue.LANG_SCORE);
		String[] getDate = req.getParameterValues(ScriptResumeValue.LANG_GET_DATE);
		
		int beforeLangSize = resumeComplete.getCertiLanguageList() == null ? 0 : resumeComplete.getCertiLanguageList().size();
		
		if(langName != null){
			
			boolean more = beforeLangSize > langName.length ? true : false;
			
			for(int i = 0; i < langName.length; i++){
				CertificateLanguage lang = new CertificateLanguage.LanguageBuilder().
						setLangName(langName[i]).
						setTestName(testName[i]).
						setScore(score[i]).build();
				
				if(getDate[i] != null && !getDate[i].equals(""))
					lang.setGetDate(java.sql.Date.valueOf(getDate[i]));
							
				lang.setId(resumeId);
				
				if(more){
					lang.setLangId(resumeComplete.getCertiLanguageList().get(i).getLangId());
					updateOrDeleteLanguage(lang);
				}else
				{
					if(i < beforeLangSize){
						lang.setLangId(resumeComplete.getCertiLanguageList().get(i).getLangId());
						updateOrDeleteLanguage(lang);
					}else if(canInsertLang(lang)) service.insertItem(lang, ScriptResumeValue.INSERT, ScriptResumeValue.LANG);
				}
				
			}
			
			// Delete Remain Language Data
			if(more){
				for(int i = langName.length; i < beforeLangSize; i++){
					service.deleteItem(resumeComplete.getCertiLanguageList().get(i).getLangId(), 
							ScriptResumeValue.DELETE, ScriptResumeValue.LANG);
				}
			}
			
		}else{
			for(int i = 0; i < beforeLangSize; i++){
				service.deleteItem(resumeComplete.getCertiLanguageList().get(i).getLangId(), 
						ScriptResumeValue.DELETE, ScriptResumeValue.LANG);
			}
		}
	}
	
	private void deleteAllLang(){
		int beforeLangSize = resumeComplete.getCertiLanguageList() == null ? 0 : resumeComplete.getCertiLanguageList().size();
		for(int i = 0; i < beforeLangSize; i++){
			service.deleteItem(resumeComplete.getCertiLanguageList().get(i).getLangId(), 
					ScriptResumeValue.DELETE, ScriptResumeValue.LANG);
		}
	}
	
	private void updateOrDeleteLanguage(CertificateLanguage lang){
		if(!(lang.getLanguageName().trim().equals("") && lang.getTestName().trim().equals("") &&
				lang.getGetDate() == null && lang.getScore().trim().equals("")))
		service.updateItem(lang, ScriptResumeValue.UPDATE, ScriptResumeValue.LANG);
		else service.deleteItem(lang.getLangId(), ScriptResumeValue.DELETE, ScriptResumeValue.LANG);
	}
	
	private boolean canInsertLang(CertificateLanguage lang){
		return !(lang.getLanguageName().trim().equals("") && lang.getTestName().trim().equals("") &&
				lang.getGetDate() == null && lang.getScore().trim().equals("")) ? true : false;
	}

	private void updateAward() throws Exception
	{
		String[] awardTitle = req.getParameterValues(ScriptResumeValue.AWARD_TITLE);
		String[] awardContent = req.getParameterValues(ScriptResumeValue.AWARD_CONTENT);
		String[] awardOrgan = req.getParameterValues(ScriptResumeValue.AWARD_ORGANIZATION);
		String[] getAward =req.getParameterValues(ScriptResumeValue.AWARD_DATE);
		
		int beforeAwardSize = resumeComplete.getAwardList() == null ? 0 : resumeComplete.getAwardList().size();
		
		if(awardTitle != null){
			
			boolean more = beforeAwardSize > awardTitle.length ? true : false;
			
			for(int i = 0; i <awardTitle.length; i++){
				Award award = new Award.AwardBuilder().
						setAwardContent(awardContent[i]).
						setAwardOrgan(awardOrgan[i]).
						setTitle(awardTitle[i]).build();
				
				if(getAward[i] != null && !getAward[i].equals(""))
					award.setAwardDate(java.sql.Date.valueOf(getAward[i]));
							
				award.setId(resumeId);
				
				if(more){
					award.setAwardId(resumeComplete.getAwardList().get(i).getAwardId());
					updateOrDeleteAward(award);
				}else{
					if(i < beforeAwardSize){
						award.setAwardId(resumeComplete.getAwardList().get(i).getAwardId());
						updateOrDeleteAward(award);
					}else if(canInsertAward(award)) service.insertItem(award, ScriptResumeValue.INSERT, ScriptResumeValue.AWARD);
				}
			}
			
			// Delete Remain Award Data
			if(more){
				for(int i = awardTitle.length; i < beforeAwardSize; i++)
					service.deleteItem(resumeComplete.getAwardList().get(i).getAwardId(),
							ScriptResumeValue.DELETE, ScriptResumeValue.AWARD);
			}
		}else{
			for(int i = 0; i < beforeAwardSize; i++){
				service.deleteItem(resumeComplete.getAwardList().get(i).getAwardId(),
						ScriptResumeValue.DELETE, ScriptResumeValue.AWARD);
			}
		}
	}
	
	private void deleteAllAward(){
		int beforeAwardSize = resumeComplete.getAwardList() == null ? 0 : resumeComplete.getAwardList().size();
		for(int i = 0; i < beforeAwardSize; i++){
			service.deleteItem(resumeComplete.getAwardList().get(i).getAwardId(),
					ScriptResumeValue.DELETE, ScriptResumeValue.AWARD);
		}
	}
	
	private void updateOrDeleteAward(Award award){
		if(!(award.getAwardContent().trim().equals("") && award.getAwardOrganization().trim().equals("") &&
				award.getAwardDate() == null && award.getAwardTitle().trim().equals("")))
			service.updateItem(award, ScriptResumeValue.UPDATE, ScriptResumeValue.AWARD);
		else service.deleteItem(award.getAwardId(), ScriptResumeValue.DELETE, ScriptResumeValue.AWARD);
	}
	
	private boolean canInsertAward(Award award){
		return !(award.getAwardContent().trim().equals("") && award.getAwardOrganization().trim().equals("") &&
				award.getAwardDate() == null && award.getAwardTitle().trim().equals("")) ? true : false;
	}

	private void updateCert() throws Exception{
		String[] certName = req.getParameterValues(ScriptResumeValue.CERTIFICATE_NAME);
		String[] certFrom = req.getParameterValues(ScriptResumeValue.CERTIFICATE_FROM);
		String[]  certDate = req.getParameterValues(ScriptResumeValue.CERTIFICATE_DATE);
		
		int beforeCertSize = resumeComplete.getCertificateList() == null ? 0 : resumeComplete.getCertificateList().size();
		
		if(certName != null){
			
			boolean more = beforeCertSize > certName.length ? true : false;
			
			for(int i =0; i <certName.length; i++){
				Certificate cert = new Certificate.CertificationBuilder().
						setCertFrom(certFrom[i]).
						setCertificationName(certName[i]).
						build();
				
				if(certDate[i] != null && !certDate[i].equals(""))
					cert.setCertificateDate(java.sql.Date.valueOf(certDate[i]));
								
				cert.setId(resumeId);
				
				if(more){
					cert.setCertificateId(resumeComplete.getCertificateList().get(i).getCertificateId());
					updateOrDeleteCertificate(cert);
				}else{
					if(i < beforeCertSize){
						cert.setCertificateId(resumeComplete.getCertificateList().get(i).getCertificateId());
						updateOrDeleteCertificate(cert);
					}else if(canInsertCertificate(cert)) service.insertItem(cert, ScriptResumeValue.INSERT, ScriptResumeValue.CERTIFICATE);					
				}				
			}
			
			// Delete Remain Certificate Data
			if(more){
				for(int i = certName.length; i < beforeCertSize; i++){
					service.deleteItem(resumeComplete.getCertificateList().get(i).getCertificateId(), 
							ScriptResumeValue.DELETE, ScriptResumeValue.CERTIFICATE);
				}
			}
			
		}else{
			for(int i = 0 ; i < beforeCertSize; i ++){
				service.deleteItem(resumeComplete.getCertificateList().get(i).getCertificateId(), 
						ScriptResumeValue.DELETE, ScriptResumeValue.CERTIFICATE);
			}
		}
	}
	
	private void deleteAllCertificate(){
		int beforeCertSize = resumeComplete.getCertificateList() == null ? 0 : resumeComplete.getCertificateList().size();
		for(int i = 0 ; i < beforeCertSize; i ++){
			service.deleteItem(resumeComplete.getCertificateList().get(i).getCertificateId(), 
					ScriptResumeValue.DELETE, ScriptResumeValue.CERTIFICATE);
		}
	}
	
	private void updateOrDeleteCertificate(Certificate cert){
		if(!(cert.getCertificateDate() == null && cert.getCertificateFrom().trim().equals("") 
				&& cert.getCertificateName().trim().equals("")))
			service.updateItem(cert, ScriptResumeValue.UPDATE, ScriptResumeValue.CERTIFICATE);
		else service.deleteItem(cert.getCertificateId(), ScriptResumeValue.DELETE, ScriptResumeValue.CERTIFICATE);
	}
	
	private boolean canInsertCertificate(Certificate cert){
		return !(cert.getCertificateDate() == null && cert.getCertificateFrom().trim().equals("") 
				&& cert.getCertificateName().trim().equals("")) ? true : false;
	}

	private void updateEdu() throws Exception 
	{
		String[] educationTitle = req.getParameterValues(ScriptResumeValue.ACADEMY_TITLE);
		String[] academyName = req.getParameterValues(ScriptResumeValue.ACADEMY_NAME);
		String[] contents = req.getParameterValues(ScriptResumeValue.ACADEMY_CONTENT);
		String[] enrollDate = req.getParameterValues(ScriptResumeValue.ACADEMY_START_DATE);
		String[] endDate = req.getParameterValues(ScriptResumeValue.ACADEMY_END_DATE);
		
		int beforeEduSize = resumeComplete.getAcademyList() == null ? 0 : resumeComplete.getAcademyList().size();
		
		if(educationTitle != null){
			
			boolean more = beforeEduSize > educationTitle.length ? true : false;
			
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
								
				academy.setId(resumeId);
				
				if(more){
					academy.setAcademyId(resumeComplete.getAcademyList().get(i).getAcademyId());
					updateOrDeleteEdu(academy);
				}else{
					//.. till beforeEdusize
					if(i < beforeEduSize){
						academy.setAcademyId(resumeComplete.getAcademyList().get(i).getAcademyId());
						updateOrDeleteEdu(academy);
					}else if(canInsertEdu(academy)) service.insertItem(academy, ScriptResumeValue.INSERT, ScriptResumeValue.ACADEMY);
					
				}							
			}
			
			// Delete Remain Academy Data
			if(more){
				for(int i = educationTitle.length; i < beforeEduSize; i++){
					service.deleteItem(resumeComplete.getAcademyList().get(i).getAcademyId(), 
							ScriptResumeValue.DELETE, ScriptResumeValue.ACADEMY);
				}
			}
			
		}else{
			//Delete All
			for(int i = 0; i < beforeEduSize; i++){
				service.deleteItem(resumeComplete.getAcademyList().get(i).getAcademyId(), 
						ScriptResumeValue.DELETE, ScriptResumeValue.ACADEMY);
			}
		}
	}
	
	private void deleteAllEdu(){
		int beforeEduSize = resumeComplete.getAcademyList() == null ? 0 : resumeComplete.getAcademyList().size();
		for(int i = 0; i < beforeEduSize; i++){
			service.deleteItem(resumeComplete.getAcademyList().get(i).getAcademyId(), 
					ScriptResumeValue.DELETE, ScriptResumeValue.ACADEMY);
		}
	}

	private void updateOrDeleteEdu(Academy academy){
		if(!(academy.getContent().trim().equals("") && academy.getAcademyName().equals("") &&
				academy.getEducationTitle().equals("") && academy.getStartDate() == null && 
				academy.getEndDate() == null))
			service.updateItem(academy, ScriptResumeValue.UPDATE, ScriptResumeValue.ACADEMY);
		else service.deleteItem(academy.getAcademyId(), ScriptResumeValue.DELETE, ScriptResumeValue.ACADEMY);
	}
	
	private boolean canInsertEdu(Academy academy){
		return !(academy.getContent().trim().equals("") && academy.getAcademyName().equals("") &&
				academy.getEducationTitle().equals("") && academy.getStartDate() == null && 
				academy.getEndDate() == null) ? true : false;
	}
	
	private double[] makeDoubleArray(String[] array){
		if(array == null) return null;
		double[] dArray = new double[array.length];
		for(int i = 0; i < array.length; i++){
			if(array[i] != null || !array[i].equals("")){
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

	private void updateDegree() throws Exception
	{	
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
		
		int beforeDegreeSize = resumeComplete.getDegreeList() == null ? 0 : resumeComplete.getDegreeList().size();
		
		if(schoolName != null){								
					boolean more = beforeDegreeSize > schoolName.length ? true : false;
					
					for(int i = 0 ; i < schoolName.length; i++){
						Degree degree = new Degree.DegreeBuilder().
								setSchoolName(schoolName[i]).
								setMajor(major[i]).
								setSchoolType(schoolType[i]).
								setScore(scoreDouble[i]).
								setTotalScore(totalScoreDouble[i]).build();
						
						// Parent Key Violate
						degree.setId(resumeId);
						
						if(enrollDate[i] != null && !enrollDate[i].equals(""))
							degree.setEnrollDate(java.sql.Date.valueOf(enrollDate[i]));
						
						if(graduDate[i] != null && !graduDate[i].equals(""))
							degree.setGraduDate(java.sql.Date.valueOf(graduDate[i]));
						
						// If before Size more Bigger than Now
						if(more){
							degree.setDegreeId(resumeComplete.getDegreeList().get(i).getDegreeId());
							updateOrDeleteDegree(degree);			
						}else{
							// till schoolName Size..
							if (i < beforeDegreeSize){ 
								degree.setDegreeId(resumeComplete.getDegreeList().get(i).getDegreeId());
								updateOrDeleteDegree(degree);}
							else if(canInsertDegree(degree)) service.insertItem(degree, ScriptResumeValue.INSERT, ScriptResumeValue.DEGREE);						
						}
					}
					
					// Delete Remain Degree.
					if(more){					
						for(int i = schoolName.length; i < beforeDegreeSize; i++)
							service.deleteItem(resumeComplete.getDegreeList().get(i).getDegreeId(), 
									ScriptResumeValue.DELETE, ScriptResumeValue.DEGREE);												
					}
										
				}else{
					// Delete All.
					for(int i = 0 ; i < beforeDegreeSize; i++)
						service.deleteItem(resumeComplete.getDegreeList().get(i).getDegreeId(), 
								ScriptResumeValue.DELETE, ScriptResumeValue.DEGREE);	
				}			
	}
	
	private void deleteAllDegree(){
		int beforeDegreeSize = resumeComplete.getDegreeList() == null ? 0 : resumeComplete.getDegreeList().size();
		for(int i = 0 ; i < beforeDegreeSize; i++)
			service.deleteItem(resumeComplete.getDegreeList().get(i).getDegreeId(), 
					ScriptResumeValue.DELETE, ScriptResumeValue.DEGREE);	
	}
	
	private void updateOrDeleteDegree(Degree degree){
		if(!(degree.getSchoolName().trim().equals("") && degree.getMajor().trim().equals("") && degree.getSchoolType().trim().equals("") &&
				degree.getEnrollDate() == null && degree.getGraduDate() == null && degree.getScore() == 0 &&
				degree.getTotalScore() == 0))
			service.updateItem(degree, ScriptResumeValue.UPDATE, ScriptResumeValue.DEGREE);
		else service.deleteItem(degree.getDegreeId(), ScriptResumeValue.DELETE, ScriptResumeValue.DEGREE);	
	}
	
	private boolean canInsertDegree(Degree degree){
		return !(degree.getSchoolName().trim().equals("") && degree.getMajor().trim().equals("") && degree.getSchoolType().trim().equals("") &&
				degree.getEnrollDate() == null && degree.getGraduDate() == null && degree.getScore() == 0 &&
				degree.getTotalScore() == 0) ? true : false;
	}

	private void updateHighSchool() {
		String highSchoolName = req.getParameter(ScriptResumeValue.SCHOOL_NAME);
		String enrollDate = req.getParameter(ScriptResumeValue.SCHOOL_ENROLL_DATE);
		String graduDate = req.getParameter(ScriptResumeValue.SCHOOL_GRADU_DATE);
		
		HighSchool highSchool = new HighSchool();
		if(highSchoolName.equals("") && enrollDate.equals("") && graduDate.equals("")){}
		else{
			highSchool.setSchoolName(highSchoolName);
			
			if(!enrollDate.equals("")) highSchool.setEnrollDate(java.sql.Date.valueOf(enrollDate));
			if(!graduDate.equals(""))highSchool.setGraduDate(java.sql.Date.valueOf(graduDate));			
			highSchool.setId(resumeId);
			highSchool.setHighSchoolId(resumeComplete.getHighSchool().getHighSchoolId());
			service.updateHighSchool(highSchool);
		}
	}

	private void updateHopeCondition() {
		String salaryString = req.getParameter(ScriptResumeValue.HOPE_SALARY);
		int salary;
		try{
			salary = Integer.parseInt(salaryString);}catch(Exception e){
			salary = 0;	
		}
		
		HopeCondition hope = new HopeCondition.HopeBuilder().
				setJob(req.getParameter(ScriptResumeValue.HOPE_JOB)).
				setLocation(req.getParameter(ScriptResumeValue.HOPE_LOCATION)).
				setSalary(salary).build();
		
		hope.setId(resumeId);
		hope.setConditionId(resumeComplete.getHopeCondition().getConditionId());
		
		if(hope.getJob().equals("") && hope.getLocation().equals("") && hope.getSalary() == 0)
			System.out.println("희망 사항 적힌게 없음.");
		else service.updateHopeCondition(hope);
	}

	private int updateResume() 
	{
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
		
		//Portpolio Handler
		String resumePhoto = req.getParameter(ScriptResumeValue.PHOTO);
		String detect = req.getParameter(ScriptResumeValue.PHOTO_DETECT);
		int value = Integer.parseInt(detect);
		if(value == 0){ // Not Change
			System.out.println("변화 감지 없음.");
			resume.setPhoto(resumePhoto);
		}else{
			// Change Value.
			Resume re = service.selectOneResume(resumeId);
			if(re != null){
				String fileName = re.getPhoto();
				ResumePictureMethod method = new ResumePictureMethod();
				
				//Remove File
				if(!method.removePicture(memberId, req, fileName)) System.out.println("can not Find File Name");
							
				String renameFile = method.SavePicture(memberId, file, req);
				resume.setPhoto(renameFile != null ? renameFile : ScriptResumeValue.DEFAULT_IMAGE);				
			}
		}
		
		if((resume.getTitle() != null) && (!resume.getTitle().equals("")))
		{
			//Test
			/*resume.setLanguage("java,c,c++");*/
			String langs = req.getParameter(ScriptResumeValue.LANGUAGE);
			
			resume.setLanguage((langs != null) && (!langs.equals("")) ? langs : "기타");
			
			resume.setLastEdu(makeLastEdu());
			resume.setId(resumeId);
			if(service.updateResume(resume) > 0) result = 0;				
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
}
