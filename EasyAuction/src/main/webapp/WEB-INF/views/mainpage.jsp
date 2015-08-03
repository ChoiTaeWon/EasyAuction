<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>Easy Auction</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	
	<!-- 상단 슬라이드 -->
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/slide_style.css" />
	<script type="text/javascript" src="/easyauction/resources/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/easyauction/resources/js/jquery.banner2.js"></script>
	
	
</head>

	<!-- 이미지 슬라이드  -->
	<script type="text/javascript">
		 $(window).ready(function() {  
			   var options = {};
				options['animSpeed'] = 1000; //애니시간
				options['pauseTime'] = 5000; //대기시간
				options['moveType'] = 'left'; //이동방향   top or bottom
				options['tailType'] = 'images'; //tail 버튼   number or images
				$("#slideshow5").hdamall2effect(options);
				
		 });
		 
		 
		 var auctionListResult = null;
		 $(function(){
			 if('${ locationurl }' == 'findPasswd' ||'${ locationurl }' == 'findmbId'){
				 alert('이메일을 발송했습니다. 확인해주세요');
			 }else if('${ locationurl }' == 'memberdelete'){
				 alert('회원정보가 삭제되었습니다.');
			 }
			 
				 $("#gonggi_top").on({ 
						//이벤트 이름 : 호출할 함수
						mouseover : function(event) {
							$("#gonggi").css("display", "block");
							$("#event").css("display", "none");
							
							event.preventDefault();
						}
					});
				 
				 $("#event_top").on({
						//이벤트 이름 : 호출할 함수
						mouseover : function(event) {
							$("#gonggi").css("display", "none");
							$("#event").css("display", "block");

							event.preventDefault();
						}
					});
				 
				 
					
				$.ajax({
					url : "/easyauction/ajax/selectMainAuction.action",	
					async : false,
					type : "POST",
					
					success : function(auctionList) {
						//alert(auctionList + ' : auctionList 값' );
						
						if (auctionList != null) {	
							//alert("실시간 경매를 불러옵니다.");
							auctionListResult =  auctionList;
						} else {
							alert('실시간 경매를 불러오기 실패');
						}
						
					},
					error : function() {
						alert('실시간 경매를 불러오기 아예 에러');
					}
				});
				 
				 
		 });
		
	</script>
	


<body>

	<div id="wrap">
		<div id="top">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
	
	
		<br />
		
		
		<div id="" style="width: 960px"> <!-- AAAAAA -->
		
			<div style="width:250px;float: left;">
				<table style="height: 250px; width: 250px;padding: 0 0 0 0; margin: 0 0 0 0;">
					<tr valign="top">
						<td style="background-color:#F8F8F8; border:1px solid #DEDEDE;" width="278" align="center">
							<!--공지사항,이벤트 top-->
							<table id='room_text' style="width: 200px;height:5px;border: 1px solid grey" align="center">
								<tr>  
									<td id="gonggi_top" align="center" style="width:119px; border-right:1px solid grey; cursor:pointer;">
									<span style="line-height:25px; color:#797979; letter-spacing:-1px;">공지사항</span></td>
									<td id="event_top"align="center" style="width:119px; cursor:pointer;">
									<span style="line-height:25px; color:#797979; letter-spacing:-1px;">이벤트</span></td>
								</tr>
							</table>
							<!-- 공지 박스 -->
							<table id="gonggi" class="gonggi_box" style="width: 100%;display:none">
								<%for(int i=0; i<5;i++){ %>
								<tr align="left" style="text-align: left; width: 100%">
									<td style="height: 20px;onMouseOver:this.style.backgroundColor='#F9F4F0'; onMouseOut:this.style.backgroundColor='';">
										<img src='/easyauction/resources/images/ico_dot.gif'>
										<a href='#gonggi1'>[공지] 공지글 <%= i %>입니다..........</a>
									</td>
								</tr>
								<% } %>	
							</table>
							<!-- 이벤트 박스 -->
							<table id="event" class="event_box" style="width: 100%;display:block">
								<%for(int i=0; i<5;i++){ %>
								<tr align="left" style="text-align: left; width: 100%">
									<td style="height: 20px;onMouseOver:this.style.backgroundColor='#F9F4F0'; onMouseOut:this.style.backgroundColor='';">
										<img src='/easyauction/resources/images/ico_dot.gif'>
										<a href='#event'>[이벤트]  <%= i %>입니다..........</a>
									</td>
								</tr>
								<% } %>	
							</table>
							
						</td>
					</tr>
				</table>
			</div>			
			
			
			
		<!-- jqeury 이미지 슬라이드  -->	
			<div style="width:700px; height:250px; float: right; border: 1px solid">
				<div id="subflash_html">
						<div id="slideshow5" class="slideshow-wrapper2">
							<div class="wrapper-Num"></div> 
								<div class="slideshow-wrapper-box2">
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/slide1.PNG"  border="0" alt=""></a>
										</div>
									</div>
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/slide2.jpg"  border="0" alt=""></a>
										</div>
									</div>
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/mainimg03.jpg"  border="0" alt=""></a>
										</div>
									</div>
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/mainimg04.jpg"  border="0" alt=""></a>
										</div>
									</div>
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/mainimg05.jpg"  border="0" alt=""></a>
										</div>
									</div>
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/mainimg06.jpg"  border="0" alt=""></a>
										</div>
									</div>
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/mainimg07.jpg"  border="0" alt=""></a>
										</div>
									</div>
								</div>
						</div>
					</div>
			</div><!-- 이미지 슬라이드 끝 -->
			
	</div><!-- AAAAAA 끝 -->
	
	
	<div style="width:100%;">
 		  	<div>	
 		  		<table style="width:100%;" >
					<tr>
						<td>
							<img src="/easyauction/resources/images/real_auction_logo.png">
						</td>									
					 </tr>
					 <tr>							   
						<td style="padding:5px;">
									<c:forEach begin="1" end="8" step="1" varStatus="status">
									<!-- 여기서부터 테두리  -->
										
											<table class="realTimeMain" style="float: left;">
												<tr>
													<td valign=top align="center">
														<table style="width:195px; margin:10px 0 5px 0;" valign="middle">
															<tr>
															<%-- <c:choose>
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
																</c:choose> --%>
															</tr>
															<tr>
																<td align="center" valign="top">
																	<div style="margin:8px 0 6px 0;">
																		<a href=''>
																			<b>[미니언]미니언!</b>
																		</a>
																	</div>
																	<a href=''>
																		<img src="/easyauction/resources/images/qwerqwerqwer.jpg" width="145" height="145">
																	</a>
																	
																	<div align="center" style="width: 100%;">
																		<table>
																		  <tr>
																		  
																		    <td><div class="deal_time_main_hour" id="count1"></div></td>
																		    <td><div class="deal_time_main_blank">:</div></td> 
																		    <td><div class="deal_time_main_minutes" id="count2"></div></td>
																		    <td><div class="deal_time_main_blank">:</div></td> 
																		    <td><div class="deal_time_main_second" id="count3"></div></td>
																		  </tr>
																		</table>
																	</div>
																	
																	<div style="padding-top: 10px"></div>
																	
																	<div>
																		<img style="width: 100%" src="/easyauction/resources/images/btn_ipchal_basic.gif">
																	</div>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<!-- 토탈 테두리 끝 -->
										
								</c:forEach>
								
						</td>
					</tr>
				</table>
			</div>
		</div><!-- 진행중인 경매 전체 div -->




		
	<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
	</div>	
</div><!-- div wrap 끝 -->
</body>
</html>
