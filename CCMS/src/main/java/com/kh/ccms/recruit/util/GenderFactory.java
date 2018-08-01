package com.kh.ccms.recruit.util;

public class GenderFactory {
	
	public String makeQuery(String gender) {
		
		String query = null;
		
		if(gender != "") {
			
			String[] genderArr = gender.split("::");
			
			for(int i=0; i<genderArr.length; i++) {
				
				if(i == 0) query = "GENDER = '" + genderArr[i].charAt(0) + "'";
				else query += " OR GENDER = '" + genderArr[i].charAt(0) + "'";
				
			}	
			
		}
		
		return query;
		
	}
	
}
