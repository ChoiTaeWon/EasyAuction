<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="utf-8" />
	<title>Easy Auction 경매 거래</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<script type="text/javascript">
var ddaylist = [];
var newtime = null;
//alert(ddaylist[0].id + "&&" + ddaylist[0].dday);


 	function getTime() { 
 		if(ddaylist == null || ddaylist.length ==0){
 			return;
 		}
 		
		now = new Date(); 
/* 		days = (dday - now) / 1000 / 60 / 60 / 24; 
		dRound = Math.floor(days); 
		hours = (dday - now) / 1000 / 60 / 60 - (24 * dRound); 
		hRound = Math.floor(hours); 
		minutes = (dday - now) / 1000 /60 - (24 * 60 * dRound) - (60 * hRound); 
		mRound = Math.floor(minutes); 
		seconds = (dday - now) / 1000 - (24 * 60 * 60 * dRound) - (60 * 60 * hRound) - (60 * mRound); 
		sRound = Math.round(seconds); */
		
		$.each(ddaylist, function(index, item){
			var id = item.id;
			var dday = item.dday;
			days = (dday - now) / 1000 / 60 / 60 / 24; 
			dRound = Math.floor(days); 
			hours = (dday - now) / 1000 / 60 / 60 - (24 * dRound); 
			hRound = Math.floor(hours); 
			minutes = (dday - now) / 1000 /60 - (24 * 60 * dRound) - (60 * hRound); 
			mRound = Math.floor(minutes); 
			seconds = (dday - now) / 1000 - (24 * 60 * 60 * dRound) - (60 * 60 * hRound) - (60 * mRound); 
			sRound = Math.round(seconds);
		
	 		if(dRound <10){
				$("#dayText"+id).html("0" + dRound);
			}else{
				$("#dayText"+id).html(dRound);
			}
			
			if(hRound <10){
				$("#counter1"+id).html("0" + hRound);
			}else{
				$("#counter1"+id).html(hRound);
			}
			if(mRound <10){
				$("#counter2"+id).html("0" + mRound);
			}else{
				$("#counter2"+id).html(mRound);
			}
			if(sRound <10){
				$("#counter3"+id).html("0" + sRound);
			}else{
				$("#counter3"+id).html(sRound);
			} 
		});
		
		
		newtime = window.setTimeout("getTime();", 1000); 
	}													
	
 	$(function(){
 		newtime = window.setTimeout("getTime();", 1000); 
 		
 	});
	
