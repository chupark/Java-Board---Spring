<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>��۴��</title>
<script language="javascript">
function md(aa){
// <!-- a�±� ����Ʈ ������ �ѹ� �õ��غ� (������ �ʿ�)
	littlRepleDelete.action="littleRepleDelete.do";
	littlRepleDelete.method="post";	
	var asdf = aa.value.replace("num", "").replace("mynum","");
	var hi = asdf.lastIndexOf("_");
	
	var num=asdf.substring(0,hi);
	var mynum=asdf.substring(hi*1 + 1, asdf.length);
	
	document.getElementById("num").value = num;
	document.getElementById("mynum").value = mynum;

	/*<!-- json���� �����
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

// <!-- ��� ������ư Ŭ��
function md2(aa){
	// <!-- a�±� ����Ʈ ������ �ѹ� �õ��غ� (������ �ʿ�)
		var asdf = aa.value.replace("num", "").replace("mynum","").replace("_mod","");
		var hi = asdf.lastIndexOf("_");
		
		var num=asdf.substring(0,hi);
		var mynum=asdf.substring(hi*1 + 1, asdf.length);

		//��ǲ�ڽ� ���̰�
		document.getElementById("aa" + mynum).style.display="none";
		document.getElementById("aa" + mynum+"_hid").style.display="";

		//����, ��ҹ�ư ���̰�
		document.getElementById("update_"+mynum).style.display="";
		document.getElementById("cancel_"+mynum).style.display="";
		//������ư �����
		document.getElementById("mod_"+mynum).style.display="none";
	// -->
}
// ��� ������ư Ŭ�� -->

//<!-- ��� ���� ����
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
// ��� ���� ���� -->

// <!-- ��� ���� ���
function md4(aa){
	var asdf = aa.value.replace("num", "").replace("mynum","").replace("_cancel","");
	var hi = asdf.lastIndexOf("_");
	
	var mynum=asdf.substring(hi*1 + 1, asdf.length);

	//��ǲ�ڽ� ���ְ� ���� �ؽ�Ʈ ������
	//��ǲ�ڽ��� �ִ� �� ������� ��������
	document.getElementById("aa" + mynum).style.display="";
	document.getElementById("aa" + mynum+"_hid").style.display="none";
	document.getElementById("aa" + mynum+"_hid").value =
		document.getElementById("aa" + mynum).innerHTML;
	//����, ��ҹ�ư ���̰�
	document.getElementById("update_"+mynum).style.display="none";
	document.getElementById("cancel_"+mynum).style.display="none";
	//������ư �����
	document.getElementById("mod_"+mynum).style.display="";	
}
// ��� ���� ��� -->
</script>
</head>
<!-- ��� �Է� �� -->
<c:url var="insertUrl" value="/littlRepleInsert.do" />
	<form:form commandName="littleReView" action="${insertUrl}" name="littleReView" method="post">
		<table width=800 border=1 height=80>
			<tr>
				<td bgcolor=white valign=top width=10%>
					�ۼ���<br>
					<form:input path="name" type="text"/>
					<form:input path="num" type="hidden" value="${num}"/>		
				</td>
				<td bgcolor=white width=85%>
					<form:textarea path="content" style='width:99%;height:100%;resize:none' />
				</td>
				<td bgcolor=white width=5%>
					<input type=submit value="���">
				</td>						
			</tr>
		</table>
	</form:form>
	
<!-- ��� ��� -->
<body style="background-color:#EFF7EB; padding:0px" >
	<form id="littlRepleDelete" name="littlRepleDelete">
		<!-- ���۵� ������ ���� -->
		<input id="num" name="num" type="hidden" value="haha"/>
		<input id="mynum" name="mynum" type="hidden" value="hoho"/>
		<input id="content" name="content" type="hidden" value="hoho"/>
		<!-- ������� ���۵� ������ ���� -->
		
		<c:forEach var="item" items="${list}">
			<table border=0 cellspacing=0 cellpadding=0 width=800>
				<tr>
					<td width="90%" height=40 style='border-top:0.5px solid gray'>�ۼ��� : ${item.name}</td>
					<td rowspan=3 align="right" valign=top width="10%" style='padding-right:4px;border-top:0.5px solid gray'>
						<table>
							<tr>
								<td><!-- ������ư�� �׻� Ȱ��ȭ -->
									<button type=button id="num${item.num}_mynum${item.mynum}" 
									value="num${item.num}_mynum${item.mynum}"
									onclick="return md(this);">����</button>
								</td>
							</tr>
							<tr><!-- ���� ��ư Ŭ���� ���� ��ư display false-->
									<!-- ��� ��ư Ŭ���� ���� ��ư display true-->
								<td id="mod_${item.mynum}">
									<button type=button id="num${item.num}_mynum${item.mynum}_mod" 
									value="num${item.num}_mynum${item.mynum}_mod"
									onclick="md2(this);">����</button>								
								</td>
								<!-- ���� ��ư Ŭ���� ����  ��ư display true-->
									<!-- ��� ��ư Ŭ���� ����  ��ư display false-->
								<td id="update_${item.mynum}" style="display:none">
									<button type=button id="num${item.num}_mynum${item.mynum}_update" 
									value="num${item.num}_mynum${item.mynum}_update" style="displaye:none"
									onclick="md3(this);">����</button>
								</td>								
							</tr>
							<tr>
								<!-- ���� ��ư Ŭ���� ���  ��ư display true-->
									<!-- ��� ��ư Ŭ���� ���  ��ư display false-->
								<td id="cancel_${item.mynum}" style="display:none">
									<button type=button id="num${item.num}_mynum${item.mynum}" 
									value="num${item.num}_mynum${item.mynum}_cancel" 
									onclick="return md4(this);">���</button>								
								</td>
							</tr>							
						</table>
					</td>
				</tr>
				<tr>
					<!-- �۳��� ������ư Ŭ���� display false -->
						<!-- �۳��� ��ҹ�ư Ŭ���� display true -->
					<td width="90%" id="aa${item.mynum}">${item.content}</td>
					
					<!-- �۳��� ������ư Ŭ���� display true -->
						<!-- �۳��� ��ҹ�ư Ŭ���� display false -->					
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