package com.tistory.pentode;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.util.StringConverter;
import com.tistory.pentode.vo.BoardVO;

@Controller
public class UpdateController {
	@Resource(name = "boardService")
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(PagingController.class);
	
	//업데이트 폼으로 보내줌
	@RequestMapping(value = "/boardUpdateForm.do")
	public String boardOneView(@RequestParam("page") int page,
			@RequestParam(required=true) int num, 
			@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception{
		StringConverter strCvt = new StringConverter();
		//이전 리스트를 출력해야함
	    List<BoardVO> list = boardService.selectOneView(boardVO);
	    logger.info(list.toString());
	    list.get(0).setContent(strCvt.tAreaConvert(list.get(0).getContent()));
	    //list.get(0).setContent(list.get(0).getContent().replaceAll("<br>", "\r\n"));
	    model.addAttribute("list", list);
	    //취소시 이전 url로 돌려보내기 위해 파라미터를 가지고 있어야함
	    model.addAttribute("page", page);

	    return "boardUpdaterForm";
	}
	//실제 업데이트 수행
	@RequestMapping(value = "/boardUpdate.do")
	public String boardInsert(@RequestParam(required=true) int num, @RequestParam(required=true) int page,
			@ModelAttribute("boardVO") BoardVO boardVO, Model model) {
		StringConverter strCvt = new StringConverter();
		//태그, 개행문자 등을 처리해아함
		boardVO.setContent(strCvt.convert(boardVO.getContent()));
		boardService.updateBoard(boardVO);
		
		return "redirect:/boardOneView.do?num="+Integer.toString(num)+"&page="+Integer.toString(page);
	}

}
