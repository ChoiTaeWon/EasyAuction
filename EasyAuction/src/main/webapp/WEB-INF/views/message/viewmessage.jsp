<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/messagestyles.css"/>
	<!-- <link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/styles.css"/> -->
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</head>
<body>
<!-- 쪽지 해더 -->
<div id='cssmenu'>
<ul>
   <li><a href='/easyauction/message/receivemessages.action'><span>받은 쪽지함</span></a></li>
   <li><a href='/easyauction/message/sendmessages.action'><span>보낸쪽지함</span></a></li>
   <li class='active'><a href='/easyauction/message/sendmessage.action'><span>쪽지보내기</span></a></li>
</ul>
</div>
<!-- 쪽지 해더 -->
<table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td height="2" bgcolor="#227405"></td>
                </tr>
                <tr>
                    <td height="27" bgcolor="#F9F9F9">
<!-- 쪽지 제목 및 내용 -->
<table>
    <tr>
        <td width="496" height="76" align="left" valign="top" >
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="90" height="10"></td>
                    <td width="232"></td>
                    <td width="174"></td>
                </tr>
                <tr>
                    <td class="viewmessage" width="95">보낸 사람</td>
                    <td class="viewmessage" align="center" width="232">${ message.msgSender }</td>
                    <td class="viewmessage" width="90">받는 사람</td>
                    <td class="viewmessage" align="center" width="150">${ message.msgReceiver }</td>
                </tr>
                <tr>
                    <td class="viewmessage">받은 시간</td>
					<td class="viewmessage" align="left;">${ message.msgDate }</td>
					<td class="viewmessage" align="right" colspan="2">
					<a href="#"><img src="/easyauction/resources/images/bt_reply.gif"></a>
					<a href="#"><img src="/easyauction/resources/images/bt_list.gif"></a></td>
                </tr>
                <tr><td><br /></td></tr>
  	 			<td valign="top" colspan="5" height="300px" style="border: solid 1px #377722;background-color: #ffffff;">
  	 			${ message.msgContent }
  	 			</td>
            </table>
		</td>
    </tr>
</table>
</body>
</html>