package com.myedumyselect.commonboard.advertise.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.common.util.SessionCheckService;
import com.myedumyselect.common.vo.PageDTO;
import com.myedumyselect.commonboard.advertise.service.AdvertiseService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;

@Controller
@RequestMapping("/advertise/*")
public class AdvertiseController {

	@Setter(onMethod_ = @Autowired)
	private AdvertiseService aService;

	@Autowired
	private SessionCheckService sessionCheckService;

	// 홍보게시판 목록 전체보기 구현
	@GetMapping("/advertiseBoardList")
	public String advertiseBoardList(@ModelAttribute AdvertiseVO aVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		// 전체 레코드 조회
		List<AdvertiseVO> advertiseList = aService.advertiseList(aVO);
		model.addAttribute("advertiseList", advertiseList);

		// 전체 레코드 수 반환
		int total = aService.advertiseListCnt(aVO);

		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(aVO, total));
		model.addAttribute("kwd", aVO.getKeyword());

		return "board/advertise/advertiseBoardList";
	}
	

	// 홍보게시판 글쓰기 입력 폼 출력
	@GetMapping("/advertiseWriteForm")
	public String writeForm(@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO, 
			Model model, HttpSession session) {
		
		//세션 검사
		if (academyLoginVO != null) {	
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else {
			return "redirect:/loginselect";
		}

		return "board/advertise/advertiseInsertForm";
	}
	

	// 홍보게시판 글 등록
	@PostMapping("/advertiseInsert")
	public String advertiseInsertWithFiles(@ModelAttribute AdvertiseVO aVO, 
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO, Model model,
			@RequestParam("files") MultipartFile[] files, RedirectAttributes ras) throws Exception {
		
		//세션 검사
		if (academyLoginVO != null) {	
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else {
			return "redirect:/loginselect";
		}

		int result = 0;
		String url = "";
		
		List<MultipartFile> fileList = Arrays.asList(files);

		result = aService.advertiseInsertWithFiles(aVO, fileList);

		if (result == 1) {
			ras.addFlashAttribute("popUp", "등록 완료되었습니다.");
			url = "redirect:/advertise/advertiseBoardList";
		} else {
			ras.addFlashAttribute("popUp", "등록 실패하였습니다. 다시 시도해 주세요.");
			url = "/advertise/advertiseInsertForm";
		}

		return url;
	}

	
	// 홍보게시판 게시글 상세 보기
	@GetMapping("/advertiseDetail")
	public String advertiseDetail(AdvertiseVO aVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}
		
		AdvertiseVO detail = aService.advertiseDetail(aVO);
		model.addAttribute("detail", detail);

		return "board/advertise/advertiseBoardDetail";
	}

	// 홍보 게시판 글 삭제
	@PostMapping("/advertiseDelete")
	public String advertiseDelete(@RequestParam("commonNo") int commonNo, RedirectAttributes ras,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO, Model model)
			throws Exception {
		
		//세션 검사
		if (academyLoginVO != null) {	
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else {
			return "redirect:/loginselect";
		}
		
		// 게시글 상세정보 가져오기
		AdvertiseVO avo = new AdvertiseVO();
		avo.setCommonNo(commonNo);
		AdvertiseVO detail = aService.advertiseDetail(avo);

		// 게시글 작성자 id 추출
		String writer = detail.getAcademyId();

		int result = 0;
		String url = "";
		
		//작성자와 접속자가 동일할 때 구분
		if(writer.equals(academyLoginVO.getAcademyId())) {
			result = aService.advertiseDelete(avo);
		} else {
			result = 2;
		}


		//결과에 따른 팝업
		if (result == 1) {
			ras.addFlashAttribute("popUp", "삭제 완료되었습니다.");
			url = "/advertise/advertiseBoardList";
		} else if(result==2) {
			ras.addFlashAttribute("popUp", "삭제 권한이 없습니다.");
			url = "/advertise/advertiseDetail?commonNo=" + commonNo;
		} else {
			ras.addFlashAttribute("popUp", "삭제에 실패하였습니다. 다시 시도해 주세요.");
			url = "/advertise/advertiseDetail?commonNo=" + commonNo;
		}

		return "redirect:" + url;
	}

	
	// 홍보게시판 글 수정 폼 출력
	@GetMapping("/advertiseUpdate")
	public String advertiseUpdateForm(@ModelAttribute AdvertiseVO avo,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO, Model model)
			throws Exception {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else {
			return "redirect:/loginselect";
		}
		AdvertiseVO updateData = aService.advertiseUpdateForm(avo);

		model.addAttribute("updateData", updateData);
		return "board/advertise/advertiseUpdateForm";
	}
	

	// 홍보게시판 글 수정
	@PostMapping("/advertiseUpdate")
	public String advertiseUpdateWithFiles(@RequestParam("commonNo") int commonNo, AdvertiseVO aVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO, Model model,
			@RequestParam("files") MultipartFile[] files, RedirectAttributes ras) throws Exception {

		//세션 검사
		if (academyLoginVO != null) {	
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else {
			return "redirect:/loginselect";
		}
		
		//게시글 상세 정보를 거쳐 작성자 추출
		aVO.setCommonNo(commonNo);
		AdvertiseVO detail = aService.advertiseDetail(aVO);
		
		String writer = detail.getAcademyId();

		int result = 0;
		String url = "";
		
		List<MultipartFile> fileList = Arrays.asList(files);
		
		//작성자와 접속자가 동일할 때 구분
		if(writer.equals(academyLoginVO.getAcademyId())) {
			result = aService.advertiseUpdateWithFiles(aVO, fileList);
		} else {
			result = 2;
		}
		
		if (result == 1) {
			ras.addFlashAttribute("popUp", "수정 완료되었습니다.");
			url = "/advertise/advertiseDetail?commonNo=" + commonNo;
		} else if(result == 2) {
			ras.addFlashAttribute("popUp", "수정 권한이 없습니다.");
			url = "/advertise/advertiseUpdate?commonNo=" + commonNo;
		} else {
			ras.addFlashAttribute("popUp", "수정에 실패하였습니다. 다시 시도해 주세요.");
			url = "/advertise/advertiseUpdate?commonNo=" + commonNo;
		}

		return "redirect:" + url;
	}

	
	// 이전 게시글 이동
	@GetMapping("/prev/{commonNo}")
	public String prevPost(AdvertiseVO avo, @PathVariable int commonNo,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO, Model model)
			throws Exception {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/loginselect";
		}

		// 이전 게시글의 번호
		int prevNo = aService.prevCommonNo(avo);

		// 주소 담을 변수
		String url = "";

		if (prevNo < 20001 || prevNo == -1) {
			url = "redirect:/advertise/advertiseDetail?commonNo=" + commonNo;
		} else {
			url = "redirect:/advertise/advertiseDetail?commonNo=" + prevNo;
		}

		return url;
	}

	
	// 다음 게시글 이동
	@GetMapping("/next/{commonNo}")
	public String nextPost(AdvertiseVO avo, @PathVariable int commonNo,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO, Model model)
			throws Exception {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/loginselect";
		}
		
		// 다음 게시글의 번호
		int nextNo = aService.nextCommonNo(avo);

		// 주소 담을 변수
		String url = "";

		if (nextNo > 30000 || nextNo == -1) {
			url = "redirect:/advertise/advertiseDetail?commonNo=" + commonNo;
		} else {
			url = "redirect:/advertise/advertiseDetail?commonNo=" + nextNo;
		}

		return url;
	}

}
