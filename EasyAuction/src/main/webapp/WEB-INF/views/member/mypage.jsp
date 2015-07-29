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
		<td><img src="/easyauction/resources/images/img_banner_mypage.gif" border="0" align="absmiddle"></td>
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
<!-- 경매 진행중  -->
<div style="padding:5px;"></div>
<table style="width:100%; height:28px; border:1px solid #5561d7; background : linear-gradient( to bottom, #DAD9FF, #565dd3 );">
	<tr>
		<td align="left" style="padding-left:10px;"><b><img src="/easyauction/resources/images/ico_arrow_06.png">
		<font color="white">&nbsp;내 경매 물품 목록</td>
		<td style="width:508px; height:32px;" align="right"><b>
		<font color="#FEEF00">[${ countList.AUCLISTCOUNT }]</font><font class="smfont3"></b>건의 진행중 물품이 있습니다.</font>
		</td>
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
		<c:choose>
		<c:when test="${ auctions ne null && fn:length(auctions) > 0 }">
		<%-- <c:if test="${ (auction.aucType eq false) && (auction.aucBlindCheck eq false) }"> --%>
		<c:forEach var="auction" items="${ auctions }">
		<tr class="myAuctionView" id="${ auction.aucNo }">
			<!-- <td width="18" align="center"></td> -->
			<td align="center" class="smfont" width="139">
			<fmt:formatDate var="aucenddate" type="date" pattern="yyyy-MM-dd" value="${ auction.aucEndDate }" />
			${ aucenddate }
			</td>
			<c:forEach var="image" items="${ auction.auctionImage }">
			<td class="smfont" width="50" height="50" style="padding-left:5px;">
				<%-- <a href='/easyauction/auction/showdeal.action?aucno=${ auction.aucNo }'> --%>
				<img src="/easyauction/resources/imagefile/${ image.aucImgName }" width="50" height="40"></a>
			</td>
			</c:forEach>
			<td class="smfont" width="285" style="padding-left:5px;" align='left'>
			${ auction.aucTitle }</td>

			<td class="smfont" width="120">

			<table width="110">
			<tr>
				<td style="padding-bottom:2px;">
				<img src="/easyauction/resources/images/ico_price_01.png" title="최고입찰가" align="absmiddle"></td>
				<td style="padding-bottom:2px;" align="right"><font color="#000"><b>${ auction.bidding.bidPrice } 원</b></font></td>
			</tr>
			<tr>
				<td style="padding-bottom:2px;"><img src="/easyauction/resources/images/ico_price_02.png" title="입찰자" align="absmiddle"></td>
				<td style="padding-bottom:2px;" align="right">${ auction.countBidders -1 } 건</td>
			</tr>
<!-- 		<tr>
				<td><img src="/easyauction/resources/images/ico_price_03.gif" title="배송비" align="absmiddle"></td>
				<td align="right">착불</td>
			</tr> -->
			</table>
			</td>
			<td align="center" class="smfont" width="62">
				<c:choose>
					<c:when test="${ auction.aucState eq 0 }">
					<img src="/easyauction/resources/images/view_stats0.png" alt="경매전">
					</c:when>
					<c:when test="${ auction.aucState eq 1 }">
					<img src="/easyauction/resources/images/view_stats1.png" alt="경매중">
					</c:when>
					<c:when test="${ auction.aucState eq 2 }">
					<img src="/easyauction/resources/images/view_stats2.png" alt="경매 마감">
					</c:when>
					<c:otherwise>에러 상태</c:otherwise>
				</c:choose>
				</td>
			<td align="center" class="smfont" width="80"><div style="padding:2px;"></div>
			<!-- 나의입찰가 <br><font color=#FE7A04>1,100</font>원<div style="padding:2px;"></div> -->
			</td>
		</tr>
		</c:forEach>
		<%-- </c:if> --%>
		</c:when>
		<c:otherwise>
		<tr>
			<td>
			<p align=center><br><font style='font-size:11px;color:gray' align=center>경매 진행중인 상품이 없습니다.</font><br><br></p>
			</td>
		</tr>
		</c:otherwise>
		</c:choose>
		</table>
<!-- 줄 -->
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
