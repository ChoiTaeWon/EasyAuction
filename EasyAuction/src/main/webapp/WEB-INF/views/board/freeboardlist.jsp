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
			<div style="width:216px;float: left; margin:0 10px 0 0;"><!-- 사이드메뉴 -->
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
			</table>
			
			<table width="100%">
				<tr>
					<td height="1" bgcolor="#e6e6e6"></td>
				</tr>
				<tr>
					<td height="26" bgcolor="#f8f8f8">
					
						<table width="100%">
						<!-- 추천빼기 -->
							<tr>
								<td align="center" class="smfont" width="50"><font color="#666666">번호</font></td>
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
			<!--내용 끝-->
			
			<!-- 게시글 내용 시작 -->
			<table width="100%">
			<tr>
				<td>
				<table width=100% cellpadding=0 cellspacing=0  border=0><td valign=top align=center>
			<table width="100%" height="30">
				<tr>
					<td align="center" width="50" class="smfont"><img src="/easyauction/resources/images/gongji.png" align="absmiddle"></td>
					<td width="1"></td>
					<td class="smfont" align="left"><div style="padding-left:10px;"><a href='/easyauction/board/freeboardview.action'><img src="/easyauction/resources/images/new.png" align=absmiddle border=0> 안녕하세요 자유게시판 공지사항입니다.</a></div></td>
					<td width="1"></td>
					<td width="90" class="smfont" align="center"><font color="#7f7b73">
				<a href='#1' onClick="messageShowUser('0')" style='padding-bottom:6px;'>test</a>
				<span style='position:relative;'>
					<div style='position:absolute;top:0px;left:0px;width:110px;border:1px solid #000000;display:none;' id='board_view_0'>
						<table cellpadding='2' cellspacing='0' onClick="messageShowUser('0')">
						<tr>
							<td width='110' bgcolor='#D9D9D9' align='left'>
								<table cellpadding='2' cellspacing='1' width='100%' bgcolor='#CACACA'>
								<tr>
									<td bgcolor='white'>
										<table cellpadding='2' cellspacing='0' width='100%'>
										<tr>
											<td height='25'><a href='#1' onClick="window.open('happy_message.php?mode=send&receiveid=test','happy_message_send','width=700,height=400,toolbar=no,scrollbars=no')"><img align='absmiddle' src='img/message/icon_messicon.gif' width='15' height='12' border='0'><img src='img/binimg.gif' width='5' height='1' border='0'>쪽지보내기</a></td>
										</tr>
										<tr>
											<td height='25'><a href='list.php?action=search&search_type=id&search_word=test'><img align='absmiddle' src='img/message/icon_messregi.gif' width='16' height='16' border='0'><img src='img/binimg.gif' width='4' height='1' border='0'>등록매물보기</a>
											</td>
										</tr>
										</table>
									</td>
								</tr>
								</table>
							</td>
						</tr>
						</table>
					</div>
				</span>
				</font></td>
					<td width="1"></td>
					<td align="center" width="90" class="smfont">2014-04-02</td>
					<td width="1"></td>
					<td align="center" width="40" class="smfont">1</td>
				</tr>
				<tr>
					<td height="1" colspan="11" bgcolor="#e6e6e6"></td>
				</tr>
			</table>
			<!-- 게시글 내용 끝 -->
			
			<!-- 검색폼 위의 내용 시작 -->
			<div style="padding:3px;"></div>

			<table width="100%">
			<tr>
				<td align="right"><a href="/easyauction/board/freeboardregister.action"><img src="/easyauction/resources/images/write.png"></a>&nbsp;<a href='/easyauction/board/freeboard.action'><img src="/easyauction/resources/images/list1.png"></A></td>
			</tr>
			</table>
			
			<table width="100%">
			<tr>
				<td height="25" align="center" valign="top" style="padding-top:3px;"><b>[1]</b></td>
			</tr>
			</table>
			<!-- 검색폼 위의 내용 끝 -->
			
			<!-- 검색폼 // 시작 -->
			<table width="56%" align="center">
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
					<!-- <input type='image' src='/easyauction/resources/images/search.png' border="0" value='검색' align='absmiddle'> -->
					<td align="left"><a href="/easyauction/board/register.action"><img src="/easyauction/resources/images/search1.png"></a>
				</td>
			</tr>
			</form>
			</table>
			<!-- 검색폼 끝 -->
			
			</div><!-- list 끝 -->
		</div>
	</div> <!-- A 끝 -->
	<%-- <div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
	</div> --%>
</body>

</html>
