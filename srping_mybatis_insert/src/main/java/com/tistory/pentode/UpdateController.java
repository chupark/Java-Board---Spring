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
	
	
	@RequestMapping(value = "/boardUpdateForm.do")
	public String boardOneView(@RequestParam("page") int page,
			@RequestParam(required=true) int num, 
			@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception{
		
	    List<BoardVO> list = boardService.selectOneView(boardVO);
	    logger.info(list.toString());
	    list.get(0).setContent(list.get(0).getContent().replaceAll("<br>", "\r\n"));
	    model.addAttribute("list", list);
	    model.addAttribute("page", page);

	    return "boardUpdaterForm";
	}
	
	@RequestMapping(value = "/boardUpdate.do")
	public String boardInsert(@RequestParam(required=true) int num, @RequestParam(required=true) int page,
			@ModelAttribute("boardVO") BoardVO boardVO, Model model) {
		StringConverter strCvt = new StringConverter();
		
		boardVO.setContent(strCvt.convert(boardVO.getContent()));
		boardService.updateBoard(boardVO);
		
		return "redirect:/boardOneView.do?num="+Integer.toString(num)+"&page="+Integer.toString(page);
	}

}
