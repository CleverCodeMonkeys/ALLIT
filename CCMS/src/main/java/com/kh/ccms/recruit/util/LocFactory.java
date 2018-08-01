package com.kh.ccms.recruit.util;

public class LocFactory {

	public String makeQuery(String loc){
		
		String query = null;
		
		if(loc != "") {
			
			String[] locArr = loc.split("::");
			
			for(int i=0; i<locArr.length; i++) {
				
				if(i == 0) query = "LOCATION = '" + locArr[i] + "'";
				else query += " OR LOCATION = '" + locArr[i] + "'";
				
			}	
			
		}
		
		return query;
		
	}
	
}
