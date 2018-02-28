package com.tistory.pentode;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.vo.BoardVO;

@Controller
public class InsertController {
	@Resource(name = "boardService")
	private BoardService boardService;
	/**
	 * �Խ��� �����
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardRegisterForm.do")
	public String boardRegisterForm(@RequestParam ("page") int page,
			@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception {
		
		model.addAttribute("page", page);
		
	    return "boardRegisterForm";
	}
	
	/**
	 * ���� ����մϴ�.
	 * @return
	 */
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsert(@ModelAttribute("boardVO") BoardVO boardVO, Model model) {

		boardVO.setContent(contentConverter(boardVO.getContent()));
		boardService.insertBoard(boardVO);
		
		return "redirect:/pagingTest.do";
	}
	
	public String contentConverter(String content) {
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		
		return content;
	}
}
