package com.kh.ccms.correction.pageUtil;

public class Paging {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url, String sort, String search, String kinds){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage == 0 ? 1 : cPage;
	
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		System.out.println("pageNo="+pageNo);
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageEnd="+pageEnd);
		
		/*pageBar += "<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>";*/           
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
			System.out.println("pageNo++="+pageNo);
		}
		System.out.println("totalPage="+totalPage);
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		/*pageBar += "<script>";
		pageBar += "function fn_paging(cPage, numPerPage, sort){";
		pageBar += "$.ajax({ ";
		pageBar += "url : '/correction/correction.correct',";
		pageBar += "type : 'GET',";
		pageBar += "data : {sort: '"+sort+"'";
		pageBar += ", cPage:"+cPage; 
		pageBar += "}";
		pageBar += "});";
		pageBar += "}";
		pageBar += "</script>";*/
		
		
		
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar +=  "location.href='"+url+"?sort="+sort+"&search="+search+"&serachKinds="+kinds+"&cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

}
