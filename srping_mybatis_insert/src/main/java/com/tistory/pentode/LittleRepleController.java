package com.tistory.pentode;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/repleShow.do")
	public String loadReple(Model model, @RequestParam("num") int num,
			@ModelAttribute ("littleReView") LittleReView littleReView) throws Exception {
		JSONObject sendObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<LittleReView> list = boardService.showLittleReple(num);
		
		String jsonString = jsonArray.fromObject(list).toString();
		
		model.addAttribute("list", list);
		model.addAttribute("num", num);
		
		return "littleReShow";
	}
	
	@RequestMapping("/littlRepleInsert.do")
	public String littleReInsert(@ModelAttribute ("littleReView") LittleReView littleReView, Model model) {
		
		littleReView.setContent(SCV.convert(littleReView.getContent()));
		System.out.println("겟넘"+littleReView.getNum());
		System.out.println("겟넘"+littleReView.getContent());
		System.out.println("겟넘"+littleReView.getName());
		
		
		boardService.littleReInsert(littleReView);
		
		return "redirect:repleShow.do?num="+littleReView.getNum();
	}
	
	@RequestMapping("/littleRepleDelete.do")
	public String littleReDelete(@ModelAttribute ("littleReView") LittleReView littleReView, Model model) {
		
		
		boardService.littleReInsert(littleReView);
		
		return "redirect:repleShow.do?num="+littleReView.getNum();
	}	
}
