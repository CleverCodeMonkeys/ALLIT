package com.kh.ccms.recruit.util;

public class SearchFactory {

	public String makeQuery(String searchSelect, String searchInput) {
		
		String query = null;
		
		if(!searchInput.equals("")) query = searchSelect + " LIKE '%" + searchInput + "%'";
		
		return query;
		
	}
	
}
