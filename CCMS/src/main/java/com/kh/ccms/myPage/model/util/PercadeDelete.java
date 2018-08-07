package com.kh.ccms.myPage.model.util;

import javax.servlet.http.HttpServletRequest;

import com.kh.ccms.community.model.service.CommunityService;
import com.kh.ccms.correction.model.service.CorrectionService;
import com.kh.ccms.correction.pictureHandler.PictureDelete;
import com.kh.ccms.member.model.vo.Member;
import com.kh.ccms.recruit.model.service.RecruitService;
import com.kh.ccms.resume.model.util.ResumePictureMethod;
import com.kh.ccms.resumeList.model.service.ResumeListService;
import com.kh.ccms.skill.model.service.SkillService;

public class PercadeDelete 
{
	public PercadeDelete(){
		
	}
	
	//1
	private int deleteService(CommunityService communityService, Member m)
	{
		return communityService.communityDeleteFromUser(m.getId());
	}
	
	//2
	private int deleteService(SkillService skillService , Member m){
		return skillService.skillDeleteFromUser(m.getId());
	}
	
	//3
	private int deleteService(CorrectionService correctionService , Member m){
		return correctionService.deleteCorrectionFromUser(m.getId());
	}
	
	//4
	private int deleteService(RecruitService recruitService, Member m){
		return recruitService.deleteFromUser(m.getId());
	}
	
	//5
	private int deleteService(ResumeListService resumeListService, Member m){
		return resumeListService.deleteFromUser(m.getId());
	}
	
	//Percade
	public void excutePercade(CommunityService communityService,
							  SkillService skillService,
							  CorrectionService correctionService,
							  RecruitService recruitService,
							  ResumeListService resumeListService,
							  Member m,
							  HttpServletRequest request
			){
		//Delete From DB by User Id
		deleteService(communityService, m); //1
		deleteService(skillService,m);
		deleteService(correctionService,m);
		deleteService(recruitService,m);
		deleteService(resumeListService,m);
		
		// Delete File Using memberId
		ResumePictureMethod method = new ResumePictureMethod();
		method.removeUserFile(m.getId(), request);
		
		//Delete From Correction Picture File		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload/") + m.getId();
		PictureDelete.deleteAllFiles(path);
	}

	
}
