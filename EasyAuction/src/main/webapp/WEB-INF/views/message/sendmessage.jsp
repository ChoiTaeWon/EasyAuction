<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
</head>
<body>
<!-- 쪽지 해더 -->
<div id='cssmenu'>
<ul>
   <li><a href='#'><span>받은 쪽지함</span></a></li>
   <li><a href='#'><span>보낸쪽지함</span></a></li>
   <li class='active'><a href='#'><span>쪽지보내기</span></a></li>
</ul>
</div>
<!-- 쪽지 해더 -->
<!-- 쪽지 제목 및 내용 -->
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
			<td height="2" bgcolor="#227405"></td>
		</tr>
		<tr>
			<td height="27" bgcolor="#F9F9F9">
		<tr>

<td><input align="right" type="text" id='title' name='title' style="width:100%;" value="제목" onfocus="this.value=''" /><br /></td>
</tr>
<tr>
<td><input align="right" type="text" id='receiver' name='receiver' style="width:100%;" value="받는사람" onfocus="this.value=''"/><br /></td>
</tr>
<tr>
<td>
내용
<textarea id='content' name='content' style="width:100%;height:250px;"></textarea></td>
</tr>

</table>
<!-- 쪽지 제목 및 내용 --></body>
</html>