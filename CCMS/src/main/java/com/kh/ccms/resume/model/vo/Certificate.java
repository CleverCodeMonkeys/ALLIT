package com.kh.ccms.resume.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Certificate implements Serializable , ResumeItem
{
	private static final long serialVersionUID = 1L;
	private int id;
	private int certificateId;
	private String certificateName;
	private String certificateFrom;
	private Date certificateDate;
	
	public Certificate(){}
	
	/**
	 * @param id
	 * @param certificateId
	 * @param certificateName
	 * @param certificateFrom
	 * @param certificateDate
	 */
	public Certificate(int id, int certificateId, String certificateName, String certificateFrom,
			Date certificateDate) {
		super();
		this.id = id;
		this.certificateId = certificateId;
		this.certificateName = certificateName;
		this.certificateFrom = certificateFrom;
		this.certificateDate = certificateDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(int certificateId) {
		this.certificateId = certificateId;
	}

	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	public String getCertificateFrom() {
		return certificateFrom;
	}

	public void setCertificateFrom(String certificateFrom) {
		this.certificateFrom = certificateFrom;
	}

	public Date getCertificateDate() {
		return certificateDate;
	}

	public void setCertificateDate(Date certificateDate) {
		this.certificateDate = certificateDate;
	}
	
	public static class CertificationBuilder{
		private int id = -1;
		private int certificateId = -1;
		private String certificateName = "";
		private String certificateFrom = "";
		private Date certificateDate = null;
		
		public CertificationBuilder(){
			
		}
		
		public CertificationBuilder setCertificationName(String certificateName)
		{
			this.certificateName = certificateName;
			return this;
		}
		
		public CertificationBuilder setCertFrom(String certificateFrom)
		{
			this.certificateFrom = certificateFrom;
			return this;
		}
		
		public CertificationBuilder setDate(Date certificateDate)
		{
			this.certificateDate = certificateDate;
			return this;
		}
		
		public Certificate build(){
			return new Certificate(this);
		}
	}
	
	public Certificate(CertificationBuilder builder){
		this.certificateName = builder.certificateName;
		this.certificateFrom = builder.certificateFrom;
		this.certificateDate = builder.certificateDate;
	}

	@Override
	public String toString() {
		return "Certificate [id=" + id + ", certificateId=" + certificateId + ", certificateName=" + certificateName
				+ ", certificateFrom=" + certificateFrom + ", certificateDate=" + certificateDate + "]";
	}
	
}
