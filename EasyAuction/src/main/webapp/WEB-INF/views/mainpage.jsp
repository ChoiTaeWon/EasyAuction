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
				 
		 });
		
	</script>
	
	


<body>

	<div id="wrap">
		<div id="top">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
	
	
		<br />
		
		
		<div id="" style="width: 960px"> <!-- AAAAAA -->
		
			<div style="width:250px;float: left; border: 1px solid">
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
										<img src="/easyauction/resources/images/mainimg01.jpg"  border="0" alt=""></a>
										</div>
									</div>
									<div  class="wrapper-li" rel='0' out="/easyauction/resources/images/icon02.gif" over="/easyauction/resources/images/icon01.gif" >
										<div class="part zindex10" rel=0><a href="" target="_parent">
										<img src="/easyauction/resources/images/mainimg02.jpg"  border="0" alt=""></a>
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
	
	
	<div style="width:100%;border: 1px solid">
 		  	<div>	
 		  		<table style="width:100%;" >
					<tr>
						<td>
							<img src="/easyauction/resources/images/real_auction_logo.png">
						</td>									
					 </tr>
					 <tr>							   
						<td style="padding:10px;">
							<table style="width: 250px;background-color:yellow;border:0;cellpadding:0;cellspacing:0;">
								<tr>
									<td valign=top align=left>
										<table style="width:209px; background-color:orange; margin:10px 0 5px 0;" valign="middle">
											<tr>
												<td style="width:209px; height:7px; background:url(/easyauction/resources/images/mainlogo.png);"></td>
											</tr>
											<tr>
												<td style="background:url(img/imgpart_temple_round_02.gif);" align="center" valign="top">
													<div style="margin:8px 0 6px 0;"><a href='./view.php?num=32&tb=&count=&category=57r16&pg=1'><b>[미니언]미니언!</b></a></div>
													<a href='./view.php?num=32&tb=&count=&category=57r16&pg=1'><img src="/easyauction/resources/images/qwerqwerqwer.jpg" width="145" height="145"></a>
													
													<div class="time_main" id="main_ex_2_time_32">
														<div class="time_main_day" style="display:none;" id="main_ex_2_time_32_day"></div>
														<div class="time_main_dayicon" style="display:none;" id="main_ex_2_time_32_dayicon"></div>
														<div class="time_main_day_no" id="main_ex_2_time_32_day_no"></div>
														<div class="time_main_dayicon_no" id="main_ex_2_time_32_dayicon_no"></div>
														<div class="time_main_hour" id="main_ex_2_time_32_hour">00</div>
														<div class="time_main_minutes" id="main_ex_2_time_32_minutes">00</div>
														<div class="time_main_second" id="main_ex_2_time_32_second">00</div>
													</div>
												</td>
											</tr>
											<tr>
								 				<td align="center">
								 					<div style="clear:both;">
								 						<b><span class="tenwon_price_main" id="main_ex_2_price_32">가겨겨겨겨격</span></b>
								 						<img src="img/ico_won.gif" align="absmiddle">
								 					</div>
								 				</td>
											</tr>
											<tr>
												<td align="center" style="padding-top:5px;">
													<a href="javascript:void(0);" onclick="tenAuctionIpchal('32')">
													<img src="img/btn_ipchal.gif" border="0" align="absmiddle"></a>
												 </td>
											</tr>
											<tr>
												<td style="width:209px; height:16px; background:url(img/imgpart_temple_round_03.gif);"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>	
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


