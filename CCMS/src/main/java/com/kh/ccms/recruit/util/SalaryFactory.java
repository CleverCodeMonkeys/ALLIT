package com.kh.ccms.recruit.util;

public class SalaryFactory {

	public static final String SAL1 = "~2,000만원";
	public static final String SAL2 = "2,000~2,500만원";
	public static final String SAL3 = "2,500~3,000만원";
	public static final String SAL4 = "3,000~3,500만원";
	public static final String SAL5 = "3,500~4,000만원";
	public static final String SAL6 = "4,000~4,500만원";
	public static final String SAL7 = "4,500~5,000만원";
	public static final String SAL8 = "5,000~6,000만원";
	public static final String SAL9 = "6,000만원~";
	
	public String makeQuery(String salary) {
		
		String query = null;
		
		switch(salary) {
		
		case SAL1 : query = "SALARY < 20000000"; break;
		case SAL2 : query = "SALARY BETWEEN 20000000 AND 25000000"; break;
		case SAL3 : query = "SALARY BETWEEN 25000000 AND 30000000"; break;
		case SAL4 : query = "SALARY BETWEEN 30000000 AND 35000000"; break;
		case SAL5 : query = "SALARY BETWEEN 35000000 AND 40000000"; break;
		case SAL6 : query = "SALARY BETWEEN 40000000 AND 45000000"; break;
		case SAL7 : query = "SALARY BETWEEN 45000000 AND 50000000"; break;
		case SAL8 : query = "SALARY BETWEEN 50000000 AND 60000000"; break;
		case SAL9 : query = "SALARY > 60000000"; break;
		
		}

		return query;
		
	}
	
}
