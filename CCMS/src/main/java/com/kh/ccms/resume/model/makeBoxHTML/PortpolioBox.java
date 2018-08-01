package com.kh.ccms.resume.model.makeBoxHTML;

public class PortpolioBox 
{
	private static final String HEAD = 
			"<div class = 'w3-row' style='margin-top: 30px; font-family: penB; padding-bottom: 5%;'>";
	
	private static final String FOOTER = "</div>";

	/*private static final String PORT = 
			"<div class ='w3-col m6 w3-center'>" + 
			"<button class ='w3-cyan w3-btn w3-xlarge' type='button'>URL 추가</button>" +
			"</div>" +
			"<div class ='w3-col m6 w3-center'>" +
			"<button class = 'w3-light-green w3-btn w3-xlarge' type ='button'>파일 추가</button>" +
			"</div>";*/
	
	private static final String PORT = 
			"<div class ='w3-col m12 w3-center'>" +
			"<label class='inp'>" +
           "<input type='text' placeholder='&nbsp;' name = 'url' class='cInput'>" +
           "<span class='label'>URL[주소입력]</span>" +
           "<span class='border'></span> " +
           "</label>" +
           "</div>";
	
	public static final String PORT_LINE = HEAD + PORT + FOOTER;
}
