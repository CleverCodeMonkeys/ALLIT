package com.kh.ccms.recruit.util;

public class EduFactory {

	public static final String EDU1 = "대학교(4년) 졸업";
	public static final String EDU2 = "대학(2,3년) 졸업";
	public static final String EDU3 = "대학원 졸업";
	public static final String EDU4 = "고등학교 졸업";
	
	public String makeQuery(String edu){
		
		String query = null;
		System.out.println(edu);
		if(edu != "") {
			
			String[] eduArr = edu.split("::");
			
			for(int i=0; i<eduArr.length; i++) {
				
				if(i == 0) {
					
					switch(eduArr[i]) {
					
					case EDU1 : query = "SCHOOL_TYPE = '대학교(4년)'"; break;
					case EDU2 : query = "SCHOOL_TYPE = '대학(2,3년)'"; break;
					case EDU3 : query = "SCHOOL_TYPE = '대학원'"; break;
					case EDU4 : query = "SCHOOL_TYPE = '고등학교'"; break;
					
					}
					
				} else {
					
					switch(eduArr[i]) {
					
					case EDU1 : query += " OR SCHOOL_TYPE = '대학교(4년)'"; break;
					case EDU2 : query += " OR SCHOOL_TYPE = '대학(2,3년)'"; break;
					case EDU3 : query += " OR SCHOOL_TYPE = '대학원'"; break;
					case EDU4 : query += " OR SCHOOL_TYPE = '고등학교'"; break;
					
					}
					
				}
				
			}
			
		}

		return query;
		
	}
	
}
