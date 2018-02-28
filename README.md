# java-practice
My first Spring Board project

It was very hard.

schema : copy from Tstory blog => developer who wants to rest.
http://pentode.tistory.com/

else. do it my self<br>
comment : using iframe

첫번째 스프링 게시판 프로젝트

코드 구조는 티스토리 쉬고싶은개발자 블로그 참조<br>

나머지는 직접 개발

<html>
  <head>
  </head>
  <body>
    <table>
      <tr>
        <td>Developer</td><td>e-mail</td><td>start_date</td>
      </tr>
      <tr>
        <td>Chi Woo Park</td><td>qkrcldn12@gmail.com</td><td>2018-02-22(Thur)</td>
      </tr>      
    </table>
</body>
</html>
<br><br>
## Development environment
<html>
<body>
<table border=2 width=100%>
	<tr><td width=20%>OS</td><td>Windows 10</td></tr>
	<tr><td>JDK </td><td>1.6</td></tr>
	<tr><td>DBMS </td><td>Oracle 12c R2</td></tr>
	<tr><td>Browser </td><td>Chrome, IE</td></tr>
</table>
</body>
</html>
<br><br>

## MVC &nbsp;&nbsp;Flow


![enter image description here](https://raw.githubusercontent.com/chupark/java-practice/master/flow2.PNG)


1. 클라이언트에서 서버로 요청, 컨트롤러 작동
2.  컨트롤러는 각각 연결된 서비스 혹은 보조기능 수행
3. 서비스는 주로 SQL 관련 기능 수행, 보조기능은 페이징, 문자치환 등을 담당
4. 서비스는 SERVICE 폴더에 등록
5. 보조기능은 UTIL 폴더에 등록
6. 서비스, UTIL 결과는 Controller 로 return
7.  JSP 페이지에서는 Controller 의 return 결과를 보여줌
8. 다음은 페이징 컨트롤러, 페이징 유틸 예시


![enter image description here](https://raw.githubusercontent.com/chupark/java-practice/master/flow.PNG)



<br>

9. 그 외에 StringConverter 유틸도 존재하며 다른 유틸도 추가 예정
<br><br>
## Controller Role

1. DeleteController : 게시글 삭제
	- 게시글 삭제 작업
2. InsertController : 게시글 입력
	- 게시글 입력 폼
	- 게시글 입력 작업
3. LittleRepleController : 댓글 입력
	- 댓글 입력은 게시글 OneView 에서 ifram 영역에 
	- 댓글 입력 폼
	- 댓글 입력 작업
4. OneViewController : 게시글 상세
	- 댓글 뷰
	- 게시글 삭제, 수정 작업
	- 목록으로 돌아가기
5. UpdateController : 게시글 수정
	- 게시글 수정 폼
	- 게시글 수정 작업
