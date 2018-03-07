<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" charset="UTF-8"/>
<style>
a:hover{
	color: red;
	text-decoration: underline;
}
a{
	color: blue;
	text-decoration: none;
}
</style>
<!--
jstl을 싫어하는 사람을 위해 
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" >

//자바 스크립트 불러올시 예시
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
</head>
<body>
<h1>1. Test CSS</h1>

<h2>2. Test JS</h2>
<div id="msg"></div>

</body>
</html>
-->
<link href="<c:url value="/resources/css/pagingTest.css"/>" rel="stylesheet">

<head>
  <link rel="stylesheet" href=<c:url value="/resources/OnsenUI-dist-2.9.2/css/onsenui.css"/>>
  <link rel="stylesheet" href=<c:url value="/resources/OnsenUI-dist-2.9.2/css/onsen-css-components.min.css"/>>
  <script src=<c:url value="/resources/style/jquery-1.11.1.min.js"/>></script>
  <script src=<c:url value="/resources/OnsenUI-dist-2.9.2/js/onsenui.min.js"/>></script>

<title>Home</title>
</head>
<body>
	<center>
		<h1>치우의 스프링 게시판 dd</h1>
		<table width=800 border="0" cellspacing=0 cellpadding=0>
		<thead width=100%>
		<tr>
			<th class=headerGray width=7% height=30 align=center>번호</th>
			<th class=headerGray width=15% align=center>이름</th>
			<th class=headerGray width=50% align=center>제목</th>
			<th class=headerGray width=8% align=center>조회</th>
			<th class=headerGray width=20% align=center>작성일</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
			<tr>
				<td class="topGray" align=center>${item.num}</td>
				<td class="topGray" align=center>${item.name}</td>
				<td class="topGray"><a href="<c:url value='/boardOneView.do?num=${item.num}&page=${page}' />">${item.title}</a>
				 [${item.reple}]</td>
				<td class="topGray" align=center>${item.readCount}</td>
				<td class="topGray" align=center>${item.writeDate}</td>
			</tr>
			</c:forEach>
			<tr>
				<td class="botGray"></td><td class="botGray"></td><td class="botGray"></td>
				<td class="botGray"></td><td class="botGray"></td>
			</tr>
		</tbody>
		</table>
		<table width=800>
			<tr>
				<td align=right width=800>
				[<a class="bottomNumber" href="<c:url value='/boardRegisterForm.do?page=${page}' />">글쓰기</a>]
				</td>
			</tr>
		</table>
			<c:if test="${backBtn != 0}" >
				<a class="movePage" href="<c:url value='/pagingTest.do?page=${backBtn}'/>">Back</a>
			</c:if>
			
			<c:forEach var="botNum" items="${botNum}">
				<c:if test="${botNum == page}">
					<font style="color:red"><b>${botNum}</b></font>
				</c:if>
				<c:if test="${botNum != page}">
					<a class="bottomNumber" href="<c:url value='/pagingTest.do?page=${botNum}'/>">${botNum}</a>
				</c:if>			
			</c:forEach>
			
			<c:if test="${frontBtn != 0}" >
				<a class="movePage" href="<c:url value='/pagingTest.do?page=${frontBtn}'/>">Next</a>
			</c:if>
	</center>				
</body>
</html>
