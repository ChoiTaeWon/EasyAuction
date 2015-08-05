<%@page import="com.easyauction.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>자유게시판</title>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css" />
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css" />
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="/easyauction/resources/js/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$('#searchboard').click(function() {
			var search = document.getElementById('search').value;
			var searchdata = document.getElementById('searchdata').value;
			var re = /^[0-9]+$/;
			if (search == 'bdtitle' && !re.test(searchdata)) {
				alert("제목을 입력하세요");
				searchdata.focus();
				return;

			} else if (searchdata.length == 0) {
				alert("내용을 입력하세요");
				searchdata.focus();
				return;
			}
			//document.getElementById('listsearch').innerHTML = html;
			//$('#listsearch').append(html);
			document.getElementById('listsearch').submit();
			event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
		})
		///////////////////////////////////회원신고및 쪽지보내기기능///////////////////////////////////
		var mbhtml = 
			"<div id='reportmbContent' title='회원 신고하기' style='display: none;width: 300px;height: 250px'>"
				+ "<label for='reportermbId'>신고자</label><br />"
				+ "<input style='width: 500px' id='reportermbId' type='text' value='' readonly='readonly'/><br />"
				+ "<label for='targetmbId'>신고할 회원</label><br />"
				+ "<input style='width: 500px' id='targetmbId' type='text' value='' readonly='readonly' /><br />"
				+ "<label for='reportmbText'>신고 사유</label></br>"
				+ "<textarea id='reportmbText' style='width: 500px' rows='3' cols='48'></textarea></div>"

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
							if(receiver == 'admin'){
								alert('관리자는 신고가 불가능합니다.')
								return;
							}
							if (targetaction == 'sendmessage') {
								window.open(
										"/easyauction/message/sendmessage.action?mbId="
												+ mbId + "&receiver="
												+ receiver, "쪽지함",
										"width=700,height=500,titlebar=no");
							} else {
								$('#reportermbId').attr('value', mbId);
								$('#targetmbId').attr('value', receiver);
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

								event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
								event.stopPropagation();//버블링 업 막아줌
							}
							event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
							event.stopPropagation();//버블링 업 막아줌
						})
		///////////////////////////////////회원신고및 쪽지보내기기능///////////////////////////////////
	})
</script>
</head>
<table id="dialogspot">
</table>

<body>
	<div id="wrap">
		<!-- A 시작 -->
		<div id="top">
			<!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<!-- 헤더 끝 -->
		<br />
		<br />
		<div style="width: 960px;">
			<!-- 헤더밑 부분 margin:0 auto;-->


			<div style="width: 216px; float: left; margin: 0 10px 0 0;">
				<!-- 사이드메뉴 -->
				<c:import url="/WEB-INF/views/board/sidemenu.jsp" />
			</div>
			<!-- 사이드메뉴 끝 -->

			<div style="width: 730px; float: right;">
				<!-- list -->

				<!--리스트 위의 맨위 이미지-->
				<div id="contents_wrap">

					<table cellpadding="0" cellspacing="0" border="0" width="730" height="96" >
						<tr>
							<td style="padding-left: 25px;"><img
								src="/easyauction/resources/images/freeboardmain.png"></td>
						</tr>
					</table>

					<div style="padding: 5px;"></div>

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
										<td align="center" class="smfont" width="90"><font
											color="#666666">작성자</font></td>
										<td width="1" bgcolor="#e6e6e6"></td>
										<td align="center" class="smfont" width="90"><font
											color="#666666">작성일자</font></td>
										<td width="1" bgcolor="#e6e6e회"></td>
										<td align="center" class="smfont" width="40"><font
											color="#666666">조회</font></td>
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
												<c:choose>
													<c:when test="${board.bdBlindCheck eq false}">
														<tr>
															<td align="center" style="padding-left: 10px;"><b><a
																	href="/easyauction/board/freeboardview.action?bdno=${ board.bdNo }&pageno=${pageno}&bdWriter=${ board.bdWriter }">${ board.bdTitle }</a></b>[${ board.commentCount }]</td>
															<td width="1"></td>
															<td class="smfont" align="center" width="90"><div
																	style="padding-left: 10px;">
																	<!-- sdfhasdkjhfjksadlfjkshad -->
											<div class="dropDown">
											<a href="#" class="btn_drop">${board.bdWriter}</a>
												<div class="dropBox">
													<ul>
														<li class="dropselect" id='${board.bdWriter}/sendmessage'>쪽지보내기</li>
														<li class="dropselect" id='${board.bdWriter}/reporting'>신고하기</li>
													</ul>
												</div>
											</div> 
											<!-- sdfhasdkjhfjksadlfjkshad -->
																	</div></td>
															<td width="1"></td>
															<td class="smfont" align="center" width="90"><div
																	style="padding-left: 10px;">${board.bdDate }</div>
															<td width="1"></td>
															<td class="smfont" align="center" width="40"><div
																	style="padding-left: 10px;">${board.bdReadCount}</div></td>
															<td width="1"></td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td align="center">블라인드 처리 되었습니다.</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<td class="smfont" align="center" width="40"><div
													style="padding-left: 10px;">등록된 게시글이 없습니다.</div></td>
										</c:otherwise>
									</c:choose>
									<tr>
										<td height="1" colspan="11" bgcolor="#e6e6e6"></td>
									</tr>
								</table> <!-- 게시글 내용 끝 --> <!-- 검색폼 위의 내용 시작 -->
								<div style="padding: 3px;"></div> <!-- 리스트 아래 글쓰기와 목록 -->
								<table width="100%">
									<tr>
										<td align="right"><a
											href="/easyauction/board/freeboardregister.action"> <img
												src="/easyauction/resources/images/write.png"></a>&nbsp; <a
											href='/easyauction/board/freeboard.action'> <img
												src="/easyauction/resources/images/list1.png"></a></td>
									</tr>
								</table> <!-- 검색폼 위의 내용 끝 --> <!-- 페이지 번호 -->
								<div style="text-align: center">
									<c:choose>
										<c:when test="${ pager ne null }">		
										${pager}
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</div> <!-- 검색폼 // 시작 -->
								<form id="listsearch" action="freeboard.action" method="get">
									<table align="center">
										<td height='30' border='0' align='center' valign='middle'>
											<input type='radio' id="search" name='search' value='bdTitle'
											checked> 제목 <input type='radio' id="search"
											name='search' value='bdWriter'> 작성자 <input
											style='width: 135px; height: 18px' type="text"
											name="searchdata" id="searchdata" /> <!-- <input type="button" value='검색' style='height: 25px;margin-right:600px; ' onclick="listsearch();" /> -->
										<td align="left"><img
											src="/easyauction/resources/images/search1.png"
											id="searchboard"></a></td>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</div>
				<!-- 검색폼 끝 -->

			</div>
			<!-- list 끝 -->
		</div>
	</div>
	<!-- A 끝 -->
</body>



</html>
