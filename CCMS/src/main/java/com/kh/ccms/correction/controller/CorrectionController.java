package com.kh.ccms.correction.controller;






import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ccms.correction.model.service.CorrectionCommentService;
import com.kh.ccms.correction.model.service.CorrectionService;
import com.kh.ccms.correction.model.vo.Correction;
import com.kh.ccms.correction.model.vo.CorrectionComment;
import com.kh.ccms.correction.model.vo.CorrectionSearchFilter;
import com.kh.ccms.correction.pictureHandler.PictureDelete;
import com.kh.ccms.correction.pictureHandler.PictureHandler;
import com.kh.ccms.correction.pictureHandler.PictureSave;




@Controller
public class CorrectionController 
{
	@Autowired
	CorrectionService correctionService;
	
	@Autowired
	CorrectionCommentService correctionCommentService;
	
	
	
		
		//header에서 눌렀을 경우 실행되면서 리턴값 전송
				@RequestMapping(value ="/correction/correction.correct", method=RequestMethod.GET)
				public String gotoCorrection(@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage,@RequestParam(value = "sort", required=false, defaultValue=CorrectionSearchFilter.DATE_SORT) String sort,  
				@RequestParam(value="search", defaultValue="") String search, 
				@RequestParam(value="serachKinds", defaultValue=CorrectionSearchFilter.TITLE_KIND) String kinds, Model model){
					
					//Initialize singleton pictureHandler 저장 초기화
					PictureHandler handler = PictureHandler.getInstance();
					if(handler.getRealSaveName() != null){		
					handler.setRealSaveName(new ArrayList<String>());
					}
					
					//@RequestParam으로 페이징 버튼을 눌렀을 때 누른 페이지 값을 가져오며 처음 페이지에 도작했을 경우에는 default값 1을 준다.
					//기본 정렬은 최신순으로 한다.
					
					//한 페이지에  10개 보여줄 꺼임
					int numPerPage = 10;
					
					//검색, 정렬 필터에 값 집어넣기
					CorrectionSearchFilter filter = new CorrectionSearchFilter(search, sort, kinds);
					
					//글 총 개수 (검색어 포함)
					int totalContents = correctionService.selectCorrectionTotalContents(filter);
					
				
					
					if(kinds.equals(CorrectionSearchFilter.TITLE_KIND) || kinds.equals(CorrectionSearchFilter.NAME_KIND)){
						if(sort.equals(CorrectionSearchFilter.DATE_SORT) || sort.equals(CorrectionSearchFilter.COMMENT_SORT)  || sort.equals(CorrectionSearchFilter.SEE_SORT)){
							// 글 리스트 불러오기(최신순) 위에서 쓰는거  기본은 최신순이니까

								List<Map<String, String>> list = correctionService.selectCorrectionList(cPage,numPerPage,filter);
								
								model.addAttribute("list", list).addAttribute("numPerPage",numPerPage).addAttribute("totalContents", totalContents)
								.addAttribute("sort",sort).addAttribute("search", search).addAttribute("kinds", kinds);
								
								
								
							  return "correction/correction";
							} else {
							// 헛짓 대비
								String msg = "요청하신 페이지는 없습니다";
								String loc = "correction/correction";
								
								model.addAttribute("msg", msg).addAttribute(loc);
								
								return "common/msg";
							}
					}else {
						// 헛짓 대비
						String msg = "요청하신 페이지는 없습니다";
						String loc = "correction/correction";
						
						model.addAttribute("msg", msg).addAttribute(loc);
						
						return "common/msg";
					}
					
					
				}
	
