<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>자유게시판</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#formsubmit').click(function(){
			alert('수정하시겠습니까?');
			$('#sujung').submit();
			
		})
	})
	</script>
</head>
<body>
	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
		<br /><br />
		<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
			<div style="width:216px;float: left; margin:0 0 0 0;"><!-- 사이드메뉴 -->
			  <c:import url="/WEB-INF/views/board/sidemenu.jsp" />
			</div><!-- 사이드메뉴 끝 -->
			<div style="width: 730px; float:right;"><!-- list -->
			
			<!--내용-->
			<div id="contents_wrap">
				
			<table cellpadding="0" cellspacing="0" border="0" width="730" height="96" background="#">
			<tr>
				<td style="padding-left:25px;"><img src="/easyauction/resources/images/freeboardmain.png"></td>
			</tr>
			</table>
				
				
			<div style="padding:5px;"></div>
			
			<table width="100%">
			<tr height="30">
				<!-- 오른쪽 위 자유게시판 -->
				<td align="left">&nbsp;</td>
								  
				<td align="right"><a href='/easyauction/board/freeboard.action'><img src='/easyauction/resources/images/housefreeboard.png'></a>  
								  <a href='/easyauction/board/freeboard.action'><img src='/easyauction/resources/images/freeboardsmall.png'></a>
				</td>
			</tr>
				
				<form method='post' action='updatefreeboard.action' enctype="multipart/form-data" id="sujung" name='board'>
				<input type=hidden name='bdNo' value='${ view.bdNo }'>
				<input type=hidden name='pageNo' value='${ pageno }'>
				 
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td height="1" bgcolor="#DEDEDE"></td>
						</tr>
						<tr height="30">
							<td bgcolor="#F8F8F8" style="padding-left:10px;"><!-- <img src="img/ico_arrow_03.gif" border="0" align="absmiddle"> -->&nbsp;게시물수정하기</td>
						</tr>
						<tr>
							<td height="1" bgcolor="#DEDEDE"></td>
						</tr>
						</table>
				
						<div style="padding:1px;"></div>
				 		
						<table width="100%"  border="0" cellpadding="0" cellspacing="0">
						<tr height="28">
							<td width="120" bgcolor="#F9F9F9" style="padding-left:10px;"><font color=#000000><font color=#000000>아이디</td>
							<td width="470" bgcolor="#FFFFFF" style="padding-left:10px;"><input type='text' name='bdWriter' value=${ view.bdWriter } maxlength=20 style='font-size:12px; width:150px; height:18px; background-color:white; border:1px; border-style:solid;border-color:#DDDDDD;' value='won' readonly></td>
						</tr>
						<tr><td height="1px" bgcolor="#DEDEDE" colspan="2"></td></tr>
						<tr><td height="1px" bgcolor="#DEDEDE" colspan="2"></td></tr>
						
						<tr height="28">
							<td bgcolor="#F9F9F9" style="padding-left:10px;"><font color=#000000><font color=#000000>제목</td>
							<td bgcolor="#FFFFFF" style="padding-left:10px;"><input name='bdTitle' type='text'  value=${ view.bdTitle } style='font-size:12px; width:90%; height:18px; background-color:white; border:1px; border-style:solid;border-color:#DDDDDD;' value='' size="70" maxlength="50"></td>
						</tr>
						<tr><td height="1px" bgcolor="#DEDEDE" colspan="2"></td></tr>
						<tr><td height="1px" bgcolor="#DEDEDE" colspan="2"></td></tr>
						<tr height="28">
							<td bgcolor="#F9F9F9" style="padding-left:10px;"><font color=#000000><font color=#000000>내용</td>
							<td bgcolor="#FFFFFF" style="padding-left:10px; padding-top:5px"><textarea name="bdContent" cols="100" rows="20" style='font-size:12px; background-color:white; border:1px; border-style:solid;border-color:#DDDDDD;'>${ view.bdContent }</textarea></td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr><td height="5"></td></tr>
						<tr><td height="1px" bgcolor="#DEDEDE" colspan="2"></td></tr>
						<tr><td height="5"></td></tr>
						<tr><td height="5"></td></tr>
						</table>
					</td>
				</tr>
						
				<!-- 내용 옆 수정 삭제 -->
				<td align="right">
					<img src='/easyauction/resources/images/sujung.png' id="formsubmit">
					<a href='/easyauction/board/freeboardview.action?bdno=${ view.bdNo }&pageno=${ pageno }'><img src='/easyauction/resources/images/list.png'></a>
				</td>
				
				</table>
				</form>
			</table>
	</div> <!-- A 끝 -->	
</body>
</html>