<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
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
<!-- 푸터  -->
<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
<div style="width: 960px; ">
<!-- 푸터 끝 -->
</body>
</HTML>