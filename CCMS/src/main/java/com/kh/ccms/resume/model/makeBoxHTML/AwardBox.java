package com.kh.ccms.resume.model.makeBoxHTML;

public class AwardBox 
{
	private static final String UP_HEAD = 
			"<div class = 'w3-row' style='margin-top: 30px; font-family: penB;''>";
	
	private static final String FOOTER = "</div>";
	
	private static final String DOWN_HEAD = 
			"<div class = 'w3-row' style='margin-top: 30px; font-family: penB; padding-bottom: 5%;''>";
	
	private static final String NAME = 
			"<div class ='w3-col m6 w3-center'>" +
	        "<label class='inp'>"+
			"<input type='text'  placeholder='&nbsp;' name = 'awardTitle' class='cInput'>" +
	        "<span class='label'>수상명</span>" +
			"<span class='border'></span>" + 
	        "</label>" +
			"</div>";
	
	private static final String ORGAN = 
			"<div class ='w3-col m3 w3-center'>"+ 
			"<label class='inp'>" +
			"<input type='text' placeholder='&nbsp;' name = 'awardOrgan' class='cInput'>" +
			"<span class='label'>수여기관</span>" +
			"<span class='border'></span>" +
			"</label>" +
			"</div>";
	
	private static final String DATE = 
			"<div class ='w3-col m3 w3-center'>" +
	        "<label class='inp'>" +
			"<input type='date' placeholder='&nbsp;' name = 'awardDate' class='cInput'>" +
	        "<span class='label'>수상연도</span>" +
			"<span class='border'></span>" +
	        "</label>" +
			"</div>";
	
	private static final String CONTENT = 
			"<div class ='w3-col m12 w3-center'>" +
			/*"<label class ='inp'>" +
			"<textarea placeholder='내용을 입력해주세요'  name='awardContent' rows='1'" +
			"class= 'eduContent' onkeydown='resize(this);' onkeyup='resize(this);'>" +
			"</textarea>" +
			"<span class='label' style ='margin-left: 4%;'>수여내용</span>" +
			"</label>" +*/
			"<div class='group'>" +
			  "<textarea rows='1' name ='awardContent' onkeyup='resize(this);'></textarea>"+
			  "<span class='bar'></span>" +
			  "<label class = 'textlabel'>수여내용</label>" +
			  "</div>" +
			"</div>";
	
	public static final String UP_LINE = UP_HEAD + NAME + ORGAN + DATE + FOOTER;
	public static final String DOWN_LINE = DOWN_HEAD + CONTENT + FOOTER;
}