		//페이지 제목을 눌렀을 때 자세히 보기로 가기
		@RequestMapping(value ="/correction/correctionView.correct", method=RequestMethod.GET)
		public String gotoCorrectionView(@RequestParam("no") int correctionId, Model model){
			// 글 객체
			Correction correction = correctionService.selectCorrectionOne(correctionId);
			
		
			// 댓글 객체
			List<Map<String,String>> commentList = correctionCommentService.selectCommentList(correctionId);
			int commentCount = correctionCommentService.selectCommentCount(correctionId);
			
			 
			
			
			model.addAttribute("correction", correction).addAttribute("commentList", commentList)
				.addAttribute("commentCount", commentCount);
	
		
			return "correction/correction-specificView";
		}
		
	
		//글 작성 화면으로 go
		@RequestMapping(value ="/correction/correctionWrite.correct", method=RequestMethod.GET)
		public String gotoCorrectionWrite(){
			
			
			
			return "correction/correction-write";
		}
		

		
		//글  insert 하기
		@RequestMapping(value ="/correction/correctionWriteEnd.correct", method=RequestMethod.POST)
		public ModelAndView insertCorrection(@RequestParam(value="content") String content, 
				@RequestParam(value="title") String title, @RequestParam(value = "writeId") String id,
				@RequestParam(value="resumeId", required=false, defaultValue="0") int resumeId, 
				Correction correction, HttpServletRequest req, ModelAndView mv){


				correction = new Correction.CorrectionBuilder().setCorrectionContent(content).setCorrectionTitle(title)
						.setCorrectionUserId(id).setCorrectionResumeId(resumeId).build();

				
	
			correctionService.insertCorrection(correction);
			int cId = correction.getCorrectionId();
			
			
			//정상 경로로 바꾸기
			PictureHandler handler = PictureHandler.getInstance();
			
			PictureSave pSave = new PictureSave();
			pSave.saveRealDate(content, req, id, cId, handler);
			
			Pattern pattern = Pattern.compile("/temp/");
			Matcher matcher = pattern.matcher(correction.getCorrectionContent());
			String rContent = matcher.replaceAll("/");
			correction.setCorrectionContent(rContent);
			
			String corContent = correction.getCorrectionContent();
			
			if(corContent.contains("/rTemp/")){
				String rrContent = corContent.replaceAll("/rTemp/", "/"+cId+"/");
				correction.setCorrectionContent(rrContent);
			}
	
			
			int finalResult = correctionService.updateRealPathContent(correction);
			
			if(finalResult > 0) {
				
				
				mv.setViewName("redirect:/correction/correction.correct");
	
				return mv;
			}
			else{ 
			String msg = "글 작성 오류";
			String loc = "correction/correction";
			
			mv.setViewName("common/msg");
			mv.addObject("msg", msg).addObject("loc",loc);
			
			
			return mv;
			}
		}
		
		//썸머노트 이미지 파일 
		@RequestMapping(value ="/correction/correctionWriteImageEncoding.correct", method=RequestMethod.POST)
		@ResponseBody
		public String handleFileUpload(@RequestParam("file") MultipartFile[] file, @RequestParam("userId") String userId, HttpServletRequest req)
		{
			
			String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload/temp/")+userId+"/rTemp";
			
			File dir = new File(saveDir);
			
			// If not
			 if(!dir.exists()) {
				 dir.mkdirs();			 
			 }
			
			
			return saveFile(file[0], saveDir, req, userId);
			
		}
		
		//썸머노트 이미지파일 변경2
		private String saveFile(MultipartFile file, String saveDir, HttpServletRequest req, String userId){
			UUID uuid = UUID.randomUUID();
			String saveName = uuid + "_" +file.getOriginalFilename();
			String tempDir = saveDir + '\\' + saveName;
			
			PictureHandler handler = PictureHandler.getInstance();
			handler.getRealSaveName().add(saveName);
		
			

			try {
				file.transferTo(new File(tempDir));
			} catch (IllegalStateException | IOException e) {
				
				e.printStackTrace();
				return "/correction/correctionWrite.correct";
			}
		
			
			return getBaseUrl(req) + "/resources/upload/correctionUpload/temp/"+userId+"/rTemp/"+ saveName;
			
		}
		
