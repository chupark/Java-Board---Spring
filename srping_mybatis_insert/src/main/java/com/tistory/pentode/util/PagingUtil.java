package com.tistory.pentode.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;


public class PagingUtil {
	//최종 페이지 받아옴
	private int totalPageNum = 0;
	
	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	
								//최종 페이지,		현재 페이지,	  몇개씩 보여줄지,			모델
	public void drawBoard(int totalPage, int curPage, int pageSohwRecod, Model model) {		
		int botP = 10;	//밑바닥 버튼 용도
		//현재 페이지가 맞는지 원뷰 등 파라미터 전달로 쓰임
		model.addAttribute("curPage", curPage);
		
		//총 페이지 갯수 계산
		if(totalPage % pageSohwRecod == 0) {					
			setTotalPageNum(totalPage / pageSohwRecod); 		//몇개씩 보여줄지로 나눠서 떨어지면 그대로 씀
		}else if(totalPage % pageSohwRecod != 0) {
			setTotalPageNum((totalPage / pageSohwRecod) + 1);	//몇개씩 보여줄지로 나눠서 안떨어지면 1 더해서 씀
		}
		
		List <String> test = new ArrayList<String>();	//페이지 넘버를 어레이 리스트에 담아둠 1, 2, 3, 4, .... 이렇게 담김

		//1페이지부터 시작함
		int cnt = 0;
		//그러니까 이건... 바닥에 보여줄 페이지 네비게이션 숫자 를 출력하기 위함임
		int strt = ((curPage / pageSohwRecod)*pageSohwRecod) + 1;	//나누고 곱하고 1더하고.. 이러면 앞은 1, 11, 21... 이렇게 시작함
		if(curPage % pageSohwRecod == 0) {	//이부분은 끝 페이지 네비게이션 용도임 끝이 항상 10으로 끝나기 때문에 이렇게 처리함
			strt = (((curPage / pageSohwRecod) - 1) * pageSohwRecod) + 1;
		}
		
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 뒤로가기 버튼
		//1 ~ 10 네비게이션 페이지에서는 비활성화
		if(strt > 1) { 
			model.addAttribute("backBtn", strt - pageSohwRecod);
		}else {
			model.addAttribute("backBtn", 0);
		}
			
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 바닥 페이지 출력
		int i = 0;
		for(i = strt; i <= getTotalPageNum(); i++) {
			test.add(Integer.toString(i));
			cnt++;
			if(cnt == botP) {
				break;
			}
		}
		
//------------------- 바닥 페이지 출력 --------------------		
		model.addAttribute("botNum", test);
//------------------- 바닥 페이지 출력 --------------------		
		
		
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 앞으로가기 버튼
		//끝 페이지 네비게이션 에서는 비활성화
		if(strt >= 1) {
			model.addAttribute("frontBtn", (strt + pageSohwRecod));
		}
		if(i - 1 ==  getTotalPageNum()) {
			model.addAttribute("frontBtn", 0);
		}	
	}
}
