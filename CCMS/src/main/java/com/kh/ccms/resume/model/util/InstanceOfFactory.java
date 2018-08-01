package com.kh.ccms.resume.model.util;

import java.util.ArrayList;
import java.util.List;

import com.kh.ccms.resume.model.vo.Academy;
import com.kh.ccms.resume.model.vo.Award;
import com.kh.ccms.resume.model.vo.Certificate;
import com.kh.ccms.resume.model.vo.CertificateLanguage;
import com.kh.ccms.resume.model.vo.Degree;
import com.kh.ccms.resume.model.vo.HighSchool;
import com.kh.ccms.resume.model.vo.Introduction;
import com.kh.ccms.resume.model.vo.Portpolio;
import com.kh.ccms.resume.model.vo.ResumeItem;

public class InstanceOfFactory 
{
	List<ResumeItem> list;
	
	public InstanceOfFactory(List<ResumeItem> list){
		this.list = list;
	}
	
	// Make Academy List
	public List<Academy> getAcademyList(){
		List<Academy> aList = null;
		
		if(list != null){
			aList = new ArrayList<Academy>();
			for(int i = 0 ; i < list.size(); i++){
				aList.add((Academy)list.get(i));
			}
		}
		return aList;
	}
	
	public List<Award> geAwardList(){
		List<Award> aList= null;
		
		if(list != null){
			aList = new ArrayList<Award>();
			for(int i = 0; i < list.size(); i++){
				aList.add((Award)list.get(i));
			}
		}
		return aList;
	}
	
	public List<Certificate> getCertificateList(){
		List<Certificate> aList= null;
		
		if(list != null){
			aList = new ArrayList<Certificate>();
			for(int i = 0; i < list.size(); i++)
				aList.add((Certificate) list.get(i));
		}
		
		return aList;
	}
	
	public List<CertificateLanguage> getLangList(){
		List<CertificateLanguage> aList = null;
		
		if(list != null){
			aList = new ArrayList<CertificateLanguage>();
			for(int i = 0; i <list.size(); i++)
				aList.add((CertificateLanguage) list.get(i));
		}
		
		return aList;
	}
	
	public List<Degree> getDegree(){
		List<Degree> aList = null;
		
		if(list != null){
			aList = new ArrayList<Degree>();
			for(int i = 0; i < list.size(); i++)
				aList.add((Degree) list.get(i));
		}
		
		return aList;
	}
	
	public List<HighSchool> getHighSchool(){
		List<HighSchool> aList = null;
		
		if(list != null){
			aList = new ArrayList<HighSchool>();
			for(int i = 0; i <list.size(); i++)
				aList.add((HighSchool) list.get(i));
		}
		
		return aList;
	}
	
	public List<Introduction> getIntroductionList(){
		List<Introduction> aList = null;
		
		if(list != null){
			aList = new ArrayList<Introduction>();
			for(int i = 0; i <list.size(); i++)
				aList.add((Introduction) list.get(i));
		}
		
		return aList;
	}
	
	public List<Portpolio> getPortPolioList(){
		List<Portpolio> aList = null;
		
		if(list != null){
			aList = new ArrayList<Portpolio>();
			for(int i = 0; i < list.size(); i++)
				aList.add((Portpolio) list.get(i));
		}
		
		return aList;
	}
	
}
