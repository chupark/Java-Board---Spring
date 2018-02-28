<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>´ñ±Û´ñ±Û</title>
<script language="javascript">
function save_fr(f) {
        f.target = "hid_fun"
        //f.action = "title_son_ok.asp";
        //f.submit();
        return false;
}
</script>
</head>
<!-- ´ñ±Û ÀÔ·Â Æû -->
<c:url var="insertUrl" value="/littlRepleInsert.do" />
	<form:form commandName="littleReView" action="${insertUrl}" name="littleReView" method="post">
		<table width=800 border=1 height=80>
			<tr>
				<td bgcolor=white valign=top width=10%>
					ÀÛ¼ºÀÚ<br>
					<form:input path="name" type="text"/>
					<form:input path="num" type="hidden" value="${num}"/>		
				</td>
				<td bgcolor=white width=85%>
					<form:textarea path="content" style='width:99%;height:100%;resize:none' />
				</td>
				<td bgcolor=white width=5%>
					<input type=submit value="µî·Ï">
				</td>						
			</tr>
		</table>
	</form:form>
<!-- ´ñ±Û ¸ñ·Ï -->
<body style="background-color:#EFF7EB; padding:0px" >
	<form:form name="frmNews" method="post" onSubmit="return save_fr(this)">
		<c:forEach var="item" items="${list}">
			<table border=0 cellspacing=0 cellpadding=0 width=800>
				<tr>
					<td height=40 style='border-top:0.5px solid gray'>ÀÛ¼ºÀÚ : ${item.name}</td>
					<td style='border-top:0.5px solid gray'>

					</td>
				<tr>
					<td colspan=2>${item.content}</td>
				</tr>
				<tr>
					<td colspan=2 height=40>${item.writedate} ${item.writetime}</td>
				</tr>
			</table>
		</c:forEach>
	</form:form>
</body>
</html>