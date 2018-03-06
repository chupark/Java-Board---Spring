package com.tistory.pentode;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.util.PagingUtil;
import com.tistory.pentode.vo.BoardPage;
import com.tistory.pentode.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PagingController {
		
	@Resource(name = "boardService")
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(PagingController.class);
	
	
	//페이징된 리스트를 보여주는 컨트롤러
	@RequestMapping(value = "/pagingTest.do")
	public String pagingTest(@RequestParam(value="page", required=false, defaultValue="0") int page, Model model,
			 @ModelAttribute ("boardVO") BoardVO boardVO) throws Exception {

	    BoardPage boardPage = boardService.bottomPage();	    //총 몇페이지인지 불러오기 위함
	    PagingUtil pagingUtil = new PagingUtil();	    		//페이징처리 유틸리티 불러옴
//<!------------------------------------- 한 페이지에 몇개 레코드 보여줄지 ----------------------------------------------------
		int pageRecod = 15;										//한페이지에 게시글 몇개씩 보여줄지 셋팅
//---------------------------------------------------------------------------------------------------------------->		
		boardPage.setPageShowRecod(pageRecod);					//페이지 셋팅
	    int pageShowRecod = boardPage.getPageShowRecod();						//한 페이지에  몇개 레코드로 설정되있는지 가져온다
	    int totalRecod = boardPage.getTotalRecod();								//설정된 총 레코드 갯수를 가져온다
	    int totalPage = boardPage.getTotalPage(totalRecod, pageShowRecod);	    //최종 페이지를 구한다
	    
	    boardVO.setPageShowRecod(pageShowRecod);								//실제 데이터 클래스 페이지 셋팅
	    
	    
		if(page <= 0) {	//기본값이 0이기 때문에 항상 page=1 을 리다이렉트 한다
			return "redirect:/pagingTest.do?page=1";
		}	  
	   
	    if(page > totalPage) {		    //현재 페이지가 최종페이지 이상이면 최종 페이지를 리다이렉트한다
	    	return "redirect:/pagingTest.do?page="+Integer.toString(totalPage);
	    }
	    
	    pagingUtil.drawBoard(totalRecod, page, pageShowRecod, model);	    //레코드 갯수, 페이지 파라미터, 모델을 페이징 유틸리티로 보냄
	    
	    List<BoardVO> list = boardService.pagingList(boardVO);
	    logger.info(list.toString());
	    model.addAttribute("list", list);
	    model.addAttribute("page", page);
	    
	    return "pagingTest";
	}	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	/**
	 *  �Խ��� ���
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardList.do")
	public String boardList(@RequestParam(defaultValue="1") int page, Model model) throws Exception {

	    List<BoardVO> list = boardService.selectBoardList();
	    
	    BoardPage boardPage = boardService.bottomPage();
	    int pageShowRecod = boardPage.getPageShowRecod();
	    PagingUtil pagingUtil = new PagingUtil();
	    
	    int list2 = boardPage.getTotalRecod();
	    
	    pagingUtil.drawBoard(list2, page, pageShowRecod, model);
	    logger.info(list.toString());
	    
	    model.addAttribute("list", list);
	    model.addAttribute("list2", list2);
	    
	    return "boardList";
	}
}
