package com.tistory.pentode;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.util.StringConverter;
import com.tistory.pentode.vo.BoardVO;

@Controller
public class InsertController {
	@Resource(name = "boardService")
	private BoardService boardService;

	//게시글 입력폼으로 보내줌
	@RequestMapping(value = "/boardRegisterForm.do")
	public String boardRegisterForm(@RequestParam ("page") int page,
			@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception {
		
		model.addAttribute("page", page);
		
	    return "boardRegisterForm";
	}
	
	//게시글 실제 삽입 수행
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsert(@ModelAttribute("boardVO") BoardVO boardVO, Model model) {
		StringConverter scv = new StringConverter();
		boardVO.setContent(scv.convert(boardVO.getContent()));
		boardService.insertBoard(boardVO);
		
		return "redirect:/pagingTest.do";
	}

}
