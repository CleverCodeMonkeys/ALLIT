package com.kh.ccms.recruit.util;

public class AgeFactory {

	private static final String AGE1 = "~25세";
	private static final String AGE2 = "26~30세";
	private static final String AGE3 = "31~35세";
	private static final String AGE4 = "36~40세";
	private static final String AGE5 = "41~50세";
	private static final String AGE6 = "51세 이상";
	
	public String makeQuery(String age) {
		
		String query = null;
		
		if(age != "") {
			
			switch(age) {
			
			case AGE1 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) < 26"; break;
			case AGE2 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 26 AND 30"; break;
			case AGE3 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 31 AND 35"; break;
			case AGE4 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 36 AND 40"; break;
			case AGE5 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) BETWEEN 41 AND 50"; break;
			case AGE6 : query = "(TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(BIRTHDAY, 1, 2)+1900) + 1) > 50"; break;
			
			}
			
		}
		
		return query;
		
	}
	
}
