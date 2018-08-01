package com.kh.ccms.resume.model.vo;

import java.io.Serializable;

public class HopeCondition implements Serializable , ResumeItem
{
	private static final long serialVersionUID = 1L;
	private int id;
	private int conditionId;
	private int salary;
	private String location;
	private String job;
	
	public HopeCondition(){}

	/**
	 * @param id
	 * @param conditionId
	 * @param salary
	 * @param location
	 * @param job
	 */
	public HopeCondition(int id, int conditionId, int salary, String location, String job) {
		super();
		this.id = id;
		this.conditionId = conditionId;
		this.salary = salary;
		this.location = location;
		this.job = job;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getConditionId() {
		return conditionId;
	}

	public void setConditionId(int conditionId) {
		this.conditionId = conditionId;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static class HopeBuilder{
		private int id = -1;
		private int conditionId = -1;
		private int salary;
		private String location;
		private String job;
		
		public HopeBuilder(){
			
		}
		
		public HopeBuilder setSalary(int salary){
			this.salary = salary;
			return this;
		}
		
		public HopeBuilder setLocation(String location){
			this.location = location;
			return this;
		}
		
		public HopeBuilder setJob(String job){
			this.job = job;
			return this;
		}
		
		public HopeCondition build(){
			return new HopeCondition(this);
		}
	}
	
	public HopeCondition(HopeBuilder builder){
		this.salary = builder.salary;
		this.job = builder.job;
		this.location = builder.location;
		this.id = builder.id;
		this.conditionId = builder.conditionId;
	}

	@Override
	public String toString() {
		return "HopeCondition [id=" + id + ", conditionId=" + conditionId + ", salary=" + salary + ", location="
				+ location + ", job=" + job + "]";
	}
	
}
