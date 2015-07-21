<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>커뮤니티</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body_style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
</head>

<body>
	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
		<br />
		<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
			<div style="width:216px;float: left; margin:0 10px 0 0;"><!-- 사이드메뉴 -->
			  <c:import url="/WEB-INF/views/board/sidemenu.jsp" />
			</div><!-- 사이드메뉴 끝 -->
			<div style="width: 730px; float:right;"><!-- list -->
			
			<!--내용-->
			<div id="contents_wrap">
				
			<table cellpadding="0" cellspacing="0" border="0" width="730" height="96" background="img/img_customer_banner_bg.gif">
			<tr>
				<td style="padding-left:25px;"><img src="img/txt_banner_free.gif"></td>
			</tr>
			</table>
			
			<div style="padding:5px;"></div>
			
			<table width="100%">
			<tr height="30">
				<td align="left">&nbsp;</td>
				<td align="right"><a href='http://10won.cgimall.co.kr'><img src='./img/ico_home.gif'></a>  <a href=bbs_list.php?&num=&tb=board_free>자유게시판</a> </td>
			</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td height="1" bgcolor="#e6e6e6"></td>
				</tr>
				<tr>
					<td height="26" bgcolor="#f8f8f8">
					
						<table width="100%">
							<tr>
								<td align="center" class="smfont" width="50"><font color="#666666">번호</font></td>
								<td width="1" bgcolor="#e6e6e6"></td>
								<td align="center" class="smfont"><font color="#666666">제목</font></td>
								<td width="1" bgcolor="#e6e6e6"></td>
								<td align="center" class="smfont" width="90"><font color="#666666">작성자</font></td>
								<td width="1" bgcolor="#e6e6e6"></td>
								<td align="center" class="smfont" width="90"><font color="#666666">작성일자</font></td>
								<td width="1" bgcolor="#e6e6e회"></td>
								<td align="center" class="smfont" width="40"><font color="#666666">추천</font></td>
								<td width="1" bgcolor="#e6e6e회"></td>
								<td align="center" class="smfont" width="40"><font color="#666666">조회</font></td>
							</tr>
						</table>
					
					</td>
				</tr>
				<tr>
					<td height="1" bgcolor="#e6e6e6"></td>
				</tr>
			</table>
			<!--내용 끝-->
			
			<!-- 검색폼 시작 -->
			<table width="100%">
			<tr>
				<td align="right"><A HREF="./bbs_list.php?tb=board_free"><img src="bbs_img/bbs_list.gif" BORDER=0></A></td>
			</tr>
			</table>
			
			<table width="100%">
			<tr>
				<td height="25" align="center" valign="top" style="padding-top:3px;"><b>[1]</b></td>
			</tr>
			</table>
			
			<!-- 검색폼 // 시작 -->
			<table width="100%" align="center">
			<form  method='post' action='./bbs_list.php'>
			<input type=hidden name='num' value=''>
			<input type=hidden name='action' value='search'>
			<input type=hidden name='tb' value='board_free'>
			<tr>
				<td height='30' border='0' align='center' valign='middle'>
					<input type='radio' name='search' value='bbs_title' checked> 제목
					<input type='radio' name='search' value='bbs_name'> 이름
					<input type='radio' name='search' value='bbs_review'> 내용
					<input type='text' name='keyword' style="border:1px solid #DEDEDE; height:17px;">
					<input type='image' src='bbs_img/bbs_search.gif' border="0" value='검색' align='absmiddle'>
			
				</td>
			</tr>
			</form>
			</table>
			<!-- 검색폼 끝 -->
			
			</div><!-- list 끝 -->
		</div>
	</div> <!-- A 끝 -->
</body>
</html>
