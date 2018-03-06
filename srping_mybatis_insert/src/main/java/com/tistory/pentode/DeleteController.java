package com.tistory.pentode;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tistory.pentode.service.BoardService;

@Controller
public class DeleteController {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/boardDelete.do")
	public String boardInsert(@RequestParam("num") int num,@RequestParam("page") int page) {
		boardService.deleteBoard(num);
				
		return "redirect:/pagingTest.do?page="+Integer.toString(page);
	}
}
