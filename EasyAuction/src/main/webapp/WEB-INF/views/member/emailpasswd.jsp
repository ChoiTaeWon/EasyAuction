<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	if('${ locationurl }' == 'findPasswd'){
		var html = "<td width='60'>아이디</td><td><input name='mbId' id='target1' type='text' class='input_style1' tabindex='2' style='width:200px;'></td>"
		$('#target').append(html);
	}else if('${ locationurl }' == 'findmbId'){
		var html = "<td width='60'>비밀번호</td><td><input name='mbPasswd' id='target1' type='password' class='input_style1' tabindex='2' style='width:200px;'></td>"
			$('#target').append(html);
	}
	$("#formsubmit").click(function(event) {
		$.ajax({
			url : "/easyauction/ajax/membercheckbyemail.action?email=" + $("#email").val() + "&target1=" + $("#target1").val() + "&locationurl=" + '${ locationurl }',
			async : true,
			data : {},
			method : "GET",
			success : function(result, status, xhr) {
				if (result == 0){
					alert("입력하신 정보의 회원정보가 없습니다.");
				} else {
					$('#form').submit();
				}
				
			},
			error : function(xhr, status, ex) {
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

<div style="padding:40px;"></div>

<div align="center">
<table align="center" style="background-color:#565DD3; width:700px;">
<tr>
	<td style="padding:15px;"><a href="/easyauction/home.action"><img src="/easyauction/resources/images/mainlogo.png" border="0" align="absmiddle"></a></td>
</tr>
</table>

<table width="700" align="center" style="border:1px solid #DEDEDE;">
<tr>
	<td align="center">
	<div style="padding:20px;"></div>
	<!--폼시작-->
<FORM action="email.action" id='form' method="post">
<table align="center" cellpadding="0" cellspacing="1" width="560" bgcolor="#ebebeb">

<input type="hidden" name="locationurl" value="${ locationurl }" />

<tr>
	<td bgcolor="#f7f7f7" style="padding:20px;" align="center">

		<table>
		<tr>
			<td>

				<table align="center" width="100%">
				<tr>
					<td width="60">Email 주소</td>
					<td>
					<input name="email" id='email' type="text" class="input_style1" tabindex="1" style="width:200px;">
					</td>
				</tr>
				<tr><td height="3"></td></tr>
				<tr id="target">
					
				</tr>
				</table>

			</td>
		</tr>
		<tr>
			<br /><br /><br />
			<td colspan="2" style="padding-left:10px;" align="center">
			<br /><br /><br />
			<input width="100" type="image" id="formsubmit" src="/easyauction/resources/images/btn_findpassorid.png">
			</td>
		</tr>
		</table>


		<div style="padding:10px;"></div>

	</td>
</tr>
</table>
		</form>
<div style="padding:20px;"></div>

</td>
</tr>
</table>

<div style="padding:5px;"></div>

<table width="700" align="center">
<tr>
	<td align="center" class="smfont5">사이트에 등록된 내용은 판매자가 등록한 것으로 EasyAuction은 등록내용에 대하여 일체의 책임을 지지 않습니다.</font></td>
</tr>
<tr>
	<td align="center" class="smfont5">Copyright ⓒ 2015 EasyAuction All rights reserved</td>
</tr>
</table>
</div>
</body>
</HTML>
