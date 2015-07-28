<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="utf-8" />
	<title>Easy Auction 경매 거래</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
</head>


<body>

	<div id="wrap">
		<div id="top">
			<c:import url="/WEB-INF/views/include/header.jsp"/>
		</div>
		
		<br/>
		
		<div style="width: 960px;float: left;padding: 0 0 0 0;margin: 0 0 0 0;">
			<table style="width: 100%" >
				<tr>
					<td style="text-align:left;width: 95%">
						<img src="/easyauction/resources/images/deal_list.png" style="width: 125px;height: 31px">
						<img src="/easyauction/resources/images/deal_list_eng.png" style="width: 125px;height: 31px">
					</td>
				
					<td style="text-align:center;width: 5%"><a href="dealregister.action">
					<img  src="/easyauction/resources/images/write.png"></a></td>
				</tr>
			</table>
		</div>
			
		<br/><br/>
		
		
		
		<div id="viewlist"> <!-- viewlist div -->
			<table style="width:955px; margin-left: 5.5px" >
				<tr>
					<td style="background-color:#5a5a5a; height:1px;"></td>
				</tr>
				<tr height="30">
					<td style="background-color:#F8F8F8;">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center" width="150"><b>사진</b></td>
								<td align="center" ><b>상품명</b></td>
								<td align="center" width="150"><b>현재가</b></td>
								<td align="center" width="120"><b>진행 상태</b></td>
								<td align="center" width="70"><b>입찰수</b></td>
								<td align="center" width="180"><b>마감시간</b></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="background-color:#DEDEDE; height:1px;"></td>
				</tr>
			</table>
			
			
<c:forEach var="auction" items="${ auctions }">			
 <c:if test="${ (auction.aucType eq false) && (auction.aucBlindCheck eq false) }">
			<table class="href_link" style="width: 955px;" cellpadding="0" cellspacing="0">
				<tr>
					<td valign=top align=center> 
						<table style="width:100%;border-bottom:1px dashed #dbdbdb;border: 0;" cellpadding="0" cellspacing="0">
							<tr>
								<td width="150" style="padding:10px 0 10px 0;" align="center">
									<div style="position:relative; z-index:0;">
										<div style="position:absolute; left:0px; top:0px; z-index:0;"></div>
									</div>
									<c:forEach var="image" items="${ auction.auctionImage }">
									<div style="width:140px; border:1px solid #DEDEDE;"><a href='showdeal.action?aucno=${ auction.aucNo }'>
											<img src="/easyauction/resources/imagefile/${ image.aucImgName }" style="width:140px; height:120px;" align="absmiddle" ></a>
									</div>
									</c:forEach>
								</td>
	
								<td style="padding-left:10px; text-align:left">
									<a href='showdeal.action?aucno=${ auction.aucNo }'>
									<c:choose>
											<c:when test="${ auction.aucCategory eq 1 }">[의류/패션용품]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 2 }">[국내화장품]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 3 }">[컴퓨터/주변기기/게임]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 4 }">[해외화장품/향수]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 5 }">[출산용품/유아용품]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 6 }">[자연식품/식재료]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 7 }">[가공식품/건강/음료]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 8 }">[가구/생활용품]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 9 }">[악기/음악관련상품]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 10 }">[프라모델/문구/사무]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 11 }">[디지털/가전제품]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 12 }">[스포츠/성인/상품권]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 13 }">[자동차/관련용품]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 14 }">[도서/티켓/서비스]${ auction.aucItemName }</c:when>
											<c:when test="${ auction.aucCategory eq 15 }">[출력될 매물 디렉토리]${ auction.aucItemName }</c:when>
											<c:otherwise>에러 상태</c:otherwise>
										</c:choose>
									</a>
									<div style="padding-top:5px;"></div>
									<font class="smfont"></font>
									<div style="padding-top:5px;"></div> 
									<p>${ auction.aucAdText }</p>  
								</td>
		
								<td width="145" align="right" style="padding-right:5px;">
									<c:choose>
									<c:when test="${ auction.countBidders <= 1 }"><b>입찰자 없음</b></c:when>
									<c:otherwise><b><font id="list_now_price">${ auction.bidding.bidPrice }</font> 원</b></c:otherwise>
									</c:choose>
									
									<div style="padding-top:5px;"></div>
									<b>시작가격  ${auction.aucStartPrice} 원</b>
								</td>
		
								<td width="120" align="center">
									<!-- <img src=img/ico_baesong_free.gif alt='무료배송' border=0 align=absmiddle>
									<div style="padding-top:5px;"></div>  
									<img src=img/new_product_icon.gif border=0 align=absmiddle alt='새제품'> -->
									<b>
										<c:choose>
											<c:when test="${ auction.aucState eq 0 }">경매 시작 전</c:when>
											<c:when test="${ auction.aucState eq 1 }">경매 중</c:when>
											<c:when test="${ auction.aucState eq 2 }">경매 마감</c:when>
											<c:otherwise>에러 상태</c:otherwise>
										</c:choose>
									</b>									
								</td>
		
								<td width="70" align="center">
									<b>${ auction.countBidders -1 } 건</b> 
								</td>
		
								<td width="180" align="center">
									
									<div style="width: 180px;height: 30px;border: 2px solid">
											<div class="deal_time_list_hour" id="counter1"></div>
											<div class="deal_time_list_blank">:</div> 
											<div class="deal_time_list_minutes" id="counter2"></div>
											<div class="deal_time_list_blank">:</div>
											<div class="deal_time_list_second" id="counter3"></div>
											
									</div>
									<div style="padding-top: 5px"></div>
									<a href="showdeal.action?aucno=${ auction.aucNo }"><img src="/easyauction/resources/images/btn_ipchal_basic.gif" border="0" align="absmiddle" alt="일반경매입찰"></a>
								</td>
							</tr>
							</table>
					</td>
				</tr>
			</table>
	</c:if>
</c:forEach>
		
		</div><!-- viewlist div -->
		
		
		
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	
	</div><!-- div wrap 끝 -->
</body>
</html>