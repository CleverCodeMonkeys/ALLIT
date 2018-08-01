package com.kh.ccms.common.util;

public class Utils {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		//System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<div class='w3-center' style='margin-top:30px;'><div class='w3-bar w3-border'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<a href='javascript:returnFalse()' class='w3-bar-item w3-button' style='pointer-events: none; color: #bbb;'>&laquo;</a>";
		}
		else {
			pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")' class='w3-bar-item w3-button'>&laquo;</a>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<a class='w3-button' style='pointer-events: none; color: #bbb;'>"+pageNo+"</a>";
			} 
			else {
				pageBar += "<a href='javascript:fn_paging("+pageNo+")' class='w3-button'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<a href='javascript:returnFalse()' class='w3-button' style='pointer-events: none; color: #bbb;'>&raquo;</a>";
			
		} else {
			pageBar += "<a href='javascript:fn_paging("+pageNo+")' class='w3-button'>&raquo;</a>";
		}
		
		pageBar += "</div></div>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		pageBar += "<script>";
		pageBar += "function returnFalse(){";
		pageBar += "return false;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

}
