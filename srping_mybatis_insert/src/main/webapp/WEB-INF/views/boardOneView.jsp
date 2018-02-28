<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>

<link href="<c:url value="/resources/css/boardOneView.css"/>" rel="stylesheet">
</head>
<center>
<body>

	<h1>ġ���� ������ �Խ��� - ����</h1>
	<c:forEach var="item" items="${list}">
		<table width=800 border="0" cellspacing=0 cellpadding=0>
				<tr>
					<td class=header><b>��ȣ</b></td><td class=view valign=middle>${num}</td>
				</tr>		
				<tr>		
					<td class=header><b>����</b></td><td class=view valign=middle>${item.title}</td>
				</tr>
				<tr>		
					<td valign=top class=header_inside><b>����</b></td>
					<td valign=top class=inside>
					<div class="writtenMessage">${item.content}</div>
					</td>
				</tr>				
				<tr>		
					<td class=header><b>�ۼ���</b></td><td class=view>${item.writeDate}</td>
				</tr>				
				<tr>
					<td class=header><b>�ۼ���</b></td><td class=view>${item.name}</td>
				</tr>				
				<tr>		
					<td class=header_bot><b>��ȸ</b></td><td style='padding-left:10px' class=view_bot>${item.readCount}</td>
				</tr>								
		</table>
		<table width=800>
			<tr>
				<td width=50%>
					[<a href="<c:url value='/pagingTest.do?page=${page}' />">���</a>]
				</td>
				<td width=40% align=right>
					[<a href="<c:url value='/boardDelete.do?num=${num}&page=${page}' />">����</a>]
				</td>
				<td width=10% align=right>
					[<a href="<c:url value='/boardUpdateForm.do?num=${num}&page=${page}' />">����</a>]
				</td>			
			</tr>
		</table>
		<br/>
	<br/>
		<table width=815 height=500>
			<tr>
				<td>
				<iframe name="f_main" id="f_main" src="<c:url value='/repleShow.do?num=${item.num}'/>" width="100%" height="100%"
					frameborder=0 marginwidth=0 marginheight=0 allowtransparency=true
					style="overflow-x:hidden;">
				</iframe>
				</td>
			</tr>
		</table>
	</c:forEach>
	
</center>	
</body>
</html>
