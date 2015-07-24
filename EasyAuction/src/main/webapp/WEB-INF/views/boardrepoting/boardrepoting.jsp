<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type='text/javascript'>

	String.prototype.trim = function(str){
		str = this != window ? this : str;
		return str.replace(/^\s+/g,'').replace(/\s+$/g,'');
	}

	function report_chk(form_obj)
	{
		if ( form_obj.message.value.trim() == '' )
		{
			alert('신고내용을 입력해주세요.');
			form_obj.message.value = '';
			form_obj.message.focus();
			return false;
		}

		if ( form_obj.dobae.value.trim() == '' )
		{
			alert('도배방지키를 입력해주세요.');
			form_obj.dobae.focus();
			return false;
		}

		if ( confirm('신고하시겠습니까?') )
		{
			return true;
		}

		return false;
	}

	function addLoadEvent(func)
	{
		var oldonload = window.onload;

		if ( typeof window.onload != 'function' )
		{
			window.onload = func;
		}
		else
		{
			window.onload = function()
			{
				oldonload();
				func();
			}
		}
	}

	function report_url_load()
	{
		o_report_url = opener.location.href;
		document.getElementById('report_url').innerHTML = getStrCuts(o_report_url, 70);
		document.report_form.report_get.value = o_report_url;
	}

	//글자자르기
	function getStrCuts(str, max)
	{
		ns = str.substr(0, max);
		if (ns.length != str.length)
		{
			ns = ns + "...";
		}

		return ns;
	}

	addLoadEvent(report_url_load);

</script>




</head>
<body>
		<form name="report_form" method='post' onsubmit="return report_chk(this);" target='h_blank'>
		<input type='hidden' name='mode' value='insert' />
		<input type='hidden' name='report_post' value='' />
		<input type='hidden' name='report_get' />
		
		<div style="padding:10px;">
				 <table border="1" bordercolor="#dedede" style="border-collapse:collapse; width:100%;">
						<tr>
							<td width='80' height='30' style="padding-left:10px; background:#f1f1f1;">제보자 ID</td>
							<td style="padding-left:10px;">test</td>
						</tr>
						<tr>
							<td height='60' style="padding-left:10px;  background:#f1f1f1;">신고 URL</td>
							<td style="padding-left:10px; padding-right:10px;word-break:break-all;"><div id='report_url'></div></td>
						</tr>
						<tr>
							<td height='30' align='center' style="background:#f1f1f1;" colspan='3'>신고내용</td>
						</tr>
						<tr>
							<td colspan='3' style="padding:5px;">
								<textarea name='message' style="width:100%;height:100px; border:1px solid #dedede;"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan='3' height='30' style="padding-left:10px;">
								<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td style="width:80px;">도배방지키</td>
									<td class="input_style"><input name='dobae' type='text' size='4' maxlength='4' style='letter-spacing:1; border:1px solid #DDDDDD; font-family:arial; font-size:11pt; font-weight:bold;'></td>
									<td width="5"></td>
									<td><FONT style="BACKGROUND-COLOR: #999999; padding:2px; margin:2px 0 0 0; border:0px solid red;" color='#ffffff' >&nbsp;8<font color=#999999>8</font>
									<img src=img/dot.gif name=bbs_name0 5574>
									<span style=disply:none bt_adminlogout_login></span>
									7<font color=#999999>2</font><img src=img/dot.gif name=pass happycgi.com=test8437>7<font color=#999999>5</font><img src=img/dot.gif name=email happycgi.com=cgimall.co.kr-860>2<font color=#999999>1</font><img src=img/dot.gif name=comment happycgi.com=6985></font>
									<input type='hidden' name='dobae_org' value='34173'></td>
								</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan='3' align='center' style="padding:10px;">
								<input type='submit' value='' class="button_report" style="border:0px;">
							</td>
						</tr>
				</table>
		</div>
		</form>

</body>
</html>