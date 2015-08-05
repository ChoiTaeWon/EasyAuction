<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>포토 후기 게시판</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script src="/easyauction/resources/js/jquery-ui.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		///////////////////////////////////회원신고및 쪽지보내기기능///////////////////////////////////
		var mbhtml = "<div id='reportmbContent' title='회원 신고하기' style='display: none;width: 300px;height: 250px'>"
				+ "<label for='reportermbId'>신고자</label><br />"
				+ "<input id='reportermbId' type='text' value='' readonly='readonly'/><br />"
				+ "<label for='targetmbId'>신고할 회원</label><br />"
				+ "<input id='targetmbId' type='text' value='' readonly='readonly' /><br />"
				+ "<label for='reportmbText'>신고 사유</label></br>"
				+ "<textarea id='reportmbText' rows='3' cols='48'></textarea></div>"

		$('#dialogspot').append(mbhtml);

		//신고하기 dialog 생성
		var reportmbDialog = $('#reportmbContent').dialog({
			autoOpen : false,
			width : 550,
			height : 400,
			modal : true,
			buttons : {
				신고하기 : doReportMember,
				취소 : function() {
					reportmbDialog.dialog("close");
				}
			},
			close : function() {

			}
		});
		/////////////////////////////////////////////////////////////////////////////////
		//신고 요청 처리
		function doReportMember() {

			$.ajax({
				url : "/easyauction/ajax/memberReporting.action",
				async : false,
				type : "GET",
				data : {
					reporter : $("#reportermbId").val(),
					targetmbId : $("#targetmbId").val(),
					reportText : $("#reportmbText").val()

				},
				success : function(result) {
					alert(result + ' : result 값');

					if (result == 0) {
						alert("회원이 신고 되었습니다.");
						reportmbDialog.dialog('close');
					} else {
						alert('회원 신고 실패');
					}

				},
				error : function() {
					alert('게시글 신고 실패 + 걍 아예 에러임 ');
				}
			});

		}
		$(".btn_drop").click(function() {
			$(this).next().toggleClass("on");
			return false;
		});
		$('.dropselect')
				.click(
						function() {
							var strArray = $(this).attr('id').split('/');
							var targetaction = strArray[1];
							var receiver = strArray[0];
							var mbId = '${ loginuser.mbId }';
							if (targetaction == 'sendmessage') {
								window.open(
										"/easyauction/message/sendmessage.action?mbId="
												+ mbId + "&receiver="
												+ receiver, "쪽지함",
										"width=700,height=500,titlebar=no");
							} else {
								$('#reportermbId').attr('value', mbId);
								$('#targetmbId').attr('value', receiver);
							if(receiver == 'admin'){
								alert("관리자는 신고할 수 없습니다. ");
								return;
								//신고하기 버튼 클릭 시 신고이력 확인 절차	
								if (mbId != receiver) {
									$
											.ajax({
												url : "/easyauction/ajax/memberRepoterCheck.action",
												async : false,
												type : "GET",
												data : {
													mbId : mbId,
													receiver : receiver
												},
												success : function(result) {
													if (result == 0) {
														alert("신고 가능 상태");
														reportmbDialog
																.dialog("open");
													} else {
														alert("신고 이력이 있습니다 이미 신고했던 회원입니다.");
													}
												},
												error : function() {
													alert("신고 가능 상태 확인 에러.");
												}
											});
								} else {
									alert("자신을 신고할 수는 없습니다. ");
								}
							}

								event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
								event.stopPropagation();//버블링 업 막아줌
							}
							event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
							event.stopPropagation();//버블링 업 막아줌
						})
		///////////////////////////////////회원신고및 쪽지보내기기능///////////////////////////////////
	})
</script>
<body>
<!-- 다이얼로그 table삽입공간 -->
<table id="dialogspot">
</table>
<!-- 다이얼로그 table삽입공간 -->
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
				
				<!-- <table width="100%">
				<tr height="30">
					<td align="left">&nbsp;</td>
					<td align="right"><a href='#'><img src='/easyauction/resources/images/ico_home.gif'></a> <a href=bbs_list.php?&num=&tb=board_review>포토리뷰</a> </td>
				</tr>
				</table> -->
				
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
				 <c:choose>
				<c:when test="${ photos ne null && fn:length(photos) > 0 }">
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
				 	  <td width="90" align="center">
				 	  <!-- 쪽지보내기및회원신고기능 -->
							<div class="dropDown">
							<a href="#" class="btn_drop">${ photo.bdWriter }</a>
								<div class="dropBox">
									<ul>
										<li class="dropselect" id='${ photo.bdWriter }/sendmessage'>쪽지보내기</li>
										<li class="dropselect" id='${ photo.bdWriter }/reporting'>신고하기</li>
									</ul>
								</div>
							</div> 
						<!--  쪽지보내기및회원신고기능 --> 
				 	  </td>
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
				 </c:when>
				<c:otherwise>
				<td class="smfont" align="center" width="40"><div style="padding-left:10px;">등록된 게시글이 없습니다.</div></td>
				</c:otherwise>
				</c:choose>
				 <div style="padding:3px;"></div>
				<table width="100%">
				<tr>
					<td align="right"><a href="/easyauction/board/photoregister.action"><img src="/easyauction/resources/images/write.png"></a></td>
				</tr>
				</table>
				 <!-- <table width="100%">
					<tr>
						<td height="25" align="center" valign="top" style="padding-top:3px;"><b>[페이지]</b></td>
					</tr>
				 </table> -->
				<div style="text-align:center">
				<c:choose>
				<c:when test="${ pager ne null }">		
				${pager}
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>	
				</div>
				 
				<!-- 검색폼 // 시작 -->
				<table width="100%" align="center">
				<form  method='post' action='photoregister.action'>
				<input type=hidden name='num' value=''>
				<input type=hidden name='action' value='search'>
				<input type=hidden name='tb' value='board_review'>
				<!-- <tr>
					<td height='30' border='0' align='center' valign='middle'>
						<input type='radio' name='search' value='bbs_title' checked> 제목
						<input type='radio' name='search' value='bbs_name'> 이름
						<input type='radio' name='search' value='bbs_review'> 내용
						<input type='text' name='keyword' style="border:1px solid #DEDEDE; height:17px;">
						<input type='image' src='/easyauction/resources/images/bbs_search.gif' border="0" value='검색' align='absmiddle'>
				
					</td>
				</tr> -->
				</form>
				</table>
				<!-- 검색폼 // 끝 -->
			</div><!-- list 끝 -->
		</div>
	</div> <!-- A 끝 -->	
</body>
</html>