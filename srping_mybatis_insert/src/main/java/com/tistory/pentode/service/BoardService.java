package com.tistory.pentode.service;

import java.util.List;
import java.util.Map;

import com.tistory.pentode.vo.BoardPage;
import com.tistory.pentode.vo.BoardVO;
import com.tistory.pentode.vo.ChagyebuVO;
import com.tistory.pentode.vo.LittleReView;

public interface BoardService {
	List<BoardVO> selectBoardList() throws Exception;
	List<BoardVO> pagingList(BoardVO boardVO) throws Exception;
	List<BoardVO> selectOneView(BoardVO boardVO) throws Exception;
	List<LittleReView> showLittleReple (int num) throws Exception;
	
	Map<String, Object> selectChagyebuList(ChagyebuVO vo) throws Exception;
	
	void oneViewReadCnt(int viewCnt);
	
	void insertBoard(BoardVO boardVO);
	
	void updateBoard(BoardVO boardVO);
	
	void deleteBoard(int viewPage);
	
	void littleReInsert(LittleReView littleReView);
	
	void littleReDelete(LittleReView littleReview);
	
	BoardPage bottomPage() throws Exception;
}
