<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
<!-- 다음 주소관련 function 시작 -->
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("postcode1").value = data.postcode1;
						document.getElementById("postcode2").value = data.postcode2;
						document.getElementById("mbAddress1").value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("mbAddress2").focus();
					}
				}).open();
	}
	$(function(){
		$('#backmypage').click(function(){
			var mbId = '${ loginuser.mbId }';//''<-- 문자열로 받아야한다 안그러면 변수로 인식 에러뜸 is not defined
			location.href="/easyauction/admin/memberlist.action";
		})
		$('#modify').click(function(){
			$('#editform').submit();
		})
		$('#mbGrade').val('${member.mbGrade}');
	})
</script>
<!-- 다음 주소관련 function 끝 -->
</head>

<body>
	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
		<br />
		<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
<!-- 사이드메뉴 -->
		<div style="width:216px;float: left; margin:0 0 0 0;"><!-- 사이드메뉴 -->
			<c:import url="/WEB-INF/views/admin/sidemenu.jsp" />
		</div><!-- 사이드메뉴 끝 -->
<!-- 사이드메뉴 끝 -->
<table>
<div style="float: right;width: 76%">
	<div align="center" style='float: right;'>
		<tr>
			<td><img src="/easyauction/resources/images/member_out_banner.gif" align="absmiddle" border="0">

				<div style="padding: 5px;"></div>

							<form action="memberedit.action" method="post" id="editform">
				<table width="727px" align="center" cellpadding="0" cellspacing="1"
					bgcolor="#dcdcdc">
					<tr>
						<td bgcolor="#FFFFFF">

							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								align="center">
								<tr>
									<td style="padding-left: 5px;" height="20"><b>일반회원 정보수정</b></td>
								</tr>
							</table>

							<div style="padding: 5px;"></div> <!--구분-->



								<div style="width: 100%; border: 1px dashed #565dd3;">
									<div style="margin: 10px;">

										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											style="border-top: 1px solid #ededed;border-bottom: 1px solid #ededed;">
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">아이디</td>
												<td>
													<table border="0" cellpadding="0" cellspacing="0">
														<tr>
														 	<td>
														 		<input type="hidden" name="mbId" value="${ member.mbId }" />
															${ member.mbId }
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">패스워드</td>
												<td><input type="password" name='mbPasswd' id='mbPasswd'></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">패스워드
													확인</td>
												<td><input type="password" id='passwd1' /></td>

											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">이름</td>
												<td><input type="text" name="mbName"
													id="mbName" value="${ member.mbName }" /></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">성별</td>
												<td>
													<input type="radio" id="mbGender" name='mbGender' value='0' ${member.mbGender eq true ? "checked='checked'" : "" } >남자&nbsp; 
													<input type="radio" id="mbGender" name='mbGender' value='1' ${member.mbGender eq false ? "checked='checked'" : "" }>여자&nbsp;
												</td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">이메일</td>
												<td><input type='text' name='mbEmail' value="${ member.mbEmail }"></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">전화번호
												</td>
												<td><input type='text' name='mbPhone1' id='mbPhone1' value="${ member.mbPhone1 }"/></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">휴대폰</td>
												<td><input type='text' name='mbPhone2' id='mbPhone2' value="${ member.mbPhone2 }"/></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">생년월일</td>
												<td>
												<fmt:formatDate var="mbbd" type="date" pattern="yyyy-MM-dd" value="${ member.mbBirthDate }" />
												<input type='date' name='mbBirthDate' id='mbBirthDate' value="${ mbbd }"/>
												</td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif"
													align="absmiddle" border="0" style="margin: 0 10px 0 10px;">주소</td>
												<td><input type="text" id="postcode1" name="postcode1" style='width: 80px' readonly="readonly"> - 
													<input type="text" id="postcode2" name="postcode2" style='width: 80px' readonly="readonly">
													<input type="button" onclick="daumPostcode()" value="우편번호 찾기" style='height: 25px'><br> 
													<input type="text" id="mbAddress1" name="mbAddress1" placeholder="주소" style='width: 280px' readonly="readonly" value="${ member.mbAddress1 }"><br /> 
													<input type="text" id="mbAddress2" name="mbAddress2" placeholder="상세주소" style='width: 280px' value="${ member.mbAddress2 }">
													<span id="guide" style="color: #999"></span>
													
													<div style="padding: 5px;"></div>
													</td>
												
											</tr>
 											<tr>
											<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif"
													align="absmiddle" border="0" style="margin: 0 10px 0 10px;">등급</td>
											<td>
											  <select name="mbGrade" id="mbGrade">
											  	<option value='0'>블랙</option>
											  	<option value='1'>패밀리</option>
											  	<option value='6'>브론즈</option>
											  	<option value='16'>실버</option>
											  	<option value='31'>골드</option>
											  	<option value='51'>다이아몬드</option>
											  	<option value='71'>VIP</option>
											  	<option value='101'>P</option>
											  </select>
											</td>
											</tr>
										</table>
										<div style="padding: 5px;"></div>
								</div>
								</div>
								
						</td>
					</tr>
					<div style="padding: 5px;"></div>
				</table>
				</form>
				<div style="padding: 5px;"></div>
				<div align="center">
				<div style="padding: 5px;"></div>
				<img src="/easyauction/resources/images/btn_my_modify.gif" id="modify"/>
				<img src="/easyauction/resources/images/member_mod_backpage_btn.gif" id="backmypage"/>
		</div>
		<!-- 줄 -->
		
		<!-- 줄 -->
	</div>
</table>
</div>
<!-- 푸터  -->
<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
<div style="width: 960px;">
<!-- 푸터 끝 -->
</div>
</body>
</HTML>