<%@page import="com.easyauction.dto.Board"%>
<%@page import="java.util.List"%>
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
	function doSubmit() {
		document.getElementById("updatefreeboardcomment").submit();
	}
	
	</script>
</head>
	<body>
	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
		<br /><br />
		<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
			<div style="width:216px;float: left; margin:0 10px 0 0;"><!-- 사이드메뉴 -->
			  <c:import url="/WEB-INF/views/board/sidemenu.jsp" />
			</div><!-- 사이드메뉴 끝 -->
			
			<div style="width: 730px; float:right;"><!-- list -->
			
			<!--리스트 위의 맨위 이미지-->
			<div id="contents_wrap">
				
			<table cellpadding="0" cellspacing="0" border="0" width="730" height="96" background="#">
			<tr>
				<td style="padding-left:25px;"><img src="/easyauction/resources/images/freeboardmain.png"></td>
			</tr>
			</table>
			
			<div style="padding:5px;"></div>
			
			<table width="100%">
			<tr height="30">
				<!-- 오른쪽 위 자유게시판 아이콘 이미지-->
				<td align="left">&nbsp;</td>
								  
				<td align="right"><a href='/easyauction/board/freeboard.action'><img src='/easyauction/resources/images/housefreeboard.png'></a>  
								  <a href='/easyauction/board/freeboard.action'><img src='/easyauction/resources/images/freeboardsmall.png'></a>
				</td>
			</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td height="1" bgcolor="#e6e6e6"></td>
				</tr>
				<tr>
					<td height="26" bgcolor="#f8f8f8">
					
						<!-- 리스트 위의 타이틀 -->
						<table width="100%">
							<tr>
								<!-- <td align="center" class="smfont" width="50"><font color="#666666">번호</font></td>
								<td width="1" bgcolor="#e6e6e6"></td> -->
								<td align="center" class="smfont"><font color="#666666">제목</font></td>
								<td width="1" bgcolor="#e6e6e6"></td>
								<td align="center" class="smfont" width="90"><font color="#666666">작성자</font></td>
								<td width="1" bgcolor="#e6e6e6"></td>
								<td align="center" class="smfont" width="90"><font color="#666666">작성일자</font></td>
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
			
			<!-- 게시글 내용 시작 -->
			<table width="100%">
			<tr>
				<td>
				<table width="100%" height="30">
				<c:forEach var="board" items="${ boards }">
				<c:if test="${ board.bdType eq 2 }">
				<tr>
					<%-- <td align="center" width="50" class="smfont">${board.bdNo}</td>
					<td width="1"></td> --%>
					<td align="center" style="padding-left:10px;"><b><a href="/easyauction/board/freeboardview.action?bdno=${ board.bdNo }">${ board.bdTitle }</a></b>[${ board.bdReportingCount }]</td>
					<td width="1"></td>
					<td 			class="smfont" align="center" width="90"><div style="padding-left:10px;">${board.bdWriter}</div></td>
					<td width="1"></td>
					<td 			class="smfont" align="center" width="90"><div style="padding-left:10px;">${board.bdDate }</div>
					<td width="1"></td>
					<td 			class="smfont" align="center" width="40"><div style="padding-left:10px;">${board.bdReadCount}</div></td>
					<td width="1"></td>
				</tr>
				</c:if>
				</c:forEach>
				<tr>
					<td height="1" colspan="11" bgcolor="#e6e6e6"></td>
				</tr>
			</table>
			<!-- 게시글 내용 끝 -->
			
			<!-- 검색폼 위의 내용 시작 -->
			<div style="padding:3px;"></div>

			<table border='0' width='100%' cellspacing='0' cellpadding='0'>
					<tr>
						<td width='140' style='padding-top:10px;padding-bottom:10px;'><img src='bbs_img/bbs_reply_manicon.gif' border='0' align='absmiddle'> <b>${ comment.bcWriter }</b></td>
						<td width='600' align='left'>${ comment.bcContent }&nbsp;&nbsp;<font color='#cacaca' style='font-size:11px;'>${ comment.bcRegdate }</font>
						<!-- 댓글 옆 수정 삭제 -->
						<td align="right">
						<a href="javascript:doSubmit();"><img src='/easyauction/resources/images/sujung.png'></a>
						<!--<a href='/easyauction/board/updatefreeboard.action'><img src='/easyauction/resources/images/sujung.png'></a> -->
					    <a href='/easyauction/board/deletefreeboard.action'><img src='/easyauction/resources/images/delete.png'></a>
						</td>
						
						</td>
						<td width='50'></td>
					</tr>
					<tr>
						<td colspan="3" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
					</tr>
				</table>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>