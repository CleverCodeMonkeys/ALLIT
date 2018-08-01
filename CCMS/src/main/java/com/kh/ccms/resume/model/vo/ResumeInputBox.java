package com.kh.ccms.resume.model.vo;

public class ResumeInputBox 
{    
   
   // Introduction Form [START]
   public static final String INTRO_START = "<div id ='";
   
   public static final String INTRO_FORM =
		   "'>" +
		   "<div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' type ='button' onclick='removeBtn(name)'" +
		   " name='";              
   public static final String INTRO_FORM_NEXT = "'>삭제</button></div>" +
		   "<div class = 'w3-container w3-white boxForm'>" +		   
		   "<div class = 'w3-row inBoxUp'>" +
		   "<div class ='w3-col m8 w3-center'>"+
		   "<label class='inp'>" +
		   "<input type='text'  placeholder='&nbsp;' name = 'introdTitle' class='cInput'>" +
		   "<span class='label'>주제</span>" +
		   "<span class='border'></span>" +
		   " </label></div></div>" +
		  "<div class = 'w3-row inBoxDown'>" +
		  "<div class ='w3-col m12 w3-center'>" +
		 /* "<label class ='inp'>" +
		  "<textarea placeholder='내용을 입력해주세요'  name='introdContent' rows='1'" +
		  "class= 'eduContent' onkeydown='resize(this);' onkeyup='resize(this);'></textarea>" +
		  "<span class='label' style ='margin-left: 5%;'>내용</span></label>" +*/
		  "<div class='group'>" +
		  "<textarea rows='1' name ='introdContent' onkeyup='resize(this);'></textarea>"+
		  "<span class='bar'></span>" +
		  "<label class = 'textlabel'>내용</label>" +
		  "</div>" +
		  "</div></div></div>";         
   public static final String INTRO_PLUS_FORM = "</div>";    
   // Introduction Form [END]

}