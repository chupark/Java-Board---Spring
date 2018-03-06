<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>

<link href="<c:url value="/resources/css/boardUpdateForm.css"/>" rel="stylesheet">

</head>
<body>
	<center>
		<h1>치우의 스프링 업데이트</h1>
			<c:forEach var="item" items="${list}">
			<form action="boardUpdate.do?num=${item.num}&page=${page}" name="boardVO" method="post">
			<table border=0 cellpadding=0 cellspacing=0 width=800>
				<tbody>
					<tr>
						<th class=header>번호</td><td class=view style='font-size:15px;'>${item.num}</td>
					</tr>
					<tr>
					   <th class=header valign=middle >제목</th>
					   <td class=header_td align=right><input id="title" name="title" value="${item.title}"
					   					style="border:0px;height:25px;width:98.6%;font-size:14.5px;padding:0px"
					   					maxlength="20" />
						</td>
					</tr>										
					<tr>
						<th class=header valign=top>내용</th>
						<td class=header_td ><textarea style="border:0px;height:372px;width:98.3%;resize: none;font-size:15px" 
						id="content" name="content" >${item.content}</textarea>
						</td>
					</tr>
					<tr>
					   <th class=header_bot width=80>작성자</th>
					   <td valign=middle class=view_bot>
						   <input style="border:0;height:20px;width:99.5%;font-size:15px"
						    id="name" name="name" value="${item.name}"
						   					 maxlength="20" readonly/>
					   </td>
					</tr>					
				</tbody>
			</table>
			<table width=800>
				<tr>
					<td width=20%>[<a style='font-size:15px;' 
					href="<c:url value='/boardOneView.do?num=${item.num}&page=${page}' />">취소</a>]</td>
					<td width=80% align=right>
					[<input type="submit" style='border:0; color:blue;
					background-color:white; font-size:15px; cursor:pointer;
					width:30px; margin:0px; padding:0px'
					 value="완료" />]</td>
				</tr>
			</table>
			</form>
			</c:forEach>
	</center>
</body>
</html>





