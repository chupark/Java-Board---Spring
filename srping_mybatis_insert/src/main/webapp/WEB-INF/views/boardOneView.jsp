<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Home</title>
<script> 
function resizeIframe(obj) { 
	obj.style.height = (obj.contentWindow.document.body.scrollHeight)+ 'px'; 
} 
</script>

<link href="<c:url value="/resources/css/boardOneView.css"/>" rel="stylesheet">

</head>
<center>
<body>
	<h1>치우의 스프링 게시판 - 원뷰</h1>
	<c:forEach var="item" items="${list}">
		<table width=800 border="0" cellspacing=0 cellpadding=0>
				<tr>
					<td class=header><b>번호</b></td><td class=view valign=middle>${num}</td>
				</tr>		
				<tr>		
					<td class=header><b>제목</b></td><td class=view valign=middle>${item.title}</td>
				</tr>
				<tr>		
					<td valign=top class=header_inside><b>내용</b></td>
					<td valign=top class=inside>
					<div class="writtenMessage">${item.content}</div>
					</td>
				</tr>				
				<tr>		
					<td class=header><b>작성일</b></td><td class=view>${item.writeDate}</td>
				</tr>				
				<tr>
					<td class=header><b>작성자</b></td><td class=view>${item.name}</td>
				</tr>				
				<tr>		
					<td class=header_bot><b>조회</b></td><td style='padding-left:10px' class=view_bot>${item.readCount}</td>
				</tr>								
		</table>
		<table width=800>
			<tr>
				<td width=50%>
					[<a href="<c:url value='/pagingTest.do?page=${page}' />">목록</a>]
				</td>
				<td width=40% align=right>
					[<a href="<c:url value='/boardDelete.do?num=${num}&page=${page}' />">삭제</a>]
				</td>
				<td width=10% align=right>
					[<a href="<c:url value='/boardUpdateForm.do?num=${num}&page=${page}' />">수정</a>]
				</td>			
			</tr>
		</table>
		<br/>
	<br/>
		<iframe name="contentFrame" width=800 id="contentFrame" src="<c:url value='/repleShow.do?num=${item.num}'/>"
			frameborder=0 marginwidth=0 marginheight=0 scrolling=no onload="resizeIframe(this);">
		</iframe>
	</c:forEach>
	
</center>	
</body>
</html>
