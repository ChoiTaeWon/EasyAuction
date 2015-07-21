<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
<!-- 다음 주소관련 function 시작 -->
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
						document.getElementById("address1").value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("address2").focus();
					}
				}).open();
	}
</script>
<!-- 다음 주소관련 function 끝 -->
</head>

<body>
<table>
	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
		<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
		<!-- 사이드메뉴 헤더 -->
<div style='float: left;'>
<table style="border-collapse: collapse; width: 216px;">
	<tr>
		<td><a href="#" onFocus="this.blur();"><img src="/easyauction/resources/images/tit_community.gif" title="마이페이지"></a></td>
	</tr>
</table><!-- 사이드메뉴헤더끝 -->
<table style="border:1px solid #DEDEDE; border-collapse: collapse; background-color:#F8F8F8;" width="216"><!-- 사이드메뉴 몸통 -->
	<tr>
		<td>
		  <table cellspacing='0' cellpadding='0' border='0' width='100%'>
		   <tr>
		    <td>
		     <table width='100%'>
		      <tr>
		       <td style="padding-top: 10px">
		        <img src="/easyauction/resources/images/ico_dot_02.gif" style="margin:0 10px 0 20px;">
		         <a href="#" onFocus="this.blur();">
		           <b><a href="/easyauction/member/view.action" class="bbs_menu_name">내 정보 수정</b>
		         </a>
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
<!-- 사이드 메뉴 -->
	<div align="center" style='float: right;'>
		<tr>
			<td><img
				src="/easyauction/resources/images/member_out_banner.gif" align="absmiddle" border="0">

				<div style="padding: 5px;"></div>

				<table width="727px" align="center" cellpadding="0" cellspacing="1"
					bgcolor="#dcdcdc">
					<tr>
						<td bgcolor="#FFFFFF">

							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								align="center">
								<tr>
									<td style="padding-left: 5px;" height="20"
										background="color: white"><b>일반회원 정보수정</b></td>
								</tr>
							</table>

							<div style="padding: 5px;"></div> <!--구분-->


							<form action="view.action" method="post" name="member_register" modelAttribute="member">

								<div style="width: 100%; border: 1px dashed #565dd3;">
									<div style="margin: 10px;">

										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											style="border-top: 1px solid #ededed;">
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">아이디</td>
												<td>
													<table border="0" cellpadding="0" cellspacing="0">
														<tr>
															이엘 아이디값
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">패스워드</td>
												<td><input type='passwd' name='passwd' id='passwd'></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">패스워드
													확인</td>
												<td><input type="passwd" id='passwd1' /></td>

											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">이름</td>
												<td><input type="text" name="memberName"
													id="memberName" /></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">성별</td>
												<td><input type=radio id=genderm name='gender'
													value='1' checked="checked">남자&nbsp; <input
													type=radio id=genderf name='gender' value='0'>여자
													&nbsp;</td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">이메일</td>
												<td><input type='text' name='memberEmail'></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">전화번호
												</td>
												<td><input type='text' name='phone1' id='phone1' /></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">휴대폰</td>
												<td><input type='text' name='phone2' id='phone2' /></td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif">생년월일</td>
												<td><input type='date' name='birthdate' id='birthdate' />
												</td>
											</tr>
											<tr>
												<td class="smfont4"><img src="/easyauction/resources/images/member_nemo_icon.gif"
													align="absmiddle" border="0" style="margin: 0 10px 0 10px;">주소</td>
												<td><input type="text" id="postcode1" name="postcode1"
													style='width: 80px'> - <input type="text"
													id="postcode2" name="postcode2" style='width: 80px'>
													<input type="button" onclick="daumPostcode()"
													value="우편번호 찾기" style='height: 25px'><br> <input
													type="text" id="address1" name="memberAddress1"
													placeholder="주소" style='width: 280px'><br /> <input
													type="text" id="address2" name="memberAddress2"
													placeholder="상세주소" style='width: 280px'><span id="guide" style="color: #999"></span></td>
											</tr>
										</table>
						</td>
					</tr>
				</table>
				<div align="center">
				<img src="/easyauction/resources/images/btn_my_modify.gif" onclick="javascript:updateMember();" /><img src="/easyauction/resources/images/member_mod_backpage_btn.gif" onclick="#" />
		</div>
	</div>
</table>
</body>
</HTML>