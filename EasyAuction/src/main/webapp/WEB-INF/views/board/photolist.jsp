<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>포토 후기 게시판</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
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
				<table width="100%">
				<tr>
					<td align="center"><a href="#"><img width="728" src="/easyauction/resources/images/img_photo_review.jpg" title="후기쓰러가기"></td>
				</tr>
				</table>
				
				
				<div style="padding:5px;"></div>
				
				<table width="100%">
				<tr height="30">
					<td align="left">&nbsp;</td>
					<td align="right"><a href='#'><img src='/easyauction/resources/images/ico_home.gif'></a> <a href=bbs_list.php?&num=&tb=board_review>포토리뷰</a> </td>
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
									<td align="center" class="smfont" width="140"><font color="#666666">사진</font></td>
									<td width="1" bgcolor="#e6e6e6"></td>
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
				 <div style="padding:3px;"></div>
				 
				 <c:forEach var="photo" items="${ photos }">
				 <c:if test="${ photo.bdType eq 3 }">
				 <input type="hidden" name="bdno" value="${ photo.bdNo }">
				 <table width="100%">
				 	<tr height="130">
				 	<c:forEach var="image" items="${ photo.boardImage }">
				 	  <td width="140" align="center"><a href="/easyauction/board/photoview.action?bdno=${ photo.bdNo }"><img width="140" height="110" src="/easyauction/resources/imagefile/${ image.bdImgName }"></a></td>
				 	</c:forEach>
				 	  <td width="1"></td>
				 	  <td align="left" style="padding-left:10px;"><b><a href="/easyauction/board/photoview.action?bdno=${ photo.bdNo }">${ photo.bdTitle }</a></b>[${ photo.bdReportingCount }]</td>
				 	  <td width="1"></td>
				 	  <td width="90" align="center">${ photo.bdWriter }</td>
				 	  <td width="1"></td>
				 	  <td width="90" align="center"><fmt:formatDate value="${ photo.bdDate }" pattern="yyyy-MM-dd" /></td>
				 	  <td width="1"></td>
				 	  <td align="center" width="40">${ photo.bdReportingCount }</td>
				 	</tr>
				    <tr>
						<td height="3" colspan="14" background="/easyauction/resources/images/bg_line_dot.gif"></td>
					</tr>
				 </table>
				 </c:if>
				 </c:forEach>
				 <div style="padding:3px;"></div>
				<table width="100%">
				<tr>
					<td align="right"><a href="/easyauction/board/photoregister.action"><img src="/easyauction/resources/images/write.png"></a></td>
				</tr>
				</table>
				 <table width="100%">
					<tr>
						<td height="25" align="center" valign="top" style="padding-top:3px;"><b>[페이지]</b></td>
					</tr>
				 </table>
				<%--  <div style="text-align:center">
				<c:choose>
				<c:when test="${ pager ne null }">		
				${pager}
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>	
				</div> --%>
				 
				<!-- 검색폼 // 시작 -->
				<table width="100%" align="center">
				<form  method='post' action='photoregister.action'>
				<input type=hidden name='num' value=''>
				<input type=hidden name='action' value='search'>
				<input type=hidden name='tb' value='board_review'>
				<tr>
					<td height='30' border='0' align='center' valign='middle'>
						<input type='radio' name='search' value='bbs_title' checked> 제목
						<input type='radio' name='search' value='bbs_name'> 이름
						<input type='radio' name='search' value='bbs_review'> 내용
						<input type='text' name='keyword' style="border:1px solid #DEDEDE; height:17px;">
						<input type='image' src='/easyauction/resources/images/bbs_search.gif' border="0" value='검색' align='absmiddle'>
				
					</td>
				</tr>
				</form>
				</table>
				<!-- 검색폼 // 끝 -->
			</div><!-- list 끝 -->
		</div>
	</div> <!-- A 끝 -->	
</body>
</html>