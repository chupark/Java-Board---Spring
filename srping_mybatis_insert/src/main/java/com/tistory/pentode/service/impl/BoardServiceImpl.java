package com.tistory.pentode.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.service.dao.BoardDAO;
import com.tistory.pentode.vo.BoardPage;
import com.tistory.pentode.vo.BoardVO;
import com.tistory.pentode.vo.ChagyebuVO;
import com.tistory.pentode.vo.LittleReView;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	private static final Logger LOGGER = Logger.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardDAO boardMapper;	// DAO  Data Access Object

//<!------------------------------게시글 기능----------------------------------
	@Override
	@Transactional
	public List<BoardVO> selectBoardList() throws Exception {
		//게시물 리스트 보여줌
		return boardMapper.selectBoardList();
	}
	
	@Override
	@Transactional
	public List<BoardVO> selectOneView(BoardVO boardVO) throws Exception{
		// 게시물 원뷰		
		return boardMapper.selectOneView(boardVO);
	}

	@Override
	public void insertBoard(BoardVO boardVO) {
		// 게시글 삽입
		boardMapper.insertBoard(boardVO);
	}

	
	@Override
	public void updateBoard(BoardVO boardVO) {
		// 게시글 수정
		boardMapper.updateBoard(boardVO);
	}
	
	
	@Override
	public void deleteBoard(int viewPage) {
		// 게시글 삭제
		boardMapper.deleteBoard(viewPage);
		
	}

	@Override
	public void oneViewReadCnt(int viewCnt) {
		// 게시글 조회수
		boardMapper.oneViewReadCnt(viewCnt);
	}
	
	
	@Override
	public BoardPage bottomPage() throws Exception{
		// 게시글 페이징용
		return boardMapper.bottomPage();
	}

	@Override
	public List<BoardVO> pagingList(BoardVO boardVO) throws Exception {
		// 게시글 페이징용2
		return boardMapper.pagingList(boardVO);
	}
//  ------------------------------게시글 기능------------------------------------->

//<!------------------------------댓글------------------------------------------
	@Override
	public List<LittleReView> showLittleReple(int pagenum) throws Exception {
		// 댓글 목록
		return boardMapper.showLittleReple(pagenum);
	}

	@Override
	public void littleReInsert(LittleReView littleReView) {
		// 댓글 삽입
		boardMapper.littleReInsert(littleReView);
	}
	

	@Override
	public void littleReDelete(LittleReView littleReview) {
		// 댓글 삭제
		boardMapper.littleReDelete(littleReview);
	}

	@Override
	public void littleReUpdate(LittleReView littleReView) {
		// 댓글 수정
		boardMapper.littleReUpdate(littleReView);
	}
//  ------------------------------------------------------------------------->	
	
	
	@Override
	@Transactional
	public Map<String, Object> selectChagyebuList(ChagyebuVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		final int dataPerPage = 10;
		int page = vo.getPage();
		
		int first = page * dataPerPage + 1;
		int last = first + dataPerPage - 1;
		
		vo.setFirst(first);
		vo.setLast(last);
		
		LOGGER.info(vo.toString());
		
		Integer total = boardMapper.selectChagyebuTotal(vo);
		Integer totalPages = (int)Math.ceil(total / dataPerPage);
		
		map.put("total", total);
		map.put("totalPages", totalPages);
		map.put("list", boardMapper.selectChagyebuList(vo));
		
		return map;
	}

}
