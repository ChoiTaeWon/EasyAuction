<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="utf-8" http-equiv="Content-Type"/>
	<title>Easy Auction 게시글 보기</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script src="/easyauction/resources/js/jquery-ui.js"></script>
</head>

<script type="text/javascript">

 	function getTime(Year, Month, Day, Hour, Minute) { 
		 now = new Date(); 
		dday = new Date(Year, Month, Day, Hour, Minute, 00); // 원하는 날짜, 시간 정확하게 초단위까지 기입.
		days = (dday - now) / 1000 / 60 / 60 / 24; 
		dRound = Math.floor(days); 
		hours = (dday - now) / 1000 / 60 / 60 - (24 * dRound); 
		hRound = Math.floor(hours); 
		minutes = (dday - now) / 1000 /60 - (24 * 60 * dRound) - (60 * hRound); 
		mRound = Math.floor(minutes); 
		seconds = (dday - now) / 1000 - (24 * 60 * 60 * dRound) - (60 * 60 * hRound) - (60 * mRound); 
		sRound = Math.round(seconds);
	
		
		
		if(hRound <10){
			document.getElementById("counter1").innerHTML = "0" + hRound;
		}else{
			document.getElementById("counter1").innerHTML = hRound;	
		}
		
		if(mRound <10){
			document.getElementById("counter2").innerHTML = "0" + mRound;
		}else{
			document.getElementById("counter2").innerHTML = mRound; 
		}
		
		if(sRound <10){
			document.getElementById("counter3").innerHTML = "0" + sRound; 
		}else{
			document.getElementById("counter3").innerHTML = sRound; 	
		}
		newtime = window.setTimeout("getTime();", 1000); 
	}													
	
	 $(function(){
		var aucState = ${auction.aucState};

		var startDate = "<fmt:formatDate value='${auction.aucStartDate}' pattern='yyyy-MM-dd HH:mm:ss' />";
		var endDate = "<fmt:formatDate value='${auction.aucEndDate}' pattern='yyyy-MM-dd HH:mm:ss' />";
		
		if(aucState == 0){ //경매 시작전
			alert(aucState);	 
			var spStartDate = startDate.split(' ')[0];
			var spStartTime = startDate.split(' ')[1];
			
			var startYear = spStartDate.split('-')[0];
			var startMonth = spStartDate.split('-')[1];
			var startDay = spStartDate.split('')[2];
			var startHour =  spStartTime.split(':')[0];
			var startMinute = spStartTime.split(':')[1];
			
			getTime(startYear,startMonth,startDay,startHour, startMinute);
			
		}else if(aucState == 1){ //경매 중
			var spEndDate = endDate.split(' ')[0];
			var spEndTime = endDate.split(' ')[1];
			
			var endYear = spEndDate.split('-')[0];
			var endMonth = spEndDate.split('-')[1];
			var endDay = spEndDate.split('-')[2];
			var endHour =  spEndTime.split(':')[0];
			var endMinute = spEndTime.split(':')[1];
			
			getTime(endYear,endMonth,endDay,endHour, endMinute);
			
		}else if(aucState == 2){ //경매 마감
			//alert(aucState);
			$("#wholeTimeDiv").empty();
			$("#wholeTimeDiv").html("<img src='/easyauction/resources/images/auction_end_icon.png' style='width:270px;'>"); 
		}else{
			alert(aucState);
			
		}
	 });	
	
	
</script>

