package com.kh.ccms.resume.model.util;

public class ScriptResumeValue
{	
	// Query
	public static final String INSERT= "insert";
	public static final String UPDATE= "update";
	public static final String DELETE= "delete";
	public static final String COUNT = "count";
	public static final String SELECT = "select";
	public static final String SELECTONE = "selectone";
	
	// ID Required or not
	public static final String PROFILE = "profile";
	public static final String TITLE = "title";
	public static final String PHOTO = "photo";
	public static final String ADDRESS= "address";
	public static final String TEL = "tel";
	public static final String HOPE_CONDITION = "hopeC";
	public static final String EMAIL = "email";
	public static final String BIRTH = "birth";
	public static final String GENDER = "gender";
	public static final String NAME = "userName";
	public static final String LANGUAGE = "languageValue"; // Add [2018-07-25] Distinguish Language
	
	// Only Name [DEGREE]
	public static final String DEGREE = "degree";
	public static final String DEGREE_SCHOOL_NAME ="universityName";
	public static final String DEGREE_UNIVERSITY_TYPE = "schoolType";
	public static final String DEGREE_ENROLL_DATE = "enrollDate";
	public static final String DEGREE_GRADU_DATE = "graduDate";
	public static final String DEGREE_MAJOR = "major";
	public static final String DEGREE_SCORE = "score";
	public static final String DEGREE_TOTAL_SCORE = "totalScore";
	
	//[HIGH SCHOOL]
	public static final String SCHOOL = "school";
	public static final String SCHOOL_NAME = "highSchoolName";
	public static final String SCHOOL_ENROLL_DATE = "school_enroll_date";
	public static final String SCHOOL_GRADU_DATE = "school_gradu_date";
	
	// [ACADEMY]
	public static final String ACADEMY = "academy";
	public static final String ACADEMY_TITLE = "educationTitle";
	public static final String ACADEMY_NAME ="academyName";
	public static final String ACADEMY_START_DATE = "startDate";
	public static final String ACADEMY_END_DATE = "endDate";
	public static final String ACADEMY_CONTENT = "content";
	
	//[AWARD]
	public static final String AWARD = "award";
	public static final String AWARD_TITLE = "awardTitle";
	public static final String AWARD_ORGANIZATION = "awardOrgan";
	public static final String AWARD_DATE = "awardDate";
	public static final String AWARD_CONTENT = "awardContent";
	
	//[CERTIFICATE]
	public static final String CERTIFICATE = "certificate";
	public static final String CERTIFICATE_NAME = "certName";
	public static final String CERTIFICATE_FROM ="certFrom";
	public static final String CERTIFICATE_DATE = "certDate";
	
	//[LANGUAGE]
	public static final String LANG = "language";
	public static final String LANG_NAME = "langName";
	public static final String LANG_TEST_NAME = "testName";
	public static final String LANG_SCORE = "langScore";
	public static final String LANG_GET_DATE = "getDate";
	
	//[INTRODUCTION]
	public static final String INTRODUCTION = "introduction";
	public static final String INTRODUCTION_TITLE = "introdTitle";
	public static final String INTRODUCTION_CONTENT = "introdContent";
	
	//[PORTPOLIO]
	public static final String PORTPOLIO = "portpolio";
	public static final String PORTPOLIO_URL = "url";
	public static final String PORTPOLIO_DATA = "data";
	
	//[HOPE CONDITION]
	public static final String HOPE_LOCATION = "location";
	public static final String HOPE_SALARY = "salary";
	public static final String HOPE_JOB = "hopeJob";
	
	//Default Image
	public static final String DEFAULT_IMAGE = "monkeyLogo.jpg";
	
	// State Value
	public static final String PHOTO_DETECT = "detect";
}
