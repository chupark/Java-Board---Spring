package com.tistory.pentode.service.dao;

import java.util.List;

import com.tistory.pentode.vo.BoardPage;
import com.tistory.pentode.vo.BoardVO;
import com.tistory.pentode.vo.ChagyebuVO;
import com.tistory.pentode.vo.LittleReView;

public interface BoardDAO {
	List<BoardVO> selectBoardList() throws Exception;
	List<BoardVO> pagingList(BoardVO boardVO) throws Exception;
	
	List<LittleReView> showLittleReple (int pagenum) throws Exception;
	
	//<!--------------- 게시글 클릭시 조회수도 증가
	List<BoardVO> selectOneView(BoardVO boardVO) throws Exception;
	void oneViewReadCnt(int viewCnt);
	//----------------------------------->
	
	void insertBoard(BoardVO boardVO);
	
	BoardPage bottomPage() throws Exception;
	
	void updateBoard(BoardVO boardVO);
	
	void deleteBoard(int viewPage);
	
	void littleReUpdate(LittleReView littleReView);
	
	void littleReInsert(LittleReView littleReView);
	
	void littleReDelete(LittleReView littleReview);
	
	List<ChagyebuVO> selectChagyebuList(ChagyebuVO vo) throws Exception;
	Integer selectChagyebuTotal(ChagyebuVO vo) throws Exception;
}