		// 이력서 등록 modal 띄우기
		@RequestMapping(value="/correction/correctionResumeModal.correct", method=RequestMethod.POST)
		@ResponseBody
		public List<Map<String, String>> resumeModal(@RequestParam(value="id") String id, Model model){
			
			
			List<Map<String, String>> resumeList = correctionService.selectResume(id);
			
			
			return resumeList;	

		}
		
		//이력서 등록 modal에서 등록 버튼 눌렀을 경우 
		@RequestMapping(value="/correction/correctionResumeInsert.correct", method=RequestMethod.POST)
		public String resumeInsert(@RequestParam(value="title") String title, @RequestParam(value="content") String content, 
				@RequestParam(value="cId") int cId, Model model){
			
			model.addAttribute("cId", cId).addAttribute("title", title).addAttribute("content", content);
			return "correction/correction-modify";
		}
		
		//글 수정하기 페이지로 이동
		@RequestMapping(value="/correction/correctionModify.correct", method=RequestMethod.POST)
		public String modifyCorrection(@RequestParam(value="title") String title, @RequestParam(value="content") String content, 
				@RequestParam(value="cId") int cId, Model model){
			
			
			model.addAttribute("cId", cId).addAttribute("title", title).addAttribute("content", content);
			return "correction/correction-modify";
		}
		
		//글 수정하기
		@RequestMapping(value="/correction/correctionModifyEnd.correct", method=RequestMethod.POST)
		public String modifyCorrection(@RequestParam(value="content") String content, 
				@RequestParam(value="title") String title, @RequestParam(value = "userId") String userId,
				@RequestParam(value="resumeId", required=false, defaultValue="0") int resumeId, 
				@RequestParam(value="cId") int cId, Correction correction, HttpServletRequest req, Model model){
					
			//정상 경로로 바꾸기
			Pattern pattern = Pattern.compile("/temp/");
			Matcher matcher = pattern.matcher(content);
			String rContent = matcher.replaceAll("/");
			
			correction.setCorrectionContent(rContent);
			
			String corContent = correction.getCorrectionContent();
			
			String rrContent = corContent.replaceAll("/rTemp/", "/"+cId+"/");
			
			correction = new Correction.CorrectionBuilder().setCorrectionTitle(title).setCorrectionContent(rrContent)
					.setCorrectionResumeId(resumeId).setCorrectionId(cId).setCorrectionUserId(userId).build();
			
			
		
			
			
			int result = correctionService.updateCorrection(correction);
			
		
			PictureHandler handler = PictureHandler.getInstance();
			
			PictureSave pSave = new PictureSave();
			pSave.saveRealDate(content, req, userId, cId, handler);
			
			if(result > 0){
				
						
				String loc = "/correction/correctionView.correct?no=";
				model.addAttribute("loc", loc).addAttribute("cId", cId);
				
			
				
				return  "correction/modifyEndPageGo";

			}
			else{
				String msg = "수정 오류";
				String loc = "correction/correction";
				model.addAttribute("msg", msg).addAttribute("loc", loc);
			return "common/msg";
			}
		}
		
		//글 삭제하기
		@RequestMapping(value="/correction/correctionDelete.correct", method=RequestMethod.POST)
		public String deleteCorrection(@RequestParam(value="cUserId") String cUserId, @RequestParam(value="cId") int cId, HttpServletRequest req ,Model model){
			
			//글 삭제 하기
			Correction correction = new Correction.CorrectionBuilder().setCorrectionUserId(cUserId).setCorrectionId(cId).build();
			int result = correctionService.deleteCorrection(correction);
	
			
			//이미지가 있을 경우 이미지 삭제 
			String ImagePath = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload")+"/"+cUserId+"/"+cId;
			System.out.println("삭제 이미지 경로 :" + ImagePath);
			PictureDelete.deleteAllFiles(ImagePath);

			
			//기본 페이지로 돌아가는 셋팅.
			CorrectionSearchFilter filter = new CorrectionSearchFilter("", "dateSort", "title");
			int totalContents = correctionService.selectCorrectionTotalContents(filter);
			List<Map<String, String>> list = correctionService.selectCorrectionList(1, 10,filter);
			
			model.addAttribute("list", list).addAttribute("numPerPage", 10).addAttribute("totalContents", totalContents)
			.addAttribute("sort", "dateSort").addAttribute("search", "");
			
			if(result>0) return "correction/correction";
			else return "correction/correction";
		}
		
