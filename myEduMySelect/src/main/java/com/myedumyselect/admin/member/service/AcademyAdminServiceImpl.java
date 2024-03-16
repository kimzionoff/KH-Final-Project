package com.myedumyselect.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.member.dao.AcademyAdminDAO;
import com.myedumyselect.admin.member.vo.AcademyAdminVO;
import com.myedumyselect.admin.member.vo.PersonalAdminVO;

import lombok.Setter;

@Service
public class AcademyAdminServiceImpl implements AcademyAdminService{
	@Setter(onMethod_ = @Autowired)
	private AcademyAdminDAO academyAdminDAO;

	@Override
	public List<AcademyAdminVO> memberList(AcademyAdminVO academyAdminVO) {
		List<AcademyAdminVO> list = null;
		list = academyAdminDAO.memberList(academyAdminVO);
		return list;
	}

}