<script  type="text/javascript">
var returnbidNo = -1;
var bidderId = null;
var auctionNo = -1;
var ipchalState;
var aucWriter = null;
var refreshTimer = null;
var maxBiddNo= -1;
var time = 1000 * 5; 


 $(function(){
	  bidderId = $("#loginuserId").val();
	  auctionNo = ${ auction.aucNo };
	  aucWriter = $("#aucWriter").val();
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

//신고하기 dialog 
	var reportDialog = $('#reportContent').dialog({
		autoOpen : false,
		width : 550,
		height : 400,
		modal : true,
		buttons : {
			신고하기 : doReport,
			취소 : function() {						
				reportDialog.dialog("close");
			}
		},
		close : function() {
			$('#reportText').val('');
		}
	});
	
//신고하기 버튼 클릭 시 신고이력 확인 절차	
	$("#btn_auction_report").click(function(event) {
		if(bidderId != aucWriter){
		$.ajax({
			url : "/easyauction/ajax/selectRepoterCheck.action",
			async : false,
			type : "GET",
			data : {
				mbId : bidderId,
				aucNo : auctionNo
			},
			success : function(result){
				if(result == 0){
					alert(event + " : event 값");
					alert("신고 가능 상태");
					reportDialog.dialog("open");
				}else{
					alert("신고 이력이 있습니다 이미 신고했던 글입니다.");
				}
			},
			error : function (){
				alert("신고 가능 상태 확인 에러.");
			}
		});
		}else{
			alert("자신의 글을 신고할 수는 없습니다. ");
		}
		event.preventDefault();
	});
				
//신고 요청 처리
		function doReport() {
			
			$.ajax({
				url : "/easyauction/ajax/auctionReporting.action",	
				async : false,
				type : "GET",
				data : {
					reporter : $("#reporter").val(),
					targetAuctionNo : $("#targetAuctionNo").val(),
					reportText : $("#reportText").val()
					
				},
				success : function(result) {
					alert(result + ' : result 값' );
					
					if (result == 0) {	
						alert("게시글이 신고 되었습니다.");
						
						/* $("#notloggedin").css("display", "none");
						$("#mid").text($("#memberid").val());							
						$("#loggedin").css("display", "block"); */
						reportDialog.dialog('close');
					} else {
						alert('게시글 신고 실패');
					}
					
				},
				error : function() {
					alert('게시글 신고 실패 + 걍 아예 에러임 ');
				}
			});
			
			event.preventDefault();
		}
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//입찰하기 
	$('#doIpchal').on({
		click :function(event){
				var e;
				if(bidderId != aucWriter){
					$.ajax({
						url : "/easyauction/ajax/selectLastBidder.action",
						async : false,
						type : "GET",
						data : {
							mbId : bidderId,
							aucNo : auctionNo
						},
						success : function(result){
							if(result == 0){
								e = 0;
								alert(event + " : event 값");
								alert("입찰 가능 상태");
							}else{
								e = 1;
								alert("방금 입찰하셨습니다.");
							}
						},
						error : function (){
							alert("입찰 가능 상태 확인 에러.");
						}
						
					});
				}else{
					alert("자신의 글에는 입찰 할 수 없습니다. ");
				}
				
				if(e == 0){
					$.ajax({
						url: "/easyauction/ajax/insertBiddingPrice.action",
						async : false,
						type : "GET",
						data : {
							mbId : bidderId,
							aucNo : auctionNo
						},
						success: function(result){
							if(result != null){
								alert( result.mbId + " : 입찰되었습니다.");
								$("#refreshMbId").empty();
								$("#refreshMbId").html("<b><font id='list_now_price'>"+ result.mbId +"</font></b>");
								$("#refreshBidPrice").empty();
								$("#refreshBidPrice").html("<b><font id='list_now_price'>"+result.bidPrice+"</font> 원</b>"); 
								
								$("#btn_realTime").attr("src", "/easyauction/resources/images/realTime_stop.png" );
								//$("#btn_realTime").addClass("stop");
								returnbidNo = result.bidNo;
								
							}
							else{
								alert("입찰에 실패했습니다.");
							}
			           	
			        	},
			        	error : function() {
							alert('입찰 실패');
						}
					});
				}
				
			}
	
			
	});
	
 
 
 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////	
 		 

 }); 			
////////////////////////////////////////////////////////////////////////////////////////////////////////////
//입찰 리스트 

	
  	$(function(){
			//clearInteval(refreshTimer);
			
			refreshTimer = 	setInterval("getIpchalList()", time);
			
		 });
		 
		function getIpchalList(){
			if(returnbidNo != -1){
				$.ajax({
					url : "/easyauction/ajax/selectIpchalList.action",
					async : true,
					method : "GET",
					data : { 
						bidNo : returnbidNo, 
						aucNo : auctionNo
					},
					success : function(biddingList) {
						
						if (biddingList != null){
							$.each(biddingList, function(index, item){
								var html="<tr><td>"+item.bidPrice +"원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + item.mbId +"</td></tr>"+
								"<tr><td style='background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;'></td></tr>"
								$("#biddinglist").append($(html)); 
								
							});
							var item = biddingList[biddingList.length-1];
							returnbidNo = item.bidNo + 1;
							
							
							$("#realTimeCount").empty();
							$("#realTimeCount").html(biddingList.length + "명 참여&nbsp;");
							
							$("#refreshBidPrice").empty();
							$("#refreshBidPrice").html("<b><font id='list_now_price'>"+item.bidPrice +"</font> 원</b>"); 
							$("#refreshMbId").empty();
							$("#refreshMbId").html("<b><font id='list_now_price'>"+ item.mbId+  "</font></b>");

							
						} else {
							alert("biddingList가 null임");
						}
						
					},
					error : function() {
						alert("리스트 불러오기 실패"); 
					}
				});
			}
		}
		 
		 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////	

