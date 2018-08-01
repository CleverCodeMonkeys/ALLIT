package com.kh.ccms.recruit.util;

public class LanguageFactory 
{
	public static final String LANG1 = "Java";
	public static final String LANG2 = "C";
	public static final String LANG3 = "C++";
	public static final String LANG4 = "Python";
	public static final String LANG5 = "C#";
	public static final String LANG6 = "JavaScript";
	public static final String LANG7 = "PHP";
	public static final String LANG8 = "Assembly";
	public static final String LANG9 = "SQL";
	public static final String LANG10 = "HTML/CSS";
	public static final String LANG11 = "기타";
	
	public String makeQuery(String language){
		
		String query = null;
		
		if(language != "") {
			
			String[] languageArr = language.split("::");
			
			for(int i=0; i<languageArr.length; i++) {
				
				if(i == 0) {
					query = "LANGUAGE LIKE '" + languageArr[i] + "'"
							+ " OR LANGUAGE LIKE '" + languageArr[i] + ",%'"
							+ " OR LANGUAGE LIKE '%," + languageArr[i] + ",%'"
							+ " OR LANGUAGE LIKE '%," + languageArr[i] + "'";
				}else {
					query += " OR LANGUAGE LIKE '" + languageArr[i] + "'"
							+ " OR LANGUAGE LIKE '" + languageArr[i] + ",%'"
							+ " OR LANGUAGE LIKE '%," + languageArr[i] + ",%'"
							+ " OR LANGUAGE LIKE '%," + languageArr[i] + "'";
				}
				
			}	
			
		}
		
		return query;
	}
}









