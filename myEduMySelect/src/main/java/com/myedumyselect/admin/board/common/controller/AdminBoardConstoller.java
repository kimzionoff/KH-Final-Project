package com.myedumyselect.admin.board.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.admin.board.matching.service.MatchingBoardAdminService;
import com.myedumyselect.admin.login.vo.AdminLoginVO;
import com.myedumyselect.client.main.vo.PageDTO;
import com.myedumyselect.commonboard.notice.service.NoticeBoardService;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/adminBoard/*")
public class AdminBoardConstoller {

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardService noticeBoardServcie;
	
	@Setter(onMethod_ = @Autowired)
	private MatchingBoardAdminService MatchingBoardAdminService;

	@GetMapping("/notice")
	public String adminNoticeBoardView(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		// 전체 레코드 조회
		List<NoticeBoardVO> boardList = noticeBoardServcie.boardList(noticeBoardVO);
		model.addAttribute("boardList", boardList);

		// 전체 레코드수 반환.
		int total = noticeBoardServcie.boardListCnt(noticeBoardVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(noticeBoardVO, total));

		return "admin/board/adminNoticeBoardView";
	}

	@GetMapping(value = "/writeForm")
	public String writeForm(HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		return "admin/board/adminNoticeBoardWriteForm";
	}

	@PostMapping("/noticeInsert")
	public String boardInsert(NoticeBoardVO noticeBoardVO) throws Exception {
		noticeBoardServcie.boardInsert(noticeBoardVO);

		return "redirect:/adminBoard/notice";
	}

	@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		NoticeBoardVO detail = noticeBoardServcie.boardDetail(noticeBoardVO);
		model.addAttribute("detail", detail);
		return "admin/board/adminNoticeBoardDetail";
	}

	@PostMapping("/boardDelete")
	public String boardDelete(@ModelAttribute NoticeBoardVO noticeBoardVO) throws Exception {
		noticeBoardServcie.boardDelete(noticeBoardVO);
		return "redirect:/adminBoard/notice";
	}

	@GetMapping("/updateForm")
	public String updateForm(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, HttpSession session) throws Exception {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		NoticeBoardVO updateData = noticeBoardServcie.updateForm(noticeBoardVO);

		model.addAttribute("updateData", updateData);
		return "admin/board/adminNoticeBoardUpdateForm";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdate(@ModelAttribute NoticeBoardVO noticeBoardVO) throws Exception {
		int result = 0;
		String url = "";
		
		result = noticeBoardServcie.boardUpdate(noticeBoardVO);
		if(result == 1) {
			url = "/adminBoard/boardDetail?commonNo=" + noticeBoardVO.getCommonNo();
		} else {
			url = "/adminBoard/updateForm?commonNo=" +  noticeBoardVO.getCommonNo();
		}
		return "redirect:" + url;
	}
	
	/*************************************************************
	 * Admin Mathcing
	 *************************************************************/
	@GetMapping("/matching")
	public String MatchingBoardAdminView(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		MatchingBoardVO matchingBoardVO = new MatchingBoardVO();
		List<MatchingBoardVO> matchingBoardList = MatchingBoardAdminService.boardList(matchingBoardVO);
		model.addAttribute("matchingBoardList", matchingBoardList);

		// 전체 레코드수 반환.
		int total = noticeBoardServcie.boardListCnt(noticeBoardVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(noticeBoardVO, total));

		return "admin/board/matchingBoardAdminView";
	}

}