</script>


<script type="text/javascript">
$(function(){
	 $("#btn_realTime").on({ 
		 	mouseover : function(event){
		 		if($("#btn_realTime").attr("src") != "/easyauction/resources/images/realTime_before_start.png"){
			 		if( refreshTimer == null){
						$("#btn_realTime").attr("src", "/easyauction/resources/images/realTime_Restart_mouseOver.png" );
					}else{
						$("#btn_realTime").attr("src", "/easyauction/resources/images/realTime_stop_mouseOver.png" );
					}
		 		}
		 	},
		 	
		 	mouseleave : function(event){
		 		if($("#btn_realTime").attr("src") != "/easyauction/resources/images/realTime_before_start.png"){
			 		if( refreshTimer == null && $("#btn_realTime").attr("src") != "/easyauction/resources/images/realTime_before_start.png"){
						$("#btn_realTime").attr("src", "/easyauction/resources/images/realTime_Restart.png" );
					}else{
						$("#btn_realTime").attr("src", "/easyauction/resources/images/realTime_stop.png" );
					}
		 		}
		 	},
		 	

		 	click : function(event) {
		 		if($("#btn_realTime").attr("src") != "/easyauction/resources/images/realTime_before_start.png"){
						if( refreshTimer == null && $("#btn_realTime").attr("src") != "/easyauction/resources/images/realTime_before_start.png"){
							$("#btn_realTime").attr("src", "/easyauction/resources/images/realTime_Restart.png" );
							 refreshTimer = 	setInterval("getIpchalList()", time);
							alert("실시간 재시작");
						}else{
							$("#btn_realTime").attr("src", "/easyauction/resources/images/realTime_stop.png" );
							clearInterval(refreshTimer);
							refreshTimer = null;
							alert("실시간 스탑");
							
						}
					}
		 	}
		});	
});

</script>
<div id="reportContent" title="게시글 신고하기" style="display: none;width: 300px;height: 250px">	        
	        <label for="reporter">신고자</label>
	        <input id="reporter" type="text" value="${ loginuser.mbId }" readonly="readonly"/>
	        <label for="targetAuctionNo">신고할 게시글</label>
	        <input type="text" value="${auction.aucItemName}" readonly="readonly"/>
	        <input id="targetAuctionNo" type="hidden" value="${ auction.aucNo }" />
	        <label for="reportText">신고 사유</label></br>
	        <textarea id="reportText" rows="3" cols="48"></textarea>
</div>	
	
	    
	    
