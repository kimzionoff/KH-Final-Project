package com.myedumyselect.matching.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

@Mapper
public interface MatchingCommentDAO {
	
	//댓글 목록 조회
	public List<MatchingCommentVO> mCommentList(MatchingCommentVO mcVO);
	
	//댓글 입력
	public int mCommentInsert(MatchingCommentVO mcVO);
	
	//댓글 삭제
	public int mCommentDelete(MatchingCommentVO mcVO);
	
	//댓글 수정
	public int mCommentUpdate(MatchingCommentVO mcVO);
}
