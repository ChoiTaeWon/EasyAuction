<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>

</head>

<body>
<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 --><br />
		<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
<!-- 사이드메뉴 -->
	<c:import url="/WEB-INF/views/member/sidemenu.jsp" />
<!-- 사이드메뉴 끝 -->
<div style="float: right;width: 76%">
<div style="padding:10px;"></div>
<!-- 마이페이지 이미지 -->
<table width="100%">
	<tr>
		<td><img src="/easyauction/resources/images/img_banner_mypage.gif" border="0" align="absmiddle"></td>
	</tr>
</table>
<!-- 마이페이지 이미지 -->
<div style="padding:10px;"></div>
<!--경매 진행 단계-->

<table cellspacing="0" cellpadding="0" width="730" align="center" height="95">
<tr>
	<td width="152">
		<div class="dongurimom">
			<table align="center" width="100%">
			<tr>
				<td class="donguri"><a onFocus="this.blur();" href="my_buy_view.php?stats=0"><font class="smfont8">경매 진행중<font color="#960000">[1]</font></font></a></td>
			</tr>
			<tr>
				<td align="center" class="smfont" style="color: #6e6e6e; padding-top:10px">
					현재 참여중인 경매
					<br />
					<br />
				</td>
			</tr>
			</table>
		</div>
	</td>
	<td height="22" align="center"><img align="absMiddle" alt="" src="/easyauction/resources/images/ico_arrow_04.gif" /></td>
	<td width="152">
		<div class="dongurimom">
			<table align="center" width="100%">
			<tr>
				<td class="donguri"><a onFocus="this.blur();" href="my_buy_view.php?stats=1"><font class="smfont8">입금요망<font color="#960000">[0]</font></font></a></td>
			</tr>
			<tr>
				<td align="center" class="smfont" style="color: #6e6e6e; padding-top:10px">
					주문후 결제하지 않거나<br />
					결제실패한 내역
				</td>
			</tr>
			</table>
		</div>
	</td>
	<td height="22" align="center"><img align="absMiddle" alt="" src="/easyauction/resources/images/ico_arrow_04.gif" /></td>
	<td width="152">
		<div class="dongurimom">
			<table align="center" width="100%">
			<tr>
				<td class="donguri"><a onFocus="this.blur();" href="my_buy_view.php?stats=4"><font class="smfont8">배송중/구매결정<font color="#960000">[0]</font></font></a></td>
			</tr>
			<tr>
				<td align="center" class="smfont" style="color: #6e6e6e; padding-top:10px">
					받으신 상품의 구매완료를<br />
					결정하는 단계입니다.
				</td>
			</tr>
			</table>
		</div>
	</td>
	<td height="22" align="center"><img alt="" src="/easyauction/resources/images/ico_arrow_04.gif" /></td>
	<td width="152">
		<div class="dongurimom">
			<table align="center" width="100%">
			<tr>
				<td class="donguri"><a onFocus="this.blur();" href="my_buy_view.php?stats=6"><font class="smfont8">구매완료<font color="#960000">[0]</font></font></a></td>
			</tr>
			<tr>
				<td align="center" class="smfont" style="color: #6e6e6e; padding-top:10px">
					구매결정된 물품의<br />
					목록입니다.
				</td>
			</tr>
			</table>
		</div>
	</td>
</tr>
</table>
<!--  경매 진행 단계  -->
<!-- 경매 진행중  -->
<div style="padding:5px;"></div>
<table style="width:100%; height:28px; border:1px solid #5561d7; background : linear-gradient( to bottom, #DAD9FF, #565dd3 );">
	<tr>
		<td align="left" style="padding-left:10px;"><b><img src="/easyauction/resources/images/ico_arrow_06.png"><font color="white">&nbsp;경매 진행중</td>
		<td style="width:598px; height:32px;" align="right"><b><font color="#FEEF00">[1]</font><font class="smfont3"></b>건의 진행중 물품이 있습니다.</font></td>
	</tr>
</table>


<div style="padding:5px;"></div>

<form action="pay_prev.php" name="" method="POST" xonsubmit>

