package com.kh.ccms.recruit.util;

public class OrderFactory {

	private static final String ORDER1 = "regist";
	private static final String ORDER2 = "update";
	
	public String makeQuery(String order) {
		
		String query = null;
		
		if(!order.equals("")) {
			
			switch(order) {
			
			case ORDER1 : query = "ORDER BY REGIST_DATE DESC"; break;
			case ORDER2 : query = "ORDER BY UPDATE_DATE DESC"; break;
			
			}
						
		}
		
		return query;
		
	}
	
}
