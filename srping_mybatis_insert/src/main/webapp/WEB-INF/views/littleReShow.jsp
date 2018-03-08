<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
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
	return false;
// -->

}

// <!-- 댓글 수정버튼 클릭
function md2(aa){
	// <!-- a태그 포스트 전송을 한번 시도해봄 (삭제시 필요)
		var asdf = aa.value.replace("num", "").replace("mynum","").replace("_mod","");
		var hi = asdf.lastIndexOf("_");
		
		var num=asdf.substring(0,hi);
		var mynum=asdf.substring(hi*1 + 1, asdf.length);

		//인풋박스 보이게
		document.getElementById("aa" + mynum).style.display="none";
		document.getElementById("aa" + mynum+"_hid").style.display="";

		//적용, 취소버튼 보이게
		document.getElementById("update_"+mynum).style.display="";
		document.getElementById("cancel_"+mynum).style.display="";
		//수정버튼 숨기기
		document.getElementById("mod_"+mynum).style.display="none";
	// -->
}
// 댓글 수정버튼 클릭 -->

//<!-- 댓글 수정 적용
function md3(aa){
	littlRepleDelete.action="littleUpdate.do";
	littlRepleDelete.method="post";	
	var asdf = aa.value.replace("num", "").replace("mynum","").replace("_update", "");
	var hi = asdf.lastIndexOf("_");
	
	var num=asdf.substring(0,hi);
	var mynum=asdf.substring(hi*1 + 1, asdf.length);
	//document.getElementById("num").value = num;
	//document.getElementById("mynum").value = mynum;
	var modContent = document.getElementById("bb"+mynum).value;
	//alert(modContent);

	littlRepleDelete.num.value=num;
	littlRepleDelete.mynum.value=mynum;
	littlRepleDelete.content.value=modContent;
	littlRepleDelete.submit();
}
// 댓글 수정 적용 -->

// <!-- 댓글 수정 취소
function md4(aa){
	var asdf = aa.value.replace("num", "").replace("mynum","").replace("_cancel","");
	var hi = asdf.lastIndexOf("_");
	
	var mynum=asdf.substring(hi*1 + 1, asdf.length);

	//인풋박스 없애고 기존 텍스트 보여줌
	//인풋박스에 있던 값 원래대로 돌려놓기
	document.getElementById("aa" + mynum).style.display="";
	document.getElementById("aa" + mynum+"_hid").style.display="none";
	document.getElementById("aa" + mynum+"_hid").value =
		document.getElementById("aa" + mynum).innerHTML;
	//적용, 취소버튼 보이게
	document.getElementById("update_"+mynum).style.display="none";
	document.getElementById("cancel_"+mynum).style.display="none";
	//수정버튼 숨기기
	document.getElementById("mod_"+mynum).style.display="";	
}
// 댓글 수정 취소 -->
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
		<!-- 전송될 데이터 집합 -->
		<input id="num" name="num" type="hidden" value="haha"/>
		<input id="mynum" name="mynum" type="hidden" value="hoho"/>
		<input id="content" name="content" type="hidden" value="hoho"/>
		<!-- 여기까지 전송될 데이터 집합 -->
		
		<c:forEach var="item" items="${list}">
			<table border=0 cellspacing=0 cellpadding=0 width=800>
				<tr>
					<td width="90%" height=40 style='border-top:0.5px solid gray'>작성자 : ${item.name}</td>
					<td rowspan=3 align="right" valign=top width="10%" style='padding-right:4px;border-top:0.5px solid gray'>
						<table>
							<tr>
								<td><!-- 삭제버튼은 항상 활성화 -->
									<button type=button id="num${item.num}_mynum${item.mynum}" 
									value="num${item.num}_mynum${item.mynum}"
									onclick="return md(this);">삭제</button>
								</td>
							</tr>
							<tr><!-- 수정 버튼 클릭시 수정 버튼 display false-->
									<!-- 취소 버튼 클릭시 수정 버튼 display true-->
								<td id="mod_${item.mynum}">
									<button type=button id="num${item.num}_mynum${item.mynum}_mod" 
									value="num${item.num}_mynum${item.mynum}_mod"
									onclick="md2(this);">수정</button>								
								</td>
								<!-- 수정 버튼 클릭시 적용  버튼 display true-->
									<!-- 취소 버튼 클릭시 적용  버튼 display false-->
								<td id="update_${item.mynum}" style="display:none">
									<button type=button id="num${item.num}_mynum${item.mynum}_update" 
									value="num${item.num}_mynum${item.mynum}_update" style="displaye:none"
									onclick="md3(this);">적용</button>
								</td>								
							</tr>
							<tr>
								<!-- 수정 버튼 클릭시 취소  버튼 display true-->
									<!-- 취소 버튼 클릭시 취소  버튼 display false-->
								<td id="cancel_${item.mynum}" style="display:none">
									<button type=button id="num${item.num}_mynum${item.mynum}" 
									value="num${item.num}_mynum${item.mynum}_cancel" 
									onclick="return md4(this);">취소</button>								
								</td>
							</tr>							
						</table>
					</td>
				</tr>
				<tr>
					<!-- 글내용 수정버튼 클릭시 display false -->
						<!-- 글내용 취소버튼 클릭시 display true -->
					<td width="90%" id="aa${item.mynum}">${item.content}</td>
					
					<!-- 글내용 수정버튼 클릭시 display true -->
						<!-- 글내용 취소버튼 클릭시 display false -->					
					<td id="aa${item.mynum}_hid" style="display:none;width:90%">
						<input type=text style="width:100%" id="bb${item.mynum}" value="${item.content}">
					</td>
				</tr>
				<tr>
					<td  height=40>${item.writedate} ${item.writetime}</td>
				</tr>
			</table>
		</c:forEach>
	</form>
</body>
</html>