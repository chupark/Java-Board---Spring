package com.tistory.pentode.service;

import java.util.List;
import java.util.Map;

import com.tistory.pentode.vo.BoardPage;
import com.tistory.pentode.vo.BoardVO;
import com.tistory.pentode.vo.ChagyebuVO;
import com.tistory.pentode.vo.LittleReView;

public interface BoardService {
//<!--------------------- 게시글 관련----------------------------------
	//전체 게시글 조회
	List<BoardVO> selectBoardList() throws Exception;
	//게시글 상세
	List<BoardVO> selectOneView(BoardVO boardVO) throws Exception;
	//게시글 조회수
	void oneViewReadCnt(int viewCnt);
	//게시글 작성
	void insertBoard(BoardVO boardVO);
	//게시글 수정
	void updateBoard(BoardVO boardVO);
	//게시글 삭제
	void deleteBoard(int viewPage);
	//게시글 페이징
	List<BoardVO> pagingList(BoardVO boardVO) throws Exception;
	//게시글 페이징
	BoardPage bottomPage() throws Exception;
//------------------------- 게시글 관련--------------------------------->
	
	
	
//<!--------------------- 댓글 관련------------------------------------
	List<LittleReView> showLittleReple (int num) throws Exception;
	
	void littleReUpdate(LittleReView littleReView);
	
	void littleReInsert(LittleReView littleReView);
	
	void littleReDelete(LittleReView littleReview);
//--------------------- 댓글 관련------------------------------------->	
	
	//ajax 테스트용도
	Map<String, Object> selectChagyebuList(ChagyebuVO vo) throws Exception;
}
