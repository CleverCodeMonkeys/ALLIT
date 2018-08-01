package com.kh.ccms.recruit.util;

public class JobFactory {

	public JobFactory(){ }
	
	public String makeQuery(String job){
		
		String query = null;
		
		if(job != "") {
			
			String[] jobArr = job.split("::");
			
			for(int i=0; i<jobArr.length; i++) {
				
				if(i == 0) query = "JOB = '" + jobArr[i] + "'";
				else query += " OR JOB = '" + jobArr[i] + "'";
				
			}	
			
		}
		
		return query;
		
	}
	
}