</script>
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
						<img src="/easyauction/resources/images/deal_list_ko.png" style="width: 90px;height: 31px">
						<img src="/easyauction/resources/images/deal_list_en.png" style="width: 100px;height: 31px">
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
 
	<fmt:formatDate value="${ auction.aucStartDate }" pattern="yyyy-M-d H:m" var="startDateFormat"/>
	<fmt:formatDate value="${ auction.aucEndDate }" pattern="yyyy-M-d H:m" var="endDateFormat"/>

	<c:set var="startDate" value="${ startDateFormat }"></c:set>
	<c:set var="spStartDate" value="${fn:split(startDate,' ')[0]}"></c:set>
	<c:set var="spStartTime" value="${fn:split(startDate,' ')[1]}"></c:set>
	<c:set var="startYear" value ="${fn:split(spStartDate,'-')[0]}" ></c:set>
	<c:set var="startMonth" value ="${fn:split(spStartDate,'-')[1]}" ></c:set>
	<c:set var="startDay" value ="${fn:split(spStartDate,'-')[2]}" ></c:set>
	<c:set var="startHour" value ="${fn:split(spStartTime,':')[0]}" ></c:set>
	<c:set var="startMinute" value ="${fn:split(spStartTime,':')[1]}" ></c:set>
			
	<c:set var="endDate" value="${ endDateFormat }"></c:set>
	<c:set var="spEndDate" value="${fn:split(endDate,' ')[0]}"></c:set>
	<c:set var="spEndTime" value="${fn:split(endDate,' ')[1]}"></c:set>
	<c:set var="endYear" value ="${fn:split(spEndDate,'-')[0]}" ></c:set>
	<c:set var="endMonth" value ="${fn:split(spEndDate,'-')[1]}" ></c:set>
	<c:set var="endDay" value ="${fn:split(spEndDate,'-')[2]}" ></c:set>
	<c:set var="endHour" value ="${fn:split(spEndTime,':')[0]}" ></c:set>
	<c:set var="endMinute" value ="${fn:split(spEndTime,':')[1]}" ></c:set>
									
			<table class="href_link" style="width: 955px;" cellpadding="0" cellspacing="0">
				<tr>
					<td valign=top align=center> 
						<table style="width:100%;border-bottom:1px dashed #dbdbdb;border: 0;" cellpadding="0" cellspacing="0">
							<tr>
								<td width="150" style="padding:10px 0 10px 0;" align="center">
									<div style="position:relative; z-index:0;">
										<div style="position:absolute; left:0px; top:0px; z-index:0;"></div>
									</div>
										<div style="width:140px; border:1px solid #DEDEDE;"><a href='showdeal.action?aucno=${ auction.aucNo }'>
												<img src="/easyauction/resources/imagefile/${ auction.auctionImage[0].aucImgName }" style="width:140px; height:120px;" align="absmiddle" ></a>
										</div>
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
											<c:when test="${ auction.aucState eq 3 }">입금 대기</c:when>
											<c:when test="${ auction.aucState eq 4 }">결제 완료</c:when>
											<c:when test="${ auction.aucState eq 5 }">거래 완료</c:when>
											<c:otherwise>에러 상태</c:otherwise>
										</c:choose>
										
										
									</b>									
								</td>
								<!-- 입찰 건수 -->
								<td width="70" align="center">
									<b>${ auction.countBidders -1 } 건</b> 
								</td>
		
								<td width="180" height="30px" align="center">
								
									<input type="hidden" value="${ auction.aucState }" id="aucStateVal">
									<input type="hidden" value="${ auction.aucStartDate }" id="aucStartDate">
									
									
									
									
									<!-- 남은 날짜 -->
									<div style="width: 100%;height: 30px">
										<c:choose>
											<c:when test="${ auction.aucState eq 0 }">
												<div class="deal_time_list_day">경매 시작까지 : <span id="dayText${ auction.aucNo }"></span>일</div>
												<script type="text/javascript">
													var dday = null;
													var startYear = ${ startYear };
													var startMonth = ${ startMonth };
													var startDay = ${ startDay };
													var startHour = ${ startHour };
													var startMinute = ${ startMinute };
													//var dday = new Date(startYear,startMonth,startDay,startHour, startMinute, 00);
													var obj =  {
														"id" : "${auction.aucNo}",
														"dday" : new Date(startYear,Number(startMonth)-1,startDay,startHour, startMinute, 00)
													};
													ddaylist.push(obj);
													//getTime(startYear,startMonth,startDay,startHour, startMinute, 00);
												</script>
												
											</c:when>
											<c:when test="${ auction.aucState eq 1 }">
												<div class="deal_time_list_day" id="dayText">경매 마감까지 : <span id="dayText${ auction.aucNo }"></span>일</div>
												<script type="text/javascript">
													var dday = null;
													var endYear = ${ endYear };
													var endMonth = ${ endMonth };
													var endDay = ${ endDay };
													var endHour = ${ endHour };
													var endMinute = ${ endMinute };
													var obj =  {
														"id" : "${auction.aucNo}",
														"dday" : new Date(endYear,Number(endMonth)-1,endDay,endHour, endMinute, 00)
													};
													ddaylist.push(obj);
													//dday = new Date(endYear, endMonth, endDay, endHour, endMinute, 00);
													//getTime(endYear,endMonth,endDay,endHour, endMinute);
												
												</script>
												
											</c:when>
											<c:when test="${ auction.aucState eq 2 }">
												
												<div style="width: 100%;height: 35px;id="auction_end">
													<img src='/easyauction/resources/images/auction_end_icon.png' style='width:180px;height:50px'>
												</div>
												<div style="padding-top: 5px"></div>
												
											</c:when>
											<c:otherwise>에러 상태</c:otherwise>
										</c:choose>
									</div>
									<!-- 남은 시간  -->
									<div style="width: 100%;height: 35px;display: ${ auction.aucState eq 2 ? 'none' : 'block'}" >
											<div style="float: left;">
												<img src="/easyauction/resources/images/clock_icon.png" width="30px" height="30px" style="padding-right: 4px">
											</div>
											<div class="deal_time_list_hour" id="counter1${ auction.aucNo }"></div>
											<div class="deal_time_list_blank">:</div> 
											<div class="deal_time_list_minutes" id="counter2${ auction.aucNo }"></div>
											<div class="deal_time_list_blank">:</div>
											<div class="deal_time_list_second" id="counter3${ auction.aucNo }"></div>
									</div> 
									
									
									
									<!-- 참여하기 버튼 -->
									<div style="padding-top: 5px"></div>
									<a href="showdeal.action?aucno=${ auction.aucNo }"><img src="/easyauction/resources/images/btn_ipchal_basic.gif" border="0" align="absmiddle" alt="일반경매입찰"></a>
								</td>
							</tr>
							</table>
							<table style="width:100%;">
							<!-- <tr>
								<td>
									<img src="/easyauction/resources/images/deal_list_line.png" width="100%">
								</td>
							</tr> -->
							<tr>
								<td style="background-color:#DEDEDE; height:0.3px;"></td>
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
