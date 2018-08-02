package com.kh.ccms.resume.model.makeBoxHTML;

public class DegreeBox 
{
	private static final String DEGREE_HEADER = "<div class = 'w3-row' style='margin-top: 30px; font-family: penB; padding-bottom: 5%;'>";
	
	 private static final String DEGREE_SCHOOL_TYPE = 
			    /*"<div class ='w3-col m2 w3-center'>" +
	   			"<label class='inp'>" +
			    "<input type='text' placeholder='&nbsp;' name = 'schoolType' class='cInput'>" +
	   			"<span class='label'>학교타입</span>" +
			    "<span class='border'></span>" + 
	   			"</label>"+
			    "</div>";*/
			 	"<div class ='w3-col m3 w3-center'>" +
			 	" <div include='form-input-select()'>" +
			    "<select name='schoolType' class ='selectType'>" +
			 	"<option value=''>학교타입</option>" +
			    "<option value='대학교(4년) 졸업'}>대학교(4년) 졸업</option>" +
			 	"<option value='대학(2,3년) 졸업'}>대학(2,3년) 졸업</option>" +
			    "<option value='대학원 졸업'}>대학원 졸업</option>" + 
			 	"</select>" +
			    "</div></div>";
			     
	 private static final String DEGREE_SCHOOL_NAME = 
			 "<div class ='w3-col m3 w3-center'>" +
			 "<label class='inp'>" + 
			 "<input type='text' placeholder='&nbsp;' name = 'universityName' class='cInput'>" +
			 "<span class=label>학교명</span>" +
			 "<span class='border'></span>" +
			 "</label>" +
			 "</div>";
	 
	 private static final String DEGREE_SCHOLL_EROLL_DATE = 
			 "<div class ='w3-col m3 w3-center'>" +
			 "<label class='inp'>" +
			 "<input type='date' placeholder='&nbsp;' name = 'enrollDate' class='cInput'>" +
			 "<span class='label'>입학일</span>" +
			 "<span class='border'></span>" +
			 "</label>" +
			 "</div>";
	 
	 private static final String DEGREE_SCHOLL_GRADU_DATE = 
			 "<div class ='w3-col m3 w3-center'>" +
			 "<label class='inp'>" +
	 		 "<input type='date' placeholder='&nbsp;' name = 'graduDate' class='cInput'>" +
	 		 "<span class='label'>졸업일</span>" +
	 		 "<span class='border'></span>" +
	 		 "</label>" +
	 		 "</div>";
	 
	 private static final String DEGREE_FOOTER = "</div>";
	 
	 private static final String DEGREE_MAJOR = 
			 "<div class ='w3-col m6 w3-center'>" +
			 "<label class='inp'>" +
			 "<input type='text' placeholder='&nbsp;' name = 'major' class='cInput'>" +
			 "<span class='label'>전공명</span>" +
			 "<span class='border'></span>" +
			 "</label>" +
			 "</div>";
	 
	 private static final String DEGREE_SCORE =
			 "<div class ='w3-col m3 w3-center'>" +
			 "<label class='inp'>"+
			 "<input type='number' placeholder='&nbsp;' name = 'score' class='cInput' step='0.1'>" + 
			 "<span class='label'>학점</span>" +
			 "<span class='border'></span>" + 
			 "</label>" +
			 "</div>";
	 
	 private static final String DEGREE_TOTAL = 
			 "<div class ='w3-col m3 w3-center'>" +
			 "<label class='inp'>" +
			 "<input type='number' placeholder='&nbsp;' name = 'totalScore' class='cInput' step='0.1'>" +
			 "<span class='label'>총점</span>"+
			 "<span class='border'></span>" +
			 "</label>" +
			 "</div>";
	 
	 // 2 AND 4 NNED SET UNIQUE ID;	 
	 public static final String DEGREE_UP_LINE =  
			 DEGREE_HEADER +
			 DEGREE_SCHOOL_TYPE + DEGREE_SCHOOL_NAME + DEGREE_SCHOLL_EROLL_DATE + DEGREE_SCHOLL_GRADU_DATE +
			 DEGREE_FOOTER;
	 
	 public static final String DEGREE_DOWN_LINE =  
					 DEGREE_HEADER +DEGREE_MAJOR + 
					 DEGREE_SCORE + DEGREE_TOTAL + DEGREE_FOOTER;
}
