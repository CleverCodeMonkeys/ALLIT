package com.kh.ccms.resume.model.makeBoxHTML;

public class BoxMakerFactory 
{
	public static final String DEGREE ="DEGREE";
	public static final String ACADEMY = "ACADEMY";
	public static final String CERT = "CERT";
	public static final String AWARD = "AWARD";
	public static final String LANG = "LANG";
	public static final String PORT = "PORT";
	
	public BoxMakerFactory(){}
	
	public String makeStringBoxFactory(String string, String index){
		String box = "";
		
		switch(string){
			case DEGREE : box = makeDegree(index); break;
			case ACADEMY : box = makeAcademy(index); break;
			case CERT :  box = makeCert(index); break;
			case AWARD : box = makeAward(index); break;
			case LANG :  box = makeLang(index); break;
			case PORT :  box = makePort(index); break;
		}
		
		return box;
	}

	private String makePort(String ID) {
		return CommonBox.COMMON_1 + ID +
				CommonBox.COMMON_3 + ID +
				CommonBox.COMMON_5 + 
				CommonBox.BOX_HEAD +	
					PortpolioBox.PORT_LINE +
				CommonBox.BOX_FOOTER +
				CommonBox.LAST;
	}

	private String makeLang(String ID) {
		return CommonBox.COMMON_1 + ID +
				CommonBox.COMMON_3 + ID +
				CommonBox.COMMON_5 + 
				CommonBox.BOX_HEAD +	
					LangBox.LANG_LINE +
				CommonBox.BOX_FOOTER +
				CommonBox.LAST;
	}

	private String makeAward(String ID) {
		return CommonBox.COMMON_1 + ID +
				CommonBox.COMMON_3 + ID +
				CommonBox.COMMON_5 + 
				CommonBox.BOX_HEAD +	
					AwardBox.UP_LINE +
					AwardBox.DOWN_LINE +
				CommonBox.BOX_FOOTER +
				CommonBox.LAST;
	}

	private String makeCert(String ID) {
		return CommonBox.COMMON_1 + ID +
				CommonBox.COMMON_3 + ID +
				CommonBox.COMMON_5 + 
				CommonBox.BOX_HEAD +	
					CertBox.CERT_LINE +
				CommonBox.BOX_FOOTER +
				CommonBox.LAST;
	}

	private String makeAcademy(String ID) {
	
		return CommonBox.COMMON_1 + ID +
				CommonBox.COMMON_3 + ID +
				CommonBox.COMMON_5 + 
				CommonBox.BOX_HEAD +	
					AcademyBox.ACADEMY_UP_LINE +
					AcademyBox.ACADEMY_DOWN_LINE +
				CommonBox.BOX_FOOTER +
				CommonBox.LAST;
	}

	private String makeDegree(String ID) 
	{		
		return CommonBox.COMMON_1 + ID +
				CommonBox.COMMON_3 + ID +
				CommonBox.COMMON_5 + 
				CommonBox.BOX_HEAD +	
					DegreeBox.DEGREE_UP_LINE +
					DegreeBox.DEGREE_DOWN_LINE +
				CommonBox.BOX_FOOTER +
				CommonBox.LAST;
	}
	
}