<body>

	<div id="wrap">
		<div id="top">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<br/>
		
		<div id="dealdetail"><!--  dealdetail div-->
			<input type="hidden" value="${ loginuser.mbId }" id="loginuserId">
			<input type="hidden" value="${ auction.aucWriter }" id="aucWriter">
			
			
				<table style="width:960px; border:1px solid #DEDEDE; background-color:#F8F8F8;">
					<tr>
						<td style="padding:15px;">
						
								<table style="width:100%; border:1px solid #DEDEDE; background-color:#FFF;">
									<tr>
										<td style="padding:10px 0 10px 10px">
											<b>경매번호 :
												<font color="#565DD3">No.  ${ auction.aucNo }&nbsp;</font> 
												<font >
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
												</font> 
											</b>
										</td>
										
										
										<!-- 신고 하기  -->
										<td align="right" style="padding-right:10px;">
											<img src="/easyauction/resources/images/btn_auction_report.gif" alt='쪽지신고하기' title='쪽지신고하기' 
											align='absmiddle' id="btn_auction_report"
											style='cursor:pointer; vertical-align:middle;'/> 
											<!-- onclick="window.open('happy_report.php?report_post=','happy_report','width=350,height=350');" -->
											
										</td>
										
										
										
									</tr>
								</table>
						
							<div style="padding:5px;"></div>
						
								<table width="100%">
									<tr valign="top">
										<!--왼쪽-->
										<td width="300">
											<table>
												<tr>
													
													<td style="border:1px solid #DEDEDE;">
														<%-- <c:forEach var="image" items="${ auction.aucImgName }"> --%>
															<%-- <c:forEach var="image" items="images"> --%>
															<div ID="ITEM1"><a href="#" onclick="window.open('img.php?num=4','popup_img','width=900,height=600,top=50, left=50 ,toolbar=no,scrollbars=no')"><img src='/easyauction/resources/images/qwerqwerqwer.jpg' WIDTH='300' height='300' border=0></a></div>
															<div ID="ITEM2" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM3" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM4" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM5" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM6" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM7" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM8" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM9" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM10" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<div ID="ITEM11" style="display:none;"><img src="/easyauction/resources/images/no_detail_img.gif" WIDTH='300' height='300'></div>
															<%-- </c:forEach> --%>	
														<%-- </c:forEach> --%>	
													</td>
													
												</tr>
												<tr>
													<td style="padding-top:10px;width:100%;">
														<img src="/easyauction/resources/images/qwerqwerqwer.jpg" onclick="javascript:Selection('2');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('3');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('4');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('5');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('6');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<br>
														
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('7');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('8');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('9');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('10');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														<img src="/easyauction/resources/images/no_detail_img.gif" onclick="javascript:Selection('11');" width='53' height='53' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;padding:0'>
														
													</td>
												</tr>
												<tr>
														<td style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;"></td>
												</tr>
												<tr>
													<td align="left" height="25" style="width:50px; border:1px solid #DEDEDE;">판매자 : ${ auction.aucWriter }</td>
												</tr>
												
											</table>
										</td>
							
							
									<!--중간-->
										<td width="300" style="padding-left:15px; padding-right:15px;" align="center">
											<div id="end_view_layer">
											
													<div style="padding:10px;"></div>
													<table width="270px;" align="center">
														<tr height="40px;">
															<td width="72"><img src="/easyauction/resources/images/ico_now_price.gif" title="현재가격"></td>
															<td width="178" align="right"> 
															<c:choose>
																<c:when test="${ auction.countBidders <= 1 }"><b>입찰 대기 중</b></c:when>
																<c:otherwise>
																	<div id="refreshBidPrice">
																		<b><font id="list_now_price"><fmt:formatNumber type="number"  maxFractionDigits="3" value="${ auction.bidding.bidPrice }" /></font> 원</b>
																	</div>
																</c:otherwise>
															</c:choose>
															</td>
														</tr>
														<tr>
															<td colspan="2" style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); x-repeat; width:100%; height:2px;"></td>
														</tr>
														<tr height="40px;">
															<td width="72"><img src="/easyauction/resources/images/ico_nakchal.gif" title="예상낙찰자"></td>
															<td width="178" align="right">
															<c:choose>
																<c:when test="${ auction.countBidders <= 1 }"><b>입찰자 없음</b></c:when>
																<c:otherwise><div id="refreshMbId"><b><font id="list_now_price">${ auction.bidding.mbId }</font></b></div></c:otherwise>
															</c:choose>
															
															</td>
														</tr>
														<tr>
															<td colspan="2" style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); x-repeat; width:100%; height:2px;"></td>
														</tr>
													</table>
								
													<div style="padding:15px;"></div>

													<!-- 남은시간 day 표시 -->
													 <div id="wholeTimeDiv">
		  													<table style="width: 270px">
																	<tr>
																	<td style="text-align: left;">
																		남은 시간 : 
																	</td>
																	 <td>
																	 	
																	 </td>
																</tr>
															</table> 
															
															<!-- 남은시간 time 표시 -->
															<table style="width: 270px">
																<tr>
																	<td  align="center">
																		<table style="width: 100%;"  >
																			<tr>
																				<td align="center" style="padding:0;margin:0;">
																					<img src="/easyauction/resources/images/clock_icon.png" style="padding:0;margin:0;width: 44px;height: 44px;">
																				</td>
																				<td align="center">
																						<div class="deal_time_blank"></div> 
																						<div class="deal_time_hour" id="counter1">
																						</div>
																						<div class="deal_time_blank">:</div> 
																						<div class="deal_time_minutes">
																							<SPAN id="counter2"></SPAN>
																						</div>
																						<div class="deal_time_blank">:</div>
																						<div class="deal_time_second">
																							<SPAN id="counter3"></SPAN>
																						</div>
																						
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table> 
													</div>
											</div>
										
										
										
										
										
											<div style="padding:5px;"></div>
											
												<table width="250" align="center">
													<tr align="center">
														<td>
															<img id="doIpchal" src='/easyauction/resources/images/btn_doipchar.gif' border="0" align='middle'/>
														</td>
													</tr>
												</table>
										
											<div style="padding:15px;"></div>
							
												<table style="border:1px solid #DFDFDF; width:100%;">
													<tr>
														<td style="padding:10px; background-color:#F0F0F0;">
															<table style="width:100%;">
																<tr>
																	<td align="left" height="25" width="60">시중가</td>
																	<td width="1">:</td>
																	<td align="right"><b>99,000 원</b></td>
																</tr>
																<tr>
																	<td colspan="3" style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;"></td>
																</tr>
														
																<tr>
																	<td align="left" height="25">시작가</td>
																	<td>:</td>
																	<td align="right"><b>${ auction.aucStartPrice }</b></td>
																</tr>
																<!-- <tr>
																	<td align="left" height="40">경매기간</td>
																	<td>:</td>
																	<td align="right" class="smfont" style="line-height:17px;">2011-07-07 15:18:32 <br> <font style="color:#C10000; font-weight:bold;">~ 2015-07-22 17:06:24</font></td>
																</tr> -->
																<tr>
																	<td colspan="3" style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;"></td>
																</tr>
																
																<tr>
																	<td align="left" height="25">경매 시작 시간</td>
																	<td>:</td>
																	<td align="right"><b><fmt:formatDate value="${ auction.aucStartDate }" pattern="yyyy-MM-dd HH:mm:ss" /></b></td>
																</tr>
																<tr>
																	<td colspan="3" style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;"></td>
																</tr>
																<tr>
																	<td align="left" height="25">경매 마감 시간</td>
																	<td>:</td>
																	<td align="right"><font style="color:#C10000; font-weight:bold;"><fmt:formatDate value="${ auction.aucEndDate }" pattern="yyyy-MM-dd HH:mm:ss" /></font></td>
																</tr>
																<tr>
																	<td colspan="3" style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;"></td>
																</tr>
																<tr>
																	<td align="left" height="25">입찰수</td>
																	<td>:</td>
																	<td align="right"><b><span id="countBidders">${ auction.countBidders -1 }</span></b></td>
																</tr>
																</table>
														</td>
													</tr>
												</table>
										<div style="padding:5px;"></div>
							
									</td>
									<!--구분선-->
							
									<td style="background:url(/easyauction/resources/images/bg_detail_ipchal_line_02.png); width:2px; height:100%;"></td>
							
									<!--오른쪽-->
							
									<td width="250" style="padding-left:15px;">
										<table width="100%">
											<tr>
												<td align="right"><a href="javascript:open_window('auction_ipchal_view','auction_ipchal_view.php?number=4', 0, 0, 400, 400, 0, 0, 0, 1, 0)">
												<img id="ipchalList" src="/easyauction/resources/images/ipchar_list_btn.gif"></a></td>
											</tr>
										</table>
							
										<div style="padding:3px;"></div>
							
										<!--실시간 입찰현황 타이틀 -->
										<table style="background:url(/easyauction/resources/images/bg_realtime_title_bar.png); background-repeat:x-repeat; width:100%; height:28px; border:1px solid #828282;">
										<tr>
											<td class="detail_realtime_title">&nbsp;>&nbsp;실시간 입찰현황</td>
											<td align="right" class="detail_realtime_title" id="realTimeCount">0명 참여 &nbsp;</td>
										</tr>
										</table>
										
										<!--실시간 입찰현황 목록 -->
										<table style="border:1px solid #DFDFDF; width:100%;">
										<tr>
											<td style="padding:5px; background-color:#F0F0F0;" align="center">
												<table id="biddinglist"  width="100%">
													<tr>
														<td style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;"></td>
													</tr>
													
													<!-- 
													<tr>
														<td>123456원&nbsp;qwerqwer&nbsp;시간</td>
													</tr>
													<tr>
														<td style="background:url(/easyauction/resources/images/bg_detail_ipchal_line.png); width:100%; height:2px;"></td>
													</tr> 
													 -->
													
												</table>
											</td>
										</table>
										
										<div style="padding:5px;"></div>
										<!--실시간 입찰현황-->
										<table style="border:1px solid #DFDFDF; width:100%;">
											<tr>
												<td>
													<img id="btn_realTime" class="js-realTime" src="/easyauction/resources/images/realTime_before_start.png" width="250">
												</td>
												<td>
													
												</td>
											</tr>
										</table>					
									</td>
								</tr>
							</table>
						
						</td>
					</tr>
				</table>
				
				<div style="padding:5px;"></div>
						
		</div><!--  dealdetail div-->
		
			
			
	
		

		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	
	</div><!-- div wrap 끝 -->

</body>
</html>


