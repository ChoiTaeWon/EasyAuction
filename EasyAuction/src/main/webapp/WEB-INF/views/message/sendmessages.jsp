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
		alert('${mbId}');
		var mbId = '${mbId}';
		location.href="/easyauction/message/" + id + ".action?mbId=" + mbId;
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
   <li class='active' id="sendmessages"><a href='#'><span>보낸쪽지함</span></a></li>
   <li id="sendmessage"><a href='#'><span>쪽지보내기</span></a></li>
   <li id="viewmessage"><a href='#'><span>쪽지보기(임시)</span></a></li>
</ul>
</div>
<!-- 쪽지 해더 -->
<!-- 쪽지제목 -->
<table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td height="2" bgcolor="#227405"></td>
                </tr>
                <tr>
                    <td height="27" bgcolor="#F9F9F9">
                    <!-- 줄긋기? -->
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td height="27" align="center" class="smfont"><b>내 용</td>
                                <td width="1" valign="top">
								<table cellpadding="0" cellspacing="0" width="1" height="19">
									<tr>
										<td bgcolor="#227405"></td>
									</tr>
								</table>
								</td>
                                <td align="center" width="80" class="smfont"><b>받은 사람</td>
                                <td width="1" valign="top">
								<table cellpadding="0" cellspacing="0" width="1" height="19">
									<tr>
										<td bgcolor="#227405"></td>
									</tr>
								</table>
								</td>
                                <td align="center" width="100" class="smfont"><b>보낸 시간</td>
								<td width="1" valign="top">
								<table cellpadding="0" cellspacing="0" width="1" height="19">
									<tr>
										<td bgcolor="#227405"></td>
									</tr>
								</table>
								</td>
								<td align="center" width="60" class="smfont"><b>쪽지삭제</td>
                            </tr>
                        </table>
</td>
                </tr>
                <tr>
                    <td height="1" bgcolor="#E2E2E2"></td>
                </tr>
            </table>
<!-- 쪽지제목 -->
<!-- for문들어갈 쪽지내용 -->
<table width='100%' cellspacing='0' cellpadding='0' border='0'>
<c:choose>
<c:when test="${ messages ne null }">
<c:forEach var="message" items="${ messages }">
	<tr height='25'>
		<td style='padding-left:5px'><a href="/easyauction/message/viewmessage.action?msgNo=${ message.msgNo }"><img src="/easyauction/resources/images/icon_mess_2.gif" border="0" align="absmiddle"><font color="#888888">${ message.msgContent }</a></td>
		<td width='81' align='center'><font color="#888888">${ message.msgReceiver }</td>
		<td width='101' align='center'><font color="#888888">${ message.msgDate }</td>
		<td width='61' align='center'><img src="/easyauction/resources/images/bt_mess_del.gif" border="0" align="absmiddle"></a></td>
</c:forEach>
</c:when>
<c:otherwise>
	<td width='101' align='center'><font color="#888888">보낸 쪽지가 없습니다.</td>
</c:otherwise>
</c:choose>
	</tr>
</table>
<!-- 페이징 -->
<table width='96%' cellspacing='0' cellpadding='0' border='0'>
	<tr>
		<td align="center" height="30"><font style='font-size:11px'>[Prev]...<font color='#00CC00'>[</font><font color='red'><b>1</b></font><font color='#00CC00'>]</font>[<a href='/happy_message.php?start=10&mode=receivelist&kfield=&kword=&adminMode=n' onfocus=this.blur()>2</a>]<a href='/happy_message.php?start=10&mode=receivelist&kfield=&kword=&adminMode=n' onfocus=this.blur();>...[Next]</a></font></td>
	</tr>
</table>
<!-- 페이징 -->
<!-- for문들어갈 쪽지내용 -->
</body>
</html>