<table style="width:100%; height:25px; border:1px solid #DEDEDE;">
<tr>
	<td align="center" class="smfont" width="139">입찰마감일</font></td>
	<td style="width:1px; background-color:#DEDEDE;"></td>
	<td align="center" class="smfont" width="335">상품명</font></td>
	<td style="width:1px; background-color:#DEDEDE;"></td>
	<td align="center" class="smfont" width="120">가격</font></td>
	<td style="width:1px; background-color:#DEDEDE;"></td>
	<td align="center" class="smfont" width="62">상태</font></td>
	<td style="width:1px; background-color:#DEDEDE;"></td>
	<td align="center" class="smfont" width="79">기타</font></td>
</tr>
</table>
<table>
<tr>
	<td bgcolor="#FFFFFF" height="30" align="center" class="smfont">

		<table border="0" cellspacing="0" cellpadding="0" width="100%" height="80">
		<tr>
			<td width="18" align="center"></td>
			<td align="left" class="smfont" width="120">2015-07-22 17:06:24</td>


			<td class="smfont" width="50" height="50" style="padding-left:5px;;">
				<a href='#'><img src="#" width="50" height="40"></a>
			</td>
			<td class="smfont" width="274" style="padding-left:5px;" align='left'><a href='./view.php?num=4&tb=&count=1&category=47r09&pg=1'>화이트 스톤 뱅글</a></td>

			<td class="smfont" width="120">

			<table width="110">
			<tr>
				<td style="padding-bottom:2px;"><img src="/easyauction/resources/images/ico_price_01.gif" title="낙찰가" align="absmiddle"></td>
				<td style="padding-bottom:2px;" align="right"><font color="#000"><b>1,100원</b></font></td>
			</tr>
			<tr>
				<td style="padding-bottom:2px;"><img src="/easyauction/resources/images/ico_price_02.gif" title="입찰자" align="absmiddle"></td>
				<td style="padding-bottom:2px;" align="right">2명</td>
			</tr>
			<tr>
				<td><img src="/easyauction/resources/images/ico_price_03.gif" title="배송비" align="absmiddle"></td>
				<td align="right">착불</td>
			</tr>
			</table>

			</td>

			<td align="center" class="smfont" width="62"><img src=/easyauction/resources/images/view_stats0.gif alt='진행중'> <div style="padding:2px;"></div></td>

			<td align="center" class="smfont" width="80"><div style="padding:2px;"></div>나의입찰가 <br><font color=#FE7A04>1,100</font>원<div style="padding:2px;"></div></td>
		</tr>
		</table>
<!-- 줄 -->
<table width="100%">
<tr>
	<td style='background-color:#DEDEDE; height:1px;'></td>
</tr>
</table>
<!-- 줄 -->
<!-- 구매완료 내역 -->

	<div style="padding:10px;"></div>


	<table style="width:100%; height:28px; border:1px solid #5561d7; background : linear-gradient( to bottom, #DAD9FF, #565dd3 );">
	<tr>
		<td align="left" style="padding-left:10px;"><b><img src="/easyauction/resources/images/ico_arrow_06.png" title=""><font color="white">&nbsp; 구매완료 경매내역</td>
	</tr>
	</table>

	<div style="padding:5px;"></div>

	<table style="width:100%; height:25px; border:1px solid #DEDEDE;">
	<tr>
		<td align="center" class="smfont" width="110">주문번호</font></td>
		<td style="width:1px; background-color:#DEDEDE;"></td>
		<td align="center" class="smfont" width="360">상품명</td>
		<td style="width:1px; background-color:#DEDEDE;"></td>
		<td align="center" class="smfont" width="75">낙찰가격</font></td>
		<td style="width:1px; background-color:#DEDEDE;"></td>
		<td align="center" class="smfont" width="30">수량</font></td>
		<td style="width:1px; background-color:#DEDEDE;"></td>
		<td align="center" class="smfont" width="75">경매상태</font></td>
		<td style="width:1px; background-color:#DEDEDE;"></td>
		<td align="center" class="smfont" width="75">판매정보</font></td>
	</tr>
	</table>
	<table width="100%">
		<tr>
			<td>
			<p align=center><br><font style='font-size:11px;color:gray' align=center>구매중인 상품이 없습니다.</font><br><br></p>
			</td>
		</tr>
	</table>

	<div style="padding-top:20px;"></div>
<!-- 줄 -->
<table width="100%">
<tr>
	<td style='background-color:#DEDEDE; height:1px;'></td>
</tr>
</table>
<!-- 줄 -->
<!-- 구매완료 내역 -->
</td>
</tr>
</table>
</div>
<!-- 푸터  -->
<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
<div style="width: 960px;">
<!-- 푸터 끝 -->
</body>
</HTML>
