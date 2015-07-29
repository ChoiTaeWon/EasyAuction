<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$('#photoreview').click(function(){
		/* function post_to_url(path, params, method) {
		    method = method || "post"; // Set method to post by default, if not specified.
		 
		    // The rest of this code assumes you are not using a library.
		    // It can be made less wordy if you use one.
		    var form = document.createElement("form");
		    form.setAttribute("method", method);
		    form.setAttribute("action", path);
		 
		    for (var key in params) {
		        var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", key);
		        hiddenField.setAttribute("value", $(this).attr('alt'));
		 
		        form.appe ndChild(hiddenField);
		    }*/
		$(location).attr('href','/easyauction/board/photoregister.action?mbId=' + '${ mbId }');
		    /* $(this).attr('alt') */
	    event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
	    event.stopPropagation();//버블링 업 막아줌
	})
	$('.myAuctionView').click(function(){
		$(location).attr('href','/easyauction/auction/showdeal.action?aucno=' + $(this).attr('id'));
	})
})


</script>
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
		<td><img width="730" src="/easyauction/resources/images/img_banner_mypage2.png" border="0" align="absmiddle"></td>
	</tr>
</table>
<!-- 마이페이지 이미지 -->
<div style="padding:10px;"></div>
<!--경매 진행 단계-->
<div style="padding:10px;"></div>
<table cellspacing="0" cellpadding="0" width="730" align="center" height="95">
<tr>
	<td width="152">
		<div class="dongurimom" id="state1">
			<table align="center" width="100%">
			<tr>
				<td class="donguri">
					<font class="smfont8">경매 진행중
					<font color="#960000">[${ countList.AUCSTATE0 }]</font>
					</font>
				</td>
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
				<td class="donguri">
				<font class="smfont8">입금요망
				<font color="#960000">[${ countList.AUCSTATE1 }]</font>
				</font>
				</td>
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
				<td class="donguri">
				<font class="smfont8">배송중/구매결정
				<font color="#960000">[${ countList.AUCSTATE2 }]</font></font>
				</td>
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
				<td class="donguri">
				<font class="smfont8">구매완료
				<font color="#960000"><%-- [${ countList.AUCSTATE3 }] --%></font></font>
				</td>
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
<div style="padding:10px;"></div>

<table width="100%">
<tr>
	<td style='background-color:#DEDEDE; height:1px;'></td>
</tr>
</table>
<!-- 줄 -->
<!-- 낙찰완료 내역 -->

	<div style="padding:10px;"></div>


	<table style="width:100%; height:28px; border:1px solid #5561d7; background : linear-gradient( to bottom, #DAD9FF, #565dd3 );">
	<tr>
		<td align="left" style="padding-left:10px;"><b>
		<img src="/easyauction/resources/images/ico_arrow_06.png" title="">
		<font color="white">&nbsp; 낙찰완료 경매내역</td>
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
		<td align="center" class="smfont" width="75">판매자</font></td>
		<td style="width:1px; background-color:#DEDEDE;"></td>
		<td align="center" class="smfont" width="105">포토후기남기기</font></td>
	</tr>
	</table>
	
	<table style="width:100%; height:25px; border:1px solid #DEDEDE;">
	<c:choose>
		<c:when test="${ getauctions ne null && fn:length(getauctions) > 0 }">
			<c:forEach var="auction" items="${ getauctions }">
					<tr class="myAuctionView" id="${ auction.aucNo }" height="25px">
						<td align="center" class="smfont" width="110">${ auction.aucNo }</td>
						<td align="center" class="smfont" width="360">${ auction.aucTitle }</td>
						<td align="center" class="smfont" width="75">${ auction.aucFinalPrice }</td>
						<td align="center" class="smfont" width="75">${ auction.aucWriter }</td>
						<td align="center" width="105"><img src="/easyauction/resources/images/btn_photoreview.png" id="photoreview" alt="${ auction.aucNo }"></td>
					</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td>
				<p align=center><br><font style='font-size:11px;color:gray' align=center>낙찰된 상품이 없습니다.</font><br><br></p>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</table>
	<div style="padding-top:20px;"></div>
<!-- 줄 -->
<table width="100%">
<tr>
	<td style='background-color:#DEDEDE; height:1px;'></td>
</tr>
</table>
<!-- 줄 -->
<!-- 낙찰완료 내역 -->
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
