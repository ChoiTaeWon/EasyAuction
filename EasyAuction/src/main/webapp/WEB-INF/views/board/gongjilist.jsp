<%@page import="com.easyauction.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항게시판</title>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css" />
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css" />
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="/easyauction/resources/js/jquery-ui.js"></script>
	<script type="text/javascript">

	$(function(){
		$('#searchboard').click(function(){
			var search = document.getElementById('search').value;
			var searchdata = document.getElementById('searchdata').value;
			var re = /^[0-9]+$/;
			//var html = "<input type='hidden' name='queryString' id='queryString' value='search=" + search + "&searchdata=" + searchdata + "'/>";
			if(search == 'bdtitle'&&!re.test(searchdata)){
				alert("제목을 입력하세요");
				searchdata.focus();
				return;
				
			}else if(searchdata.length==0){
				alert("내용을 입력하세요");
				searchdata.focus();
				return;
			}
			//document.getElementById('listsearch').innerHTML = html;
			//$('#listsearch').append(html);
			document.getElementById('listsearch').submit();
			event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
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
			<div style="width:216px;float: left; margin:0 10px 0 0;"><!-- 사이드메뉴 -->
			  <c:import url="/WEB-INF/views/board/sidemenu.jsp" />
			</div><!-- 사이드메뉴 끝 -->
			
			<div style="width: 730px; float:right;"><!-- list -->
			
			<!--리스트 위의 맨위 이미지-->
			<div id="contents_wrap">
				
			<table cellpadding="0" cellspacing="0" border="0" width="730" height="96">
			<tr>
				<td style="padding-left:25px;"><img src="/easyauction/resources/images/gongjimain.png"></td>
			</tr>
			</table>
			
			<div style="padding:5px;"></div>
			
			<table width="100%">
			<tr height="30">
				<!-- 오른쪽 위 자유게시판 아이콘 이미지-->
				<td align="left">&nbsp;</td>
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
				<c:choose>
				<c:when test="${ boards ne null && fn:length(boards) > 0 }">
				<c:forEach var="board" items="${ boards }">
				<tr>
					<td align="center" style="padding-left:10px;"><b><a href="/easyauction/board/gongjiview.action?bdno=${ board.bdNo }&pageno=${pageno}">${ board.bdTitle }</a></b>[${ board.commentCount }]</td>
					<td width="1"></td>
					<td 			class="smfont" align="center" width="90"><div style="padding-left:10px;">${board.bdWriter}</div></td>
					<td width="1"></td>
					<td 			class="smfont" align="center" width="90"><div style="padding-left:10px;">${board.bdDate }</div>
					<td width="1"></td>
					<td 			class="smfont" align="center" width="40"><div style="padding-left:10px;">${board.bdReadCount}</div></td>
					<td width="1"></td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<td class="smfont" align="center" width="40"><div style="padding-left:10px;">등록된 게시글이 없습니다.</div></td>
				</c:otherwise>
				</c:choose>
				<tr>
					<td height="1" colspan="11" bgcolor="#e6e6e6"></td>
				</tr>
			</table>
			<!-- 게시글 내용 끝 -->
			
			<!-- 검색폼 위의 내용 시작 -->
			<div style="padding:3px;"></div>

			<!-- 리스트 아래 글쓰기와 목록 -->
			<table width="100%">
				<tr>
					<c:choose>
						<c:when test="${ loginuser.mbId eq view.bdWriter }">
						<td align="right">
							<a href="/easyauction/board/gongjiregister.action"> 
							<img src="/easyauction/resources/images/write.png"></a>&nbsp; 
							<a href='/easyauction/board/gongji.action'> 
							<img src="/easyauction/resources/images/list1.png"></a>
						</td>
						</c:when>
						<c:otherwise></c:otherwise>
						</c:choose>
				</tr>
				<!-- 페이지 번호 -->
				<c:choose>
					<c:when test="${ pager ne null }">		
					<div style="text-align: center;">
					${pager}
					</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			<!-- 페이지 번호 -->
			</table> 
			<tr>
				<td align="right">
				<c:choose>
				<c:when test="${ loginuser ne null && loginuser.mbGrant ne false }">
				 		<a href="/easyauction/board/gongjiregister.action"> 
							<img src="/easyauction/resources/images/write.png"></a>&nbsp; 
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>	
					<a href='/easyauction/board/gongji.action'>
					<img src="/easyauction/resources/images/list1.png"></a>
				
				</td>
			</tr>
			</table>
			<!-- 검색폼 위의 내용 끝 -->
			
			
	 		<!-- 검색폼 // 시작 -->
			<form id="listsearch" action="gongji.action" method="get">
			<table align="center">
					<td height='30' border='0' align='center' valign='middle'>
					<!-- <input type='radio' name='search' value='bdno' checked> 번호 -->
					<input type='radio' id="search" name='search' value='bdTitle' checked> 제목
					<input type='radio' id="search" name='search' value='bdWriter'> 작성자
					<input style='width:135px;height:18px' type="text" name="searchdata" id="searchdata" />
					
					<td align="left" ><img src="/easyauction/resources/images/search1.png" id="searchboard"></td>
			</table>
			</form>
			</td>
			</tr>
			</table>
			</div>
			<!-- 검색폼 끝 -->
			
			</div><!-- list 끝 -->
		</div>
	</div> <!-- A 끝 -->
</body>

</html>
