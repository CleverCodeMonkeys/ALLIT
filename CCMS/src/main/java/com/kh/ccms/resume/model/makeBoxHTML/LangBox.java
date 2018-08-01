package com.kh.ccms.resume.model.makeBoxHTML;

public class LangBox 
{
	private static final String HEAD = 
			"<div class = 'w3-row' style='margin-top: 30px; font-family: penB; padding-bottom: 5%;'>";
	
	private static final String FOOTER = "</div>";
	
	private static final String LANG_NAME = 
			"<div class ='w3-col m4 w3-center'>" +
	        "<label class='inp'>" +
			"<input type='text'  placeholder='&nbsp;' name = 'langName' class='cInput'>" +
	        "<span class='label'>외국어명</span>" +
			"<span class='border'></span>" +
	        "</label>"+
			"</div>";
	
	private static final String TEST = 
			"<div class ='w3-col m4 w3-center'>" +
	        "<label class='inp'>" +
			"<input type='text' placeholder='&nbsp;' name = 'testName' class='cInput'>" +
	        "<span class='label'>공인시험</span>" +
			"<span class='border'></span>" +
	        "</label>" +
			"</div>";
	
	private static final String SCORE = 
			"<div class ='w3-col m2 w3-center'>" +
			"<label class='inp'>" +
			"<input type='text' placeholder='&nbsp;' name = 'langScore' class='cInput'>" +
			"<span class='label'>급수</span>" + 
			"<span class='border'></span>" +
			"</label>" +
			"</div>";
	
	private static final String GET_DATE = 
			"<div class ='w3-col m2 w3-center'>" + 
			"<label class='inp'>" +
			"<input type='date' placeholder='&nbsp;' name = 'getDate' class='cInput'>" +
			"<span class='label'>취득일</span>" +
			"<span class='border'></span>" +
			"</label>"+
			"</div>";
	
	public static final String LANG_LINE = HEAD + LANG_NAME +
			TEST + SCORE +GET_DATE + FOOTER;
}
