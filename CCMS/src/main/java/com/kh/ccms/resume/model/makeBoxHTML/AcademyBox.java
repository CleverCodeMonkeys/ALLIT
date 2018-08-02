package com.kh.ccms.resume.model.makeBoxHTML;

public class AcademyBox 
{
	private static final String ACADEMY_UP_HEADER = 
			"<div class = 'w3-row' style='margin-top: 30px; font-family: penB;'>";
	
	private static final String ACADEMY_DOWN_HEADER =
			"<div class = 'w3-row' style='margin-top: 30px; font-family: penB; padding-bottom: 5%;'>";
	
	private static final String ACADEMY_FOOTER = "</div>";
	
	private static final String ACADEMY_EDU_NAME =
			"<div class ='w3-col m3 w3-center'>" +
	        "<label class='inp'>" +
			"<input type='text' placeholder='&nbsp;' name = 'educationTitle' class='cInput'>" +
	        "<span class='label'>교육명</span>" +
			"<span class='border'></span>" +
	        "</label>"+
			"</div>";
	
	private static final String ACADEMY_ORGAN = 
			"<div class ='w3-col m3 w3-center'>"+
			"<label class='inp'>" +
			"<input type='text' placeholder='&nbsp;' name = 'academyName' class='cInput'>" +
			"<span class='label'>교육기관</span>" +
			"<span class='border'></span>" +
			"</label>" +
			"</div>";
	
	private static final String ACADEMY_START_DATE =
			"<div class ='w3-col m3 w3-center'>"+
			"<label class='inp'>"+
			"<input type='date' placeholder='&nbsp;' name = 'startDate' class='cInput'>" +
			"<span class='label'>시작년월</span>" +
			"<span class='border'></span>" +
			"</label>" +
			"</div>";
	
	private static final String ACADEMY_END_DATE = 
			"<div class ='w3-col m3 w3-center'>"+
			"<label class='inp'>"+
			"<input type='date' placeholder='&nbsp;' name = 'endDate' class='cInput'>" +
			"<span class='label'>종료년일</span>" +
			"<span class='border'></span>" +
			"</label>" +
			"</div>";
	
	private static final String ACADEMY_CONTENT = 
			"<div class ='w3-col m12 w3-center'>" +
			/*"<label class ='inp'>" +
			"<textarea placeholder='내용을 입력해주세요'  name='content' rows='1'" +
			"class= 'eduContent' onkeydown='resize(this);' onkeyup='resize(this);'>" +
			"</textarea>" +
			"<span class='label' style ='margin-left: 5%;'>내용</span>" +
			"</label>" +*/
			"<div class='group'>" +
			  "<textarea rows='1' name ='content' onkeyup='resize(this);'></textarea>"+
			  "<span class='bar'></span>" +
			  "<label class = 'textlabel'>내용</label></div>"  + 
			"</div>";
	
	public static final String ACADEMY_UP_LINE = 
			ACADEMY_UP_HEADER+
			ACADEMY_EDU_NAME + ACADEMY_ORGAN 
			+ ACADEMY_START_DATE + ACADEMY_END_DATE + ACADEMY_FOOTER;
	
	public static final String ACADEMY_DOWN_LINE = 
		ACADEMY_DOWN_HEADER	+ ACADEMY_CONTENT + ACADEMY_FOOTER;
}
