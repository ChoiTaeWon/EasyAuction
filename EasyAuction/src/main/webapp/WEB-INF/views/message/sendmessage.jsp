<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/messagestyles.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("li").click(function(event) {
		var id = $(this).attr("id");
		var mbId = '${mbId}';
		location.href="/easyauction/message/" + id + ".action?mbId=" + mbId;
		event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
	})
})

$(function(){
		$("#msgReceiver").blur(function(event) {
			var mbId = $("#msgReceiver").val();
			$.ajax({
				url : "/easyauction/ajax/membercheck.action?mbId=" + mbId,
				async : true,
				data : {},
				method : "GET",
				success : function(result, status, xhr) {
					if (result != 1){
						alert("유효하지 않는 아이디");
						$("#msgReceiver").val('').focus();
						$("#checkresult").text("등록되지않은 아이디 입니다.").css({ color : "red" });
					} else {
						$("#checkresult").text("");
					}
					
				},
				error : function(xhr, status, ex) {
					alert(status+ex);
				}
			})
			event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
		})
})

</script>
</head>
<body>
<!-- 쪽지 해더 -->
<div id='cssmenu'>
<ul>
   <li id="receivemessages"><a href="#"><span>받은 쪽지함</span></a></li>
   <li id="sendmessages"><a href='#'><span>보낸쪽지함</span></a></li>
   <li class='active' id="sendmessage"><a href='#'><span>쪽지보내기</span></a></li>
</ul>
</div>
<!-- 쪽지 해더 -->
<!-- 쪽지 제목 및 내용 -->
<form action="sendmessage.action" id="send" method="post">
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
			<td height="2" bgcolor="#227405"></td>
		</tr>
		<tr>
			<td height="27" bgcolor="#F9F9F9">
		<tr>
<input type="hidden" id="msgSender" name="msgSender" value="${ mbId }"/>
<td>제목<br /><input align="right" type="text" id='msgTitle' name='msgTitle' style="width:100%;" /><br /></td>
</tr>
<tr>
<td>받는사람<br /><input align="right" type="text" id='msgReceiver' name='msgReceiver' style="width:100%;" /><span id="checkresult"></span><br /></td>
</tr>
<tr>
<td>
내용
<textarea id='msgContent' name='msgContent' style="width:100%;height:250px;"></textarea></td>
</tr>
</table>
<div align="center">
	<img src="/easyauction/resources/images/bt_submit.gif" onclick="submit();" />
</div>
</form>
<!-- 쪽지 제목 및 내용 --></body>
</html>