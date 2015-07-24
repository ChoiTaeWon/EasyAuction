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
				
				<table width="100%">
					<tr>
						<td height="1" bgcolor="#e6e6e6"></td>
					</tr>
					<tr>
						<td height="26" bgcolor="#f8f8f8">
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
				 <div style="padding:3px;"></div>
				 <table width="100%">
				 	<tr height="26">
				 	  <td align="left" style="padding-left:10px;"><b>${ view.bdTitle }</b></td>
				 	  <td width="1"></td>
				 	  <td width="90" align="center">${ view.bdWriter }</td>
				 	  <td width="1"></td>
				 	  <td width="90" align="center">${ view.bdDate }</td>
				 	  <td width="1"></td>
				 	  <td align="center" width="40">${ view.bdReportingCount }</td>
				 	</tr>
				    <tr>
						<td height="3" colspan="14" background="/easyauction/resources/images/bg_line_dot.gif"></td>
					</tr>
					<tr>
						<td style="padding:15 0 20 0;">
						<div  id="ct" class="WYS" align="justify" style="font-size:12px; line-height:21px; border:0px solid red; word-break:break-all;">
							<div style="border-bottom: red 0px solid; border-left: red 0px solid; line-height: 1.6; font-size: 14px; word-break: break-all; border-top: red 0px solid; border-right: red 0px solid" id="ct" align="justify"><br />
							<table>
								<tr>
								 <c:forEach var="images" items="${ view.boardImage }">
								  <td><img src="/easyauction/resources/imagefile/${ images.bdImgName }"><br /></td>
								 </c:forEach>
								</tr>
								<tr>
								  <td>${ view.bdContent }</td>
								</tr>
							</table>
							</div>
						</div>
						</td>
					</tr>
				 </table>
				 <div style="padding:3px;"></div>
				<!-- 댓글 // 시작 -->
				<table width="100%" border="0">
					<tr>
						<td height="2px" bgcolor="#EBEBEB"></td>
					</tr>
					<tr>
						<td height="20px" align="left" style="background-color:#F4F4F4;"><font color="">&nbsp;&nbsp;<img src="/easyauction/resources/images/ico_arrow_01.gif" width="9px" height="9px" border="0" align="absmiddle">&nbsp;&nbsp;comment</b></font></td>
					</tr>
					<tr>
						<td height="2px"  bgcolor="#EBEBEB"></td>
					</tr>
				</table>
				<c:forEach var="comment" items="${ view.comments }">
				<table border='0' width='100%' cellspacing='0' cellpadding='0'>
					<tr>
						<td width='140' style='padding-top:10px;padding-bottom:10px;'><img src='bbs_img/bbs_reply_manicon.gif' border='0' align='absmiddle'> <b>${ comment.bcWriter }</b></td>
						<td width='600' align='left'>${ comment.bcContent }&nbsp;&nbsp;<font color='#cacaca' style='font-size:11px;'>${ comment.bcRegdate }</font>
						<!-- 수정할 곳 -->
						<%-- <td width='40'><img src="/easyauction/resources/images/sujung"></td> <b>${ comment.bdNo }</b></td>
						<td width='40'><img src="/easyauction/resources/images/delete"></td> <b>${ comment.bdNo }</b></td> --%>
						
						<!-- <tr>
							<td style="padding-left:25px;"><img src="/easyauction/resources/images/sujung.png"></td>
						
							<td style="padding-left:25px;"><img src="/easyauction/resources/images/delete.png"></td>
						</tr> -->
						
						</td>
						<td width='50'></td>
					</tr>
					<tr>
						<td colspan="3" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
					</tr>
				</table>
				</c:forEach>
				<form action='freeboardcomment.action?bdno=${ view.bdNo }' method='post'>
					<input type="hidden" value="${ view.bdWriter }" name="writer" >
					<table border='0' width='100%' cellspacing='0' cellpadding='0'>
						<tr>
							<td><textarea style='width:95%' rows=4 name=content style='font-size:12px; height:35;'></textarea></td>
							<td align=right  width=80><input type=image src=/easyauction/resources/images/memo_add.gif onclick="document.forms[0].submit();"></td>
						</tr>
						
						  <!-- <td>
						  <input type="button" value="수정" style='height:25px;' onclick="location.href='updatefreeboardcomment.action';"/>
						  <input type="button" value="삭제" style='height:25px;' onclick="location.href='deletedfreeboardcomment.action';"/>
						  </td> -->
						
					</table>
				</form>
				<!-- 댓글 // 끝 -->
			</div><!-- list 끝 -->
		</div>
	</div> <!-- A 끝 -->	
</body>
</html>