		//글 작성 취소시 temp 파일 삭제 
		@RequestMapping(value="/correction/correctionCancle.correct", method=RequestMethod.POST)
		public String deleteTempFile(@RequestParam(value = "id") String id, @RequestParam(value = "cId", required=false) int cId, HttpServletRequest req, Model model){
			
			//이미 temp파일 경로
			String TempImagePath = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload/temp")+"/"+id+"/"+"rTemp";
			
			PictureDelete.deleteAllFiles(TempImagePath);
			
			
			//기본 페이지로 돌아가는 셋팅.
			CorrectionSearchFilter filter = new CorrectionSearchFilter("", "dateSort", "title");
			int totalContents = correctionService.selectCorrectionTotalContents(filter);
			List<Map<String, String>> list = correctionService.selectCorrectionList(1, 10,filter);
			
			model.addAttribute("list", list).addAttribute("numPerPage", 10).addAttribute("totalContents", totalContents)
			.addAttribute("sort", "dateSort").addAttribute("search", "");
			
			return "correction/correction";
		}
		
		
		//댓글  insert 하기 
		@RequestMapping(value="/correction/correctionCommentWrite.correct", method=RequestMethod.GET)
		@ResponseBody
		public String insertCorrectionComment(@RequestParam(value = "reviewUserId") String id, 
				@RequestParam(value = "reviewContent") String content,
				@RequestParam(value = "correctionId") int correctionId, 
				CorrectionComment comment, Model model){
			
				comment = new CorrectionComment.CorrectionCommentBuilder()
						.setCommentContent(content).
						setCorrectionId(correctionId).
						setCommentUserId(id).build();
				
				
				int result = correctionCommentService.insertComment(comment);
				
				if(result > 0) return "correction/correctionView.correct?no=" + correctionId;
				else return "common/error"; 
			
			

		}
		
		//댓글 수정 하기 
				@RequestMapping(value="/correction/correctionCommentUpdate.correct", method=RequestMethod.GET)
				@ResponseBody
				public String updateCorrectionComment(@RequestParam("commentId") int commentId, @RequestParam("updateContent") String updateContent, 
						@RequestParam("correctionId") int correctionId,CorrectionComment comment){
					
					comment = new CorrectionComment.CorrectionCommentBuilder()
							.setCommentId(commentId).setCommentContent(updateContent).build();
					
					int result = correctionCommentService.updateComment(comment);
					
					if(result > 0) return "correction/correctionView.correct?no=" + correctionId;
					else return "common/error"; 
				}
		
		//댓글 delete하기
		@RequestMapping(value="/correction/correctionCommentDelete.correct", method=RequestMethod.POST)
		@ResponseBody
		public String deleteCorrectionComment(@RequestParam("commentId") int commentId, @RequestParam("correctionId") int correctionId){
			
			int result = correctionCommentService.deleteComment(commentId);
			
			if(result > 0) return "correction/correctionView.correct?no=" + correctionId;
			else return "common/error"; 
		}
		
		// URL 가져오기
		public static String getBaseUrl(HttpServletRequest request) {
		    String scheme = request.getScheme() + "://";
		    String serverName = request.getServerName();
		    String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
		    String contextPath = request.getContextPath();
		    return scheme + serverName + serverPort + contextPath;
		  }
}
