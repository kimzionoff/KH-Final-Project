package com.myedumyselect.commonboard.advertise.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class AdvertiseTest {
	
	@Autowired
	private AdvertiseDAO aDAO;
	
//	@Test
//	public void testAdvertiseListCnt() {
//		log.info("advertiseListCnt() 메소드 호출");
//		
//		AdvertiseVO aVO = new AdvertiseVO();
//		aVO.setKeyword("홍보");
//		
//		List<AdvertiseVO> list = aDAO.advertiseList(aVO);
//		for(AdvertiseVO vo : list) {
//			log.info(vo.toString());
//		}
//		log.info("총 레코드수 : " + aDAO.advertiseList(aVO));
//		
//	}
//	
//	@Test
//	public void testAdvertiseList() {
//		log.info("advertiseList() 메소드 실행");
//		
//		AdvertiseVO aVO = new AdvertiseVO();
////		aVO.setPageNum(1);
////		aVO.setAmount(12);
//		
//		aVO.setSearch("홍보");
//		
//		List<AdvertiseVO> list = aDAO.advertiseList(aVO);
//		
//		for (AdvertiseVO a : list) {
//			log.info(a.toString());
//		}
//		log.info("총 레코드 수  : " + aDAO.advertiseListCnt(aVO));
//	}
	
	
//	@Test
//	public void test() {
//		log.info("리스트 조회");
//		
//		AdvertiseVO bvo = new AdvertiseVO();
//		bvo.setPageNum(1);
//		bvo.setAmount(12);
//		bvo.setKeyword("홍보");
//		
//		List<AdvertiseVO> list = aDAO.advertiseList(bvo);
//		for(AdvertiseVO vo : list) {
//			log.info(vo.toString());
//		}
//		log.info("총 레코드 수 : " + aDAO.advertiseList(bvo));
//	}
	
//	
//	@Test
//	public void detailTest() {
//		log.info("상세페이지 조회");
//		
//		AdvertiseVO aVO = new AdvertiseVO();
//		aVO.setCommonNo(20031);
//		
//		AdvertiseVO vo = aDAO.advertiseDetail(aVO);
//		
//		log.info(vo.toString());
//	}
	
//	@Test
//	public void readcnt() {
//		log.info("조회수");
//		AdvertiseVO aVO = new AdvertiseVO();
//		aVO.setCommonNo(20031);
//		
//		int result = aDAO.readCntUpdate(aVO);
//		
//		log.info("조회수 : " + result);
//	}
//	
	
	
	@Test
	public void test() {
		AcademyLoginVO avo = new AcademyLoginVO();
		avo.setAcademyId("artis0012");
		
		AdvertiseVO aVO = new AdvertiseVO();
		aVO.setAcademyId("artis0012");
		aVO.setCommonTitle("안녕");
		aVO.setCommonContent("ㅜㅜ");
		
		aDAO.advertiseInsert(aVO);
		
		log.info(aVO.toString());
	}

}
