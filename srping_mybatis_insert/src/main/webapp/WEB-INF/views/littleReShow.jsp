<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글댓글</title>
<script language="javascript">
function md(aa){
// <!-- a태그 포스트 전송을 한번 시도해봄 (삭제시 필요)
	littlRepleDelete.action="littleRepleDelete.do";
	littlRepleDelete.method="post";	
	var asdf = aa.value.replace("num", "").replace("mynum","");
	var hi = asdf.lastIndexOf("_");
	
	var num=asdf.substring(0,hi);
	var mynum=asdf.substring(hi*1 + 1, asdf.length);
	
	document.getElementById("num").value = num;
	document.getElementById("mynum").value = mynum;

	/*<!-- json으로 만들기
		var obj = new Object();
		obj.num = num;
		obj.mynum = mynum;
		var jsonData = JSON.stringify(obj);
		console.log(jsonData);
		$(document).ready(function(){
			$.ajax({
				url : "littleRepleDelete.do?num="+num+"&mynum="+mynum

		        , method : "post"

				, dataType : 'json'

				, data : jsonData

				, processData : true //querySTring make false

				, contentType : "application/json; charset=UTF-8"

				, success : function(data, stat, xhr) {

					//alert("success");

				}

			    , error : function(xhr, stat, err) {

			    	//alert("error");

			    	console.log(err);

			    }

			});
		});		
	 -->*/
	
	littlRepleDelete.num.value=num;
	littlRepleDelete.mynum.value=mynum;
	littlRepleDelete.submit();
// -->

}
</script>
</head>
<!-- 댓글 입력 폼 -->
<c:url var="insertUrl" value="/littlRepleInsert.do" />
	<form:form commandName="littleReView" action="${insertUrl}" name="littleReView" method="post">
		<table width=800 border=1 height=80>
			<tr>
				<td bgcolor=white valign=top width=10%>
					작성자<br>
					<form:input path="name" type="text"/>
					<form:input path="num" type="hidden" value="${num}"/>		
				</td>
				<td bgcolor=white width=85%>
					<form:textarea path="content" style='width:99%;height:100%;resize:none' />
				</td>
				<td bgcolor=white width=5%>
					<input type=submit value="등록">
				</td>						
			</tr>
		</table>
	</form:form>
<!-- 댓글 목록 -->
<body style="background-color:#EFF7EB; padding:0px" >
	<form id="littlRepleDelete" name="littlRepleDelete">
		<input id="num" name="num" type="hidden" value="haha"/>
		<input id="mynum" name="mynum" type="hidden" value="hoho"/>
		<c:forEach var="item" items="${list}">
			<table border=0 cellspacing=0 cellpadding=0 width=800>
				<tr>
					<td width="90%" height=40 style='border-top:0.5px solid gray'>작성자 : ${item.name}</td>
					<td align="right" width="10%" style='padding-right:4px;border-top:0.5px solid gray'>
					<button type=button id="num${item.num}_mynum${item.mynum}" 
					value="num${item.num}_mynum${item.mynum}"
					onclick="md(this);">삭제</button>
					</td>
				<tr>
					<td colspan=2>${item.content}</td>
				</tr>
				<tr>
					<td colspan=2 height=40>${item.writedate} ${item.writetime}</td>
				</tr>
			</table>
		</c:forEach>
	</form>
</body>
</html>