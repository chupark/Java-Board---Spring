package com.tistory.pentode.util;


public class StringConverter {
	//스트링 컨버터 클래스 나중에 예외처리할 문자들을 더 추가할 예정임 
	public String convert(String inputString) {
		
		String a = inputString;
		
		//태그문자 치환;  SQL Injection 으로 html 구조를 보게할수 있음..
		//<input type="text"> <script>alert()</script> 등 악의적 조작 가능
		//Oracle 성능, Mybatis 성능 인지는 모르겠는데 BackSlash \ 가 기본적으로 막아짐
		//BackSlash 치환은 넣지 않음
		a = a.replaceAll("<", "&lt;");
		a = a.replaceAll(">", "&gt;");
		a = a.replaceAll("\r\n", "<br>");
		
		
		return a;
	}
	//textarea 출력 메세지 컨버트
	public String tAreaConvert(String inputString) {
		
		String a = inputString;
		//textarea 에서는 <br> 그대로 출력함 저장시에도 <br> 저장
		//개행문자가 계속 증식하므로 처리해줘야함
		a = a.replaceAll("<br>", "\r\n");
		
		return a;
	}
	
}
