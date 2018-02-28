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
	private BoardDAO boardMapper;

	@Override
	@Transactional
	public List<BoardVO> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}
	
	@Override
	@Transactional
	public List<BoardVO> selectOneView(BoardVO boardVO) throws Exception{
		return boardMapper.selectOneView(boardVO);
	}

	@Override
	public void insertBoard(BoardVO boardVO) {
		boardMapper.insertBoard(boardVO);
	}

	@Override
	public BoardPage bottomPage() throws Exception{
		return boardMapper.bottomPage();
	}

	@Override
	public List<BoardVO> pagingList(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.pagingList(boardVO);
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		boardMapper.updateBoard(boardVO);
	}

	@Override
	public void oneViewReadCnt(int viewCnt) {
		boardMapper.oneViewReadCnt(viewCnt);
	}

	@Override
	public void deleteBoard(int viewPage) {
		boardMapper.deleteBoard(viewPage);
		
	}

	@Override
	public void littleReInsert(LittleReView littleReView) {
		// 
		boardMapper.littleReInsert(littleReView);
	}

	@Override
	public List<LittleReView> showLittleReple(int pagenum) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.showLittleReple(pagenum);
	}
	
	
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

	@Override
	public void littleReDelete(LittleReView littleReview) {

		boardMapper.littleReDelete(littleReview);
	}

}
