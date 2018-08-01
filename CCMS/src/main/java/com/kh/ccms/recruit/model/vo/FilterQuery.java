package com.kh.ccms.recruit.model.vo;

public class FilterQuery {

	private String jobQuery;
	private String languageQuery;
	private String salaryQuery;
	private String locQuery;
	private String eduQuery;
	private String ageQuery;
	private String genderQuery;
	private String orderQuery;
	private String searchQuery;
	
	public FilterQuery() {
		super();
	}

	public FilterQuery(String jobQuery, String languageQuery, String salaryQuery, String locQuery, String eduQuery,
			String ageQuery, String genderQuery, String orderQuery, String searchQuery) {
		super();
		this.jobQuery = jobQuery;
		this.languageQuery = languageQuery;
		this.salaryQuery = salaryQuery;
		this.locQuery = locQuery;
		this.eduQuery = eduQuery;
		this.ageQuery = ageQuery;
		this.genderQuery = genderQuery;
		this.orderQuery = orderQuery;
		this.searchQuery = searchQuery;
	}

	public String getJobQuery() {
		return jobQuery;
	}

	public void setJobQuery(String jobQuery) {
		this.jobQuery = jobQuery;
	}

	public String getLanguageQuery() {
		return languageQuery;
	}

	public void setLanguageQuery(String languageQuery) {
		this.languageQuery = languageQuery;
	}

	public String getSalaryQuery() {
		return salaryQuery;
	}

	public void setSalaryQuery(String salaryQuery) {
		this.salaryQuery = salaryQuery;
	}

	public String getLocQuery() {
		return locQuery;
	}

	public void setLocQuery(String locQuery) {
		this.locQuery = locQuery;
	}

	public String getEduQuery() {
		return eduQuery;
	}

	public void setEduQuery(String eduQuery) {
		this.eduQuery = eduQuery;
	}

	public String getAgeQuery() {
		return ageQuery;
	}

	public void setAgeQuery(String ageQuery) {
		this.ageQuery = ageQuery;
	}

	public String getGenderQuery() {
		return genderQuery;
	}

	public void setGenderQuery(String genderQuery) {
		this.genderQuery = genderQuery;
	}

	public String getOrderQuery() {
		return orderQuery;
	}

	public void setOrderQuery(String orderQuery) {
		this.orderQuery = orderQuery;
	}

	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}

	@Override
	public String toString() {
		return "FilterQuery [jobQuery=" + jobQuery + ", languageQuery=" + languageQuery + ", salaryQuery=" + salaryQuery
				+ ", locQuery=" + locQuery + ", eduQuery=" + eduQuery + ", ageQuery=" + ageQuery + ", genderQuery="
				+ genderQuery + ", orderQuery=" + orderQuery + ", searchQuery=" + searchQuery + "]";
	}

}
