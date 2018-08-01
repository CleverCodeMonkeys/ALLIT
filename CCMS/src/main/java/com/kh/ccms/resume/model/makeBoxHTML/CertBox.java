package com.kh.ccms.resume.model.makeBoxHTML;

public class CertBox 
{
	private static final String CERT_HEAD = 
			"<div class = 'w3-row' style='margin-top: 30px; font-family: penB; padding-bottom: 5%;''>";
	
	private static final String CERT_FOOTER = "</div>";
	
	private static final String CERT_NAME = 
			"<div class ='w3-col m6 w3-center'>" +
			"<label class='inp'>" +
			"<input type='text'  placeholder='&nbsp;' name = 'certName' class='cInput'>" +
			"<span class='label'>자격증명</span>" +
			"<span class='border'></span>" +
			"</label>" +
			"</div>";
	
	private static final String CERT_ORGAN = 
			"<div class ='w3-col m3 w3-center'>" +
	        "<label class='inp'>" +
			"<input type='text' placeholder='&nbsp;' name = 'certFrom' class='cInput'>" +
	        "<span class='label'>기관</span>" +
			"<span class='border'></span>" +
	        "</label>" +
			"</div>";
	
	private static final String CERT_DATE = 
			"<div class ='w3-col m3 w3-center'>" +
	        "<label class='inp'>" +
			"<input type='date' placeholder='&nbsp;' name = 'certDate' class='cInput'>" +
	        "<span class='label'>취득일</span>" +
			"<span class='border'></span>" +
	        "</label>" +
			"</div>";
	
	public static final String CERT_LINE = CERT_HEAD + 
			CERT_NAME + CERT_ORGAN + CERT_DATE + CERT_FOOTER;
}
