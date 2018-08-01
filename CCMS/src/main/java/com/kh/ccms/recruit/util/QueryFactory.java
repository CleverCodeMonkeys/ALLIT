package com.kh.ccms.recruit.util;

import java.util.List;

public class QueryFactory {
	
	// sal용 상수
	public static final String SAL1 = "~2,000만원";
	public static final String SAL2 = "2,000~2,500만원";
	public static final String SAL3 = "2,500~3,000만원";
	public static final String SAL4 = "3,000~3,500만원";
	public static final String SAL5 = "3,500~4,000만원";
	public static final String SAL6 = "4,000~4,500만원";
	public static final String SAL7 = "4,500~5,000만원";
	public static final String SAL8 = "5,000~6,000만원";
	public static final String SAL9 = "6,000만원~";
	
	// edu용 상수
	public static final String EDU1 = "대학교(4년) 졸업";
	public static final String EDU2 = "대학(2,3년) 졸업";
	public static final String EDU3 = "대학원 졸업";
	public static final String EDU4 = "고등학교 졸업";
	
	// age용 상수
	private static final String AGE1 = "~25세";
	private static final String AGE2 = "26~30세";
	private static final String AGE3 = "31~35세";
	private static final String AGE4 = "36~40세";
	private static final String AGE5 = "41~50세";
	private static final String AGE6 = "51세 이상";
	
	// order용 상수
	private static final String ORDER1 = "regist";
	private static final String ORDER2 = "update";
	

	// job필터용 쿼리 생성
	public String makeJobQuery(List<String> job){

		String query = null;
		
		if(job != null) {
			
			for(int i=0; i<job.size(); i++) {
				
				if(i == 0) query = "JOB = '" + job.get(i) + "'";
				else query += " OR JOB = '" + job.get(i) + "'";
				
			}	
			
		}

		return query;
		
	}
	
	// lang필터용 쿼리 생성
	public String makeLangQuery(List<String> lang){
		
		String query = null;
		
		if(lang != null) {
			
			for(int i=0; i<lang.size(); i++) {
				
				if(i == 0) {
					query = "LANGUAGE LIKE '" + lang.get(i) + "'"
							+ " OR LANGUAGE LIKE '" + lang.get(i) + ",%'"
							+ " OR LANGUAGE LIKE '%," + lang.get(i) + ",%'"
							+ " OR LANGUAGE LIKE '%," + lang.get(i) + "'";
				}else {
					query += " OR LANGUAGE LIKE '" + lang.get(i) + "'"
							+ " OR LANGUAGE LIKE '" + lang.get(i) + ",%'"
							+ " OR LANGUAGE LIKE '%," + lang.get(i) + ",%'"
							+ " OR LANGUAGE LIKE '%," + lang.get(i) + "'";
				}
				
			}	
			
		}
		
		return query;
		
	}
	
	// sal필터용 쿼리 생성
	public String makeSalQuery(String sal) {
		
		String query = null;
		
		switch(sal) {
		
		case SAL1 : query = "SALARY < 2000"; break;
		case SAL2 : query = "SALARY BETWEEN 2000 AND 2500"; break;
		case SAL3 : query = "SALARY BETWEEN 2500 AND 3000"; break;
		case SAL4 : query = "SALARY BETWEEN 3000 AND 3500"; break;
		case SAL5 : query = "SALARY BETWEEN 3500 AND 4000"; break;
		case SAL6 : query = "SALARY BETWEEN 4000 AND 4500"; break;
		case SAL7 : query = "SALARY BETWEEN 4500 AND 5000"; break;
		case SAL8 : query = "SALARY BETWEEN 5000 AND 6000"; break;
		case SAL9 : query = "SALARY > 6000"; break;
		
		}

		return query;
		
	}
	
	// loc필터용 쿼리 생성
	public String makeLocQuery(List<String> loc){
		
		String query = null;
		
		if(loc != null) {
			
			for(int i=0; i<loc.size(); i++) {
				
				if(i == 0) query = "LOCATION = '" + loc.get(i) + "'";
				else query += " OR LOCATION = '" + loc.get(i) + "'";
				
			}	
			
		}
		
		return query;
		
	}
	
	// edu필터용 쿼리 생성
	public String makeEduQuery(List<String> edu){
		
		String query = null;

		if(edu != null) {
			
			for(int i=0; i<edu.size(); i++) {
				
				if(i == 0) {
					
					switch(edu.get(i)) {
					
					case EDU1 : query = "LAST_EDU = '대학교(4년)'"; break;
					case EDU2 : query = "LAST_EDU = '대학교(2,3년)'"; break;
					case EDU3 : query = "LAST_EDU = '대학원'"; break;
					case EDU4 : query = "LAST_EDU = '고등학교'"; break;
					
					}
					
				} else {
					
					switch(edu.get(i)) {
					
					case EDU1 : query += " OR LAST_EDU = '대학교(4년)'"; break;
					case EDU2 : query += " OR LAST_EDU = '대학교(2,3년)'"; break;
					case EDU3 : query += " OR LAST_EDU = '대학원'"; break;
					case EDU4 : query += " OR LAST_EDU = '고등학교'"; break;
					
					}
					
				}
				
			}
			
		}

		return query;
		
	}
	
	// age필터용 쿼리 생성
	public String makeAgeQuery(String age) {
		
		String query = null;
		
		switch(age) {
		
		case AGE1 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) < 26"; break;
		case AGE2 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 26 AND 30"; break;
		case AGE3 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 31 AND 35"; break;
		case AGE4 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 36 AND 40"; break;
		case AGE5 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 41 AND 50"; break;
		case AGE6 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) > 50"; break;
		
		}
			
		
		return query;
		
	}
	
	// gender필터용 쿼리 생성
	public String makeGenderQuery(List<String> gender) {
		
		String query = null;

		if(gender != null) {

			for(int i=0; i<gender.size(); i++) {
				
				if(i == 0) query = "GENDER = '" + gender.get(i).charAt(0) + "'";
				else query += " OR GENDER = '" + gender.get(i).charAt(0) + "'";
				
			}	
			
		}
		
		return query;
		
	}
	
	// order필터용 쿼리 생성
	public String makeOrderQuery(String order) {
		
		String query = null;
		
		if(!order.equals("")) {
			
			switch(order) {
			
			case ORDER1 : query = "ORDER BY REGIST_DATE DESC"; break;
			case ORDER2 : query = "ORDER BY UPDATE_DATE DESC"; break;
			
			}
						
		}
		
		return query;
		
	}
	
	// search필터용 쿼리 생성
	public String makeSearchQuery(String searchSelect, String searchInput) {
		
		String query = null;
		
		if(!searchInput.equals("")) query = searchSelect + " LIKE '%" + searchInput + "%'";
		
		return query;
		
	}
	
}

























