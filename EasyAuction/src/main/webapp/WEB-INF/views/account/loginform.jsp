<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
<script language="javascript" src="js/happy_open.js" type="text/javascript"></script>
</head>

<body>

<div style="padding:40px;"></div>

<div align="center">
<table align="center" style="background-color:#565DD3; width:700px;">
<tr>
	<!-- -->
	<td style="padding:15px;"><a href="홈액션"><img src="/easyauction/resources/images/mainlogo.png" border="0" align="absmiddle"></a></td>
	
</tr>
</table>
<table width="700" align="center" style="border:1px solid #DEDEDE;">
<tr>
	<td align="center"><SCRIPT language="JavaScript">

	function CheckForm(theForm)
	{
		var name_title	= new Array("회원아이디를", "회원비밀번호를");
		var name_name	= new Array("member_id", "member_pass");

		for(var i in name_name)
		{
			if (document.getElementById(name_name[i]).value == "")
			{
				alert(name_title[i] + " 입력하세요.");
				document.getElementById(name_name[i]).focus();
				return (false);
			}
		}
	}

	function happy_member_autologin()
	{
		if (document.happy_member_login_form.save_login.checked==true)
		{
			var check;
			check = confirm("\n아이디저장 기능을 사용하시겠습니까?\n\n아이디가 저장되므로 유의하세요  \n\n공공장소에서 사용시 주의요망 ^^");
			if(check==false)
			{
				document.happy_member_login_form.save_login.checked=false;
				document.happy_member_login_form.save_id.value = 'n';
			}
			else
			{
				document.happy_member_login_form.save_id.value = 'y';
			}
		}
		else
		{
			document.happy_member_login_form.save_id.value = 'n';
		}
	}

	function happy_member_auto_login_use()
	{
		if ( document.happy_member_login_form.auto_login_use.checked == true )
		{
			var check;
			check = confirm("자동로그인 기능을 사용 하시겠습니까?\n\n자동로그인를 하시는 경우 별도의 로그오프를 하지 않는 이상 로그인이 유지 됩니다.  \n\n공공장소에서 사용시 주의요망 ^^");
			if( check == false )
			{
				document.happy_member_login_form.auto_login_use.checked = false;
			}
		}
		else
		{
			document.happy_member_login_form.auto_login_use.checked = false;
		}
	}
</SCRIPT>
<div style="padding:15px;"></div>

<table align="center" width="560">
<tr>
	<td><img src="/easyauction/resources/images/member_login_tit.gif"></td>
	<td class="smfont" valign="bottom" align="right">로그인하시면 경매사이트의 각종 서비스를 이용하실 수 있습니다.</td>
</tr>
</table>

<div style="padding:5px;"></div>

<table align="center" cellpadding="0" cellspacing="1" width="560" bgcolor="#ebebeb">

<!--폼시작-->
<FORM action="login.action" id='formsubmit' method="post">
<input type="hidden" name="returnUrl" value="">
<input type='hidden' name='save_id' value="" />
<!--히든값 삭제하지말것! -->

<tr>
	<td bgcolor="#f7f7f7" style="padding:20px;" align="center">

		<table>
		<tr>
			<td>

				<table align="center" width="100%">
				<tr>
					<td width="100">아이디</td>
					<td><input name="bmId" value="" type="text" class="input_style1" id="id" tabindex="1" style="width:130px;"></td>
				</tr>
				<tr><td height="3"></td></tr>
				<tr>
					<td width="100">패스워드</td>
					<td><input name="passwd" value="" type="password" class="input_style1" id="pass" tabindex="2" style="width:130px;"></td>
				</tr>
				</table>

			</td>
			<td style="padding-left:10px;"><input type="image" name="formimage1" src="/easyauction/resources/images/btn_login02.gif" onclick="document.getElementById('formsubmit').submit();" align="absmiddle" border="0" tabindex="3"></td>
		</tr>
		<tr>
			<td colspan="2">

				<table border='0' style="margin-top:10px; margin-left:8px;">
				<tr>
					<td class="smfont" align="left">
						<input type="checkbox" name="save" onclick="happy_member_autologin()" id="save_login" value=""  title="아이디저장" TabIndex="3" style="vertical-align:middle; margin-bottom:2px;"> <label for="save_login" style="color:#868686; letter-spacing:-1px;">아이디 저장</label>
					</td>
					<td class="smfont" style="padding-left:10px;">
						<input type="checkbox" name="auto_login_use" id="auto_login_use" value="y" onClick="happy_member_auto_login_use()" style="vertical-align:middle; margin-bottom:2px;"> <label for="auto_login_use" style="color:#868686; letter-spacing:-1px;">자동로그인</label>
					</td>
				</tr>
				</table>

			</td>
		</tr>
		</form>
		</table>


		<div style="padding:10px;"></div>



		<table align="center">
		<tr>
			<td class="smfont"><b><A HREF="/easyauction/member/register.action"><font color="#000000">회원가입</font></a></b></td>
			<td width="30" align="center">ㅣ</td>
			<td class="smfont"><a href=#">아이디찾기</font></a></td>
			<td width="30" align="center">ㅣ</td>
			<td class="smfont"><A HREF="#">비밀번호 찾기</font></a></td>
		</tr>
		</table>
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
</script>
</HEAD>

<BODY BGCOLOR="#FFFFFF">

</div>
</body>
</HTML>
