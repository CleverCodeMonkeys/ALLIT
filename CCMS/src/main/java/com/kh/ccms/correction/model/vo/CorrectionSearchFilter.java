package com.kh.ccms.correction.model.vo;

public class CorrectionSearchFilter {
	private String searchValue;
	private String filterValue;
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getFilterValue() {
		return filterValue;
	}
	public void setFilterValue(String filterValue) {
		this.filterValue = filterValue;
	}
	
	public CorrectionSearchFilter(String searchValue, String filterValue) {
		super();
		this.searchValue = searchValue;
		this.filterValue = filterValue;
	}
	
	public CorrectionSearchFilter() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
