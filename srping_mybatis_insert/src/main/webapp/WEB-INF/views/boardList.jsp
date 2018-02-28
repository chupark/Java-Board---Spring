<%@ page contentType="text/html; charset=euc-kr" %>
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
	<h1>ġ���� ������ �Խ���</h1>
	<table width=800 border="1">
	<thead>
	<tr>
		<th width=7% align=center>��ȣ</th>
		<th width=15% align=center>�ۼ���</th>
		<th width=50% align=center>����</th>
		<th width=8% align=center>��ȸ</th>
		<th width=20% align=center>�ۼ���</th>
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
			[<a href="<c:url value='/boardRegisterForm.do' />">���</a>]
			</td>
		</tr>
	</table>
		total record [${list2}]<br>
		�׽�Ʈ [${abc}]<br>
		����¡ ���� <a href="<c:url value='/pagingTest.do?page=1' />">1</a>��
		<a href="<c:url value='/boardList.do?page=2' />">2</a>
		<a href="<c:url value='/boardList.do?page=3' />">3</a>��
		<a href="<c:url value='/boardList.do?page=4' />">4</a>����<br>
</center>			
</body>
</html>
