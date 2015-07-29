<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	if(${ locationurl } == 'findPasswd'){
		$("#span1").text('아이디');
		$("#span2").text('이메일');
		
	} else if(${ locationurl } == 'findmbId'){
		$("#span1").text('이메일');
		$("#span2").text('비밀번호');
		$("#target2").attr('type', 'password');
		
		
	}
})
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
	
<table align="center" cellpadding="0" cellspacing="1" width="560" bgcolor="#ebebeb">
<!--폼시작-->
<FORM action="email.action" id='formsubmit' method="post">
<tr>
	<td bgcolor="#f7f7f7" style="padding:20px;" align="center">

		<table>
		<tr>
			<td>

				<table align="center" width="100%">
				<tr>
					<td width="100"><span id="span1"></span></td>
					<td>
					<input name="target1" type="text" class="input_style1" tabindex="1" style="width:130px;">
					</td>
				</tr>
				<tr><td height="3"></td></tr>
				<tr>
					<td width="100"><span id="span2"></span></td>
					<td>
					<input name="target2" id="target2" type="text" class="input_style1" tabindex="2" style="width:130px;">
					</td>
				</tr>
				</table>

			</td>
			<td style="padding-left:10px;"><input type="image" name="formimage1" src="/easyauction/resources/images/btn_login02.gif" onclick="document.getElementById('formsubmit').submit();" align="absmiddle" border="0" tabindex="3"></td>
		</tr>
		<tr>
			<td colspan="2">
			</td>
		</tr>
		</form>
		</table>


		<div style="padding:10px;"></div>

	</td>
</tr>
</table>

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
