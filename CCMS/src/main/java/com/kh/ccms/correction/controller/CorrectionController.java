package com.kh.ccms.correction.controller;




import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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




@Controller
public class CorrectionController 
{
	@Autowired
	CorrectionService correctionService;
	
	@Autowired
	CorrectionCommentService correctionCommentService;
	
	
	/*	//header에서 눌렀을 경우 실행되면서 리턴값 전송
		@RequestMapping(value ="/correction/correction.correct", method=RequestMethod.POST)
		public ModelAndView gotoCorrection(@RequestParam(value="cPage", required=false, defaultValue="1")
		int cPage,@RequestParam(value = "sort", required=false, defaultValue="dateSort") String sort,  
		@RequestParam(value="search", defaultValue="") String search, ModelAndView mv){
			//@RequestParam으로 페이징 버튼을 눌렀을 때 누른 페이지 값을 가져오며 처음 페이지에 도작했을 경우에는 default값 1을 준다.
			//기본 정렬은 최신순으로 한다.
			System.out.println("검색 눌렀을 경우 들어오는 SORT값="+sort);
			System.out.println("검색 눌렀을 때 들어오는 search값="+search);
			//한 페이지에  10개 보여줄 꺼임
			int numPerPage = 10;
			
			//검색, 정렬 필터에 값 집어넣기
			CorrectionSearchFilter filter = new CorrectionSearchFilter(search, sort);
			
			//글 총 개수 (검색어 포함)
			int totalContents = correctionService.selectCorrectionTotalContents(filter);
			
			
			if(sort.equals("dateSort") || sort.equals("commentSort")  || sort.equals("seeSort")){
			// 글 리스트 불러오기(최신순) 위에서 쓰는거  기본은 최신순이니까

				List<Map<String, String>> list = correctionService.selectCorrectionList(cPage,numPerPage,filter);
				
				mv.setViewName("correction/correction");
				mv.addObject("list", list).addObject("numPerPage",numPerPage).addObject("totalContents", totalContents)
				.addObject("sort",sort).addObject("search", search);
				
				
				
				System.out.println("컨트롤러 리턴 sort값 :"+sort);
				System.out.println("컨트롤러가 리턴하는 totalContents:"+totalContents);
				
			  return mv;
			} else {
			// 헛짓 대비
				String msg = "요청하신 페이지는 없습니다";
				String loc = "correction/correction";
				
				
				mv.setViewName("common/msg");
				mv.addObject("msg", msg).addObject("loc", loc);
				
				return mv;
			}
			
		}*/
		
