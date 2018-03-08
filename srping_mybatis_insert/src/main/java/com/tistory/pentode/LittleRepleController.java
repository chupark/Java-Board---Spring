package com.tistory.pentode;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.util.StringConverter;
import com.tistory.pentode.vo.LittleReView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class LittleRepleController {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	StringConverter SCV = new StringConverter();
	//댓글 및 댓글 폼을 보여줌
	@RequestMapping("/repleShow.do")
	public String loadReple(Model model, @RequestParam("num") int num,
			@ModelAttribute ("littleReView") LittleReView littleReView) throws Exception {
		/*	json 통신시 해제해줌
		JSONObject sendObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		*/
		List<LittleReView> list = boardService.showLittleReple(num);
		
		//String jsonString = jsonArray.fromObject(list).toString();
		
		model.addAttribute("list", list);
		model.addAttribute("num", num);
		
		return "littleReShow";
	}
	//댓글 삽입
	@RequestMapping("/littlRepleInsert.do")
	public String littleReInsert(@ModelAttribute ("littleReView") LittleReView littleReView, Model model) {
		//기본 태그문자, 개행문자 처리
		littleReView.setContent(SCV.convert(littleReView.getContent()));
		
		boardService.littleReInsert(littleReView);
		
		return "redirect:repleShow.do?num="+littleReView.getNum();
	}
	
	//댓글 수정
	@RequestMapping(value="/littleUpdate.do")
	//@ResponseBody json 통신시 해제
	public String littReUpdate(@RequestParam("num") int num,
			@RequestParam("mynum") int mynum, Model model, LittleReView littleReview/*,
			json 통신시 해제
			@RequestBody Map <String, Object> list*/) throws Exception{

		boardService.littleReUpdate(littleReview);
				
		return "redirect:/repleShow.do?num="+Integer.toString(num);
	}	
	
	//댓글 삭제
	@RequestMapping(value="/littleRepleDelete.do")
	//@ResponseBody json 통신시 해제
	public String littleReDelete(@RequestParam("num") int num,
			@RequestParam("mynum") int mynum, Model model, LittleReView littleReview/*,
			json 통신시 해제
			@RequestBody Map <String, Object> list*/) throws Exception{
		
		boardService.littleReDelete(littleReview);

		
		return "redirect:/repleShow.do?num="+Integer.toString(num);
	}	
}
