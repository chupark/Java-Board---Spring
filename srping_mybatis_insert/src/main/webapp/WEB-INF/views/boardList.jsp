<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
</head>
<body>
	<center>
	<h1>치우의 스프링 게시판</h1>
	<table width=800 border="1">
	<thead>
	<tr>
		<th width=7% align=center>번호</th>
		<th width=15% align=center>작성자</th>
		<th width=50% align=center>제목</th>
		<th width=8% align=center>조회</th>
		<th width=20% align=center>작성일</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list}">
		<tr>
			<td align=center>${item.num}</td>
			<td align=center>${item.name}</td>
			<td><a href="<c:url value='/boardOneView.do?num=${item.num}' />">${item.title}</a></td>
			<td align=center>${item.readCount}</td>
			<td align=center>${item.writeDate}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	<table width=800>
		<tr>
			<td align=right width=800>
			[<a href="<c:url value='/boardRegisterForm.do' />">등록</a>]
			</td>
		</tr>
	</table>
		total record [${list2}]<br>
		테스트 [${abc}]<br>
		페이징 레디 <a href="<c:url value='/pagingTest.do?page=1' />">1</a>　
		<a href="<c:url value='/boardList.do?page=2' />">2</a>
		<a href="<c:url value='/boardList.do?page=3' />">3</a>　
		<a href="<c:url value='/boardList.do?page=4' />">4</a>　　<br>
</center>			
</body>
</html>