		//header에서 눌렀을 경우 실행되면서 리턴값 전송
				@RequestMapping(value ="/correction/correction.correct", method=RequestMethod.GET)
				public String gotoCorrection(@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage,@RequestParam(value = "sort", required=false, defaultValue="dateSort") String sort,  
				@RequestParam(value="search", defaultValue="") String search, Model model){
					//@RequestParam으로 페이징 버튼을 눌렀을 때 누른 페이지 값을 가져오며 처음 페이지에 도작했을 경우에는 default값 1을 준다.
					//기본 정렬은 최신순으로 한다.
					System.out.println("검색 눌렀을 경우 들어오는 SORT값="+sort);
					System.out.println("검색 눌렀을 때 들어오는 search값="+search);
					//한 페이지에  10개 보여줄 꺼임
					int numPerPage = 10;
					
					//검색, 정렬 필터에 값 집어넣기
					CorrectionSearchFilter filter = new CorrectionSearchFilter(search, sort);
					
					//글 총 개수 (검색어 포함)
					int totalContents = correctionService.selectCorrectionTotalContents(filter);
					
					
					if(sort.equals("dateSort") || sort.equals("commentSort")  || sort.equals("seeSort")){
					// 글 리스트 불러오기(최신순) 위에서 쓰는거  기본은 최신순이니까

						List<Map<String, String>> list = correctionService.selectCorrectionList(cPage,numPerPage,filter);
						
						model.addAttribute("list", list).addAttribute("numPerPage",numPerPage).addAttribute("totalContents", totalContents)
						.addAttribute("sort",sort).addAttribute("search", search);
						
						System.out.println("컨트롤러 리턴 sort값 :"+sort);
						System.out.println("컨트롤러가 리턴하는 totalContents:"+totalContents);
						
					  return "correction/correction";
					} else {
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
				Correction correction, ModelAndView mv){
			
				correction = new Correction.CorrectionBuilder().setCorrectionContent(content).setCorrectionTitle(title)
						.setCorrectionUserId(id).setCorrectionResumeId(resumeId).build();
				System.out.println(content+title);
			
				
			int result = correctionService.insertCorrection(correction);
			
			
			
			if(result > 0) {
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
		public String handleFileUpload(@RequestParam("file") MultipartFile[] file, HttpServletRequest req)
		{
			System.out.println("이미지가 들어옵니다");
			
			String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/correctionUpload");
			
			System.out.println("이미지 저장 경로 : " + saveDir);
			
			System.out.println(file[0].getOriginalFilename());
			
			return saveFile(file[0], saveDir, req);
			
		}
		
		//썸머노트 이미지파일 변경2
		private String saveFile(MultipartFile file, String saveDir, HttpServletRequest req){
			UUID uuid = UUID.randomUUID();
			String saveName = uuid + "_" +file.getOriginalFilename();
			// File saveFile = ;
			
			try {
				file.transferTo(new File(saveDir + '\\' + saveName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "/correction/correctionWrite.correct";
			}
		
			return getBaseUrl(req) + "/resources/upload/correctionUpload/" + saveName;
			
		}
		
		// 이력서 등록 modal 띄우기
		@RequestMapping(value="/correction/correctionResumeModal.correct", method=RequestMethod.POST)
		@ResponseBody
		public List<Map<String, String>> resumeModal(@RequestParam(value="id") String id, Model model){
			
			System.out.println("현재 이력서 부르는 id값 :" + id);
			List<Map<String, String>> resumeList = correctionService.selectResume(id);
			
			
			
			for(int i = 0 ; i<resumeList.size(); i++){
				System.out.println("안녕하세요.");
			}
			
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
				@RequestParam(value="cId") int cId, Correction correction, Model model){
					
			correction = new Correction.CorrectionBuilder().setCorrectionTitle(title).setCorrectionContent(content)
					.setCorrectionResumeId(resumeId).setCorrectionId(cId).setCorrectionUserId(userId).build();
			
			int result = correctionService.updateCorrection(correction);
			
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
		public String deleteCorrection(@RequestParam(value="cUserId") String cUserId, @RequestParam(value="cId") int cId, Model model){
			
			Correction correction = new Correction.CorrectionBuilder().setCorrectionUserId(cUserId).setCorrectionId(cId).build();
			
			int result = correctionService.deleteCorrection(correction);
			
			System.out.println("삭제 result값 : " + result);
			
			//기본 페이지로 돌아가는 셋팅.
			CorrectionSearchFilter filter = new CorrectionSearchFilter("", "dateSort");
			int totalContents = correctionService.selectCorrectionTotalContents(filter);
			List<Map<String, String>> list = correctionService.selectCorrectionList(1, 10,filter);
			
			model.addAttribute("list", list).addAttribute("numPerPage", 10).addAttribute("totalContents", totalContents)
			.addAttribute("sort", "dateSort").addAttribute("search", "");
			
			if(result>0) return "correction/correction";
			else return "correction/correction";
		}
		
		//댓글  insert 하기 
		@RequestMapping(value="/correction/correctionCommentWrite.correct", method=RequestMethod.GET)
		public String insertCorrectionComment(@RequestParam(value = "reviewUserId") String id, 
				@RequestParam(value = "reviewContent") String content,
				@RequestParam(value = "correctionId") int correctionId, 
				CorrectionComment comment, Model model){
			
				comment = new CorrectionComment.CorrectionCommentBuilder()
						.setCommentContent(content).
						setCorrectionId(correctionId).
						setCommentUserId(id).build();
				
				
				int result = correctionCommentService.insertComment(comment);
				
				if(result > 0) return "redirect:/"+"correction/correctionView.correct?no=" + correctionId;
				else return "common/error"; 
			
			

		}
		
		//댓글 수정 하기 
				@RequestMapping(value="/correction/correctionCommentUpdate.correct", method=RequestMethod.GET)
				public String updateCorrectionComment(@RequestParam("commentId") int commentId, @RequestParam("updateContent") String updateContent, 
						@RequestParam("correctionId") int correctionId,CorrectionComment comment){
					
					comment = new CorrectionComment.CorrectionCommentBuilder()
							.setCommentId(commentId).setCommentContent(updateContent).build();
					
					int result = correctionCommentService.updateComment(comment);
					
					if(result > 0) return "redirect:/"+"correction/correctionView.correct?no=" + correctionId;
					else return "common/error"; 
				}
		
		//댓글 delete하기
		@RequestMapping(value="/correction/correctionCommentDelete.correct", method=RequestMethod.POST)
		public String deleteCorrectionComment(@RequestParam("commentId") int commentId, @RequestParam("correctionId") int correctionId){
			System.out.println("commentId :" + commentId);
			System.out.println("correctionId:" + correctionId);
			int result = correctionCommentService.deleteComment(commentId);
			
			if(result > 0) return "redirect:/"+"correction/correctionView.correct?no=" + correctionId;
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
