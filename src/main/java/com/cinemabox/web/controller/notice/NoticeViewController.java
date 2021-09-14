package com.cinemabox.web.controller.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cinemabox.dto.Notice.NoticeDetailDto;
import com.cinemabox.dto.Notice.NoticeDto;
import com.cinemabox.dto.Notice.NoticeListDto;
import com.cinemabox.service.theater.Notice.NoticeService;
import com.cinemabox.vo.Notice;



@Controller
@RequestMapping("/notice")
public class NoticeViewController {
	
	// NoticeService를 컨트롤러에 매핑 ( 컨트롤러 어디서든 사용할수 있게 )
	@Autowired
	NoticeService noticeService;

	/**
	 * 공지사항리스트를 조회하여 공지사항 페이지를 호출
	 * @param model 뷰페이지에 전달할 데이터를 담는 객체, HadlerAdapter객체가 Model를 생성해서 전달함
	 * @return 뷰페이지의 이름 (공지사항 페이지)
	 */
	@GetMapping("/list")
	public String Notice(NoticeListDto searchData, Model model) {
		int page = searchData.getPage();
		searchData.setStartPage(((page-1)*5)+1);
		searchData.setEndPage(5*page);
		System.out.println("searchData ==> "+searchData.toString());
		// 공지사항 리스트 조회하기
		List<Notice> noticeList = noticeService.getNoticeAll(searchData);
		int pageAllCnt = noticeService.getPageAllCnt(searchData);
		System.out.println("controller pageAllCnt ====>" + pageAllCnt);
		// 뷰 페이지에 공지사항 목록 전달하기
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageAllCnt", pageAllCnt);
		model.addAttribute("searchWord", searchData.getSearchWord());
		// 뷰페이지로 내부이동하기
		// /WEB-INF/views/notice/noticeMain.jsp로 내부이동해서 JSP 실행시키기
		return "notice/noticeMain";
	}
	
	/**
	 * 공지 사항 세부페이지 호출  
	 * @param no
	 * @param model
	 * @return
	 */
	@GetMapping("/detail")
	public String details(int no, Model model) {
		NoticeDetailDto noticeDetail = noticeService.detailNoticeByNo(no);
		model.addAttribute("noticeDetail", noticeDetail);
		// 조회수 증가 
		noticeService.increaseHit(no);
		model.addAttribute("no", no);
		return "notice/detailNotice";
	}

	/**
	 * 공지 글 삭제 후 메인페이지 호출 
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/delete")
	public String delete(@RequestParam int no,  RedirectAttributes redirectAttributes) {
		noticeService.deleteNotice(no);
		redirectAttributes.addAttribute("no", no);	
		return "redirect:list";
	}
	
	

	/**
	 * 공지 사항 글 추가 후 페이지 이동
	 * @param no
	 * @param model
	 * @return
	 */
	@RequestMapping("/insert")
	public String insertNotice(NoticeDto notice, RedirectAttributes redirectAttributes) {
		System.out.println("notice ==>"+notice.toString());
		notice.setImportant("true".equals(notice.getImportant())?"1":"0");
		noticeService.addNotice(notice);

		return "redirect:list";
	}
	/**
	 * 공지 글 추가 페이지
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/add")
	public String addNotice() {
		
		return "notice/insertNotice";
	}
	
	/**
	 * 공지 글 수정 폼페이지
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/modify")
	public String modifyNotice(int no, Model model) throws Exception{
		NoticeDetailDto noticeDetail = noticeService.detailNoticeByNo(no);
		model.addAttribute("noticeDetail", noticeDetail);
		
		return "notice/modifyNotice";
	}
	
	/**
	 * 공지 사항 수정 후 페이지 이동 
	 * @param no
	 * @param model
	 * @return
	 */
	@RequestMapping("/newModify")
	public String newNotice(NoticeDetailDto notice,  RedirectAttributes redirectAttributes) {
		noticeService.changeNotice(notice);
		redirectAttributes.addAttribute("no", notice.getNo());
		return "redirect:list";
	}
	
	
}
