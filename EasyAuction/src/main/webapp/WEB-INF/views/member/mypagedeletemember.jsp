<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" type="text/css"
	href="/easyauction/resources/styles/style.css" />
<link rel="Stylesheet" type="text/css"
	href="/easyauction/resources/styles/body-style.css" />
<link rel="Stylesheet" type="text/css"
	href="/easyauction/resources/styles/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
//jQuery 로, 모든 엔터 입력시 무시하게 하는 코드
$(document).ready(function(){
  $(document).keypress(function(e){
    if(e.keyCode==13) return false;
  });
});
</script>
<script type="text/javascript">
$(function(){
	$('#formsubmit').click(function(){
		var mbId = '${ mbId }';
		var mbPasswd = $('#mbPasswd').val();
		$.ajax({
			url : "/easyauction/ajax/memberchecktoidandpasswd.action",
			async : false,
			type : "GET",
			data : {
				mbId : mbId,
				mbPasswd : mbPasswd
			},
			success : function(result){
				if(result == 0){
					alert("비밀번호가 다릅니다.");
					return;
				}else{
					
					$('#form').submit();
				}
			
			},
			error : function (){
				alert("에러.");
				alert(status+ex);
			}
			
		})
		event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
		event.stopPropagation();//버블링 업 막아줌
	})
});
</script>
</head>
<body>
	<div id="wrap">
		<!-- A 시작 -->
		<div id="top">
			<!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<!-- 헤더 끝 -->
		<br />
		<div style="width: 960px;"></div>
	<!-- 헤더밑 부분 margin:0 auto;-->
	<!-- 사이드메뉴 -->
	<c:import url="/WEB-INF/views/member/sidemenu.jsp" />
	<!-- 사이드메뉴 끝 -->
	<div style="float: right; width: 76%">
		<div style="padding: 10px;"></div>
		<table align="center" style="background-color: #565DD3; width: 700px;">
			<tr>
				<td style="padding: 15px;"><a href="/easyauction/home.action"><img
						src="/easyauction/resources/images/mainlogo.png" border="0"
						align="absmiddle"></a></td>
			</tr>
		</table>

		<table width="700" align="center" style="border: 1px solid #DEDEDE;">
			<tr>
				<td align="center">
					<div style="padding: 20px;"></div> <!--폼시작-->
					<FORM action="deletemember.action" id='form' method="post">
						<table align="center" cellpadding="0" cellspacing="1" width="560"
							bgcolor="#ebebeb">

							<input type="hidden" name="mbId" id='mbId' value="${ mbId }" />
							<tr>
								<td bgcolor="#f7f7f7" style="padding: 20px;" align="center">

									<table>
										<tr>
											<td align="center">
											<b>비밀번호를 입력하세요</b>
												<table align="center" width="100%">
													<tr>
														<td><input name="mbPasswd" id='mbPasswd' type="password"
															class="input_style1" tabindex="1" style="width: 200px;">
														</td>
													</tr>
													<tr>
														<td height="3"></td>
													</tr>
													<tr id="target">

													</tr>
												</table>

											</td>
										</tr>
										<tr>
											<br />
											<br />
											<br />
											<td colspan="2" style="padding-left: 10px;" align="center">
												<br />
											<br />
											<br /><img width="100" src="/easyauction/resources/images/btn_delmember.png" id="formsubmit">
											</td>
										</tr>
									</table>


									<div style="padding: 10px;"></div>

								</td>
							</tr>
						</table>
					</form>
					<div style="padding: 20px;"></div>

				</td>
			</tr>
		</table>

		<div style="padding: 5px;"></div>

		<table width="700" align="center">
			<tr>
				<td align="center" class="smfont5">
				회원의 비밀번호를 입력하시면 회원정보가 지워지고 지워진 정보는 복구할 수 없습니다.
				<br />
				또한 동일한 아이디로 가입이 불가합니다.
				</td>
			</tr>

		</table>




	</div>
	<!-- 푸터  -->
	<div id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</div>
	<div style="width: 960px;"></div>
	<!-- 푸터 끝 -->
</div>
</body>
</HTML>
