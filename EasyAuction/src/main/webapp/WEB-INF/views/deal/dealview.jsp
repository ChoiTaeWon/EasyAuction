<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="utf-8" />
	<title>Easy Auction 게시글 보기</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body_style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
</head>


<body>

		
		<div id="top">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<br/>
		
		<div id="dealdetail">
				<table style="width:100%; border:1px solid #DEDEDE; background-color:#F8F8F8;">
				<tr>
					<td style="padding:15px;">
						<table style="width:100%; border:1px solid #DEDEDE; background-color:#FFF;">
						<tr>
							<td style="padding:10px 0 10px 10px"><b>경매번호 : <font color="#565DD3">No. 4&nbsp;</font> <font class="detail_product_name">[코코홀릭] 화이트 스톤 뱅글</font> 비키니 악세서리, 화이트스톤</td>
							<td align="right" style="padding-right:10px;"><img src='img/detail_report.gif' alt='쪽지신고하기' title='쪽지신고하기' align='absmiddle' onclick="window.open('happy_report.php?report_post=','happy_report','width=350,height=350');" style='cursor:pointer; vertical-align:middle;'/> <a href='./my_zzim.php?action=del&links_number=4&category=47r09'><img src=img/btn_outzzim.gif border=0 style='vertical-align:middle;'></a></td>
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
										<div ID="ITEM1"><a href="#" onclick="window.open('img.php?num=4','popup_img','width=900,height=600,top=50, left=50 ,toolbar=no,scrollbars=no')"><img src='././upload/2011/07/07/1310019510-94-0_Y_7_300x300_100_2_.jpg' WIDTH='300' height='300' border=0></a></div>
										<div ID="ITEM11" style="display:none;"><img src="./upload/2011/07/07/1310019510-94-0_Y_7_300x300_100_2_.jpg" WIDTH='300' height='300'></div>
										<div ID="ITEM2" style="display:none;"><img src="./upload/2011/07/07/1310019510-86-1_Y_7_300x300_100_2_.jpg" WIDTH='300' height='300'></div>
										<div ID="ITEM3" style="display:none;"><img src="./upload/2011/07/07/1310019510-55-2_Y_7_300x300_100_2_.jpg" WIDTH='300' height='300'></div>
										<div ID="ITEM4" style="display:none;"><img src="img/no_detail_img.gif" WIDTH='300' height='300'></div>
										<div ID="ITEM5" style="display:none;"><img src="img/no_detail_img.gif" WIDTH='300' height='300'></div>
										<div ID="ITEM6" style="display:none;"><img src="img/no_detail_img.gif" WIDTH='300' height='300'></div>
										<div ID="ITEM7" style="display:none;"><img src="img/no_detail_img.gif" WIDTH='300' height='300'></div>
										<div ID="ITEM8" style="display:none;"><img src="img/no_detail_img.gif" WIDTH='300' height='300'></div>
										<div ID="ITEM9" style="display:none;"><img src="img/no_detail_img.gif" WIDTH='300' height='300'></div>
										<div ID="ITEM10" style="display:none;"><img src="img/no_detail_img.gif" WIDTH='300' height='300'></div>
									</td>
								</tr>
								<tr>
									<td style="padding-top:10px;">
										<!-- <div style="padding-top:5;padding-left:1;"><script type="text/javascript">printSWF("", "flash_swf/detail_smimg.swf?img=<img src="./upload/2011/07/07/1310019510-94-0_N_7_56x56_100_2_.jpg" onclick="javascript:Selection('11');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="./upload/2011/07/07/1310019510-86-1_N_7_56x56_100_2_.jpg" onclick="javascript:Selection('2');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="./upload/2011/07/07/1310019510-55-2_N_7_56x56_100_2_.jpg" onclick="javascript:Selection('3');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('4');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('5');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('6');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('7');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('8');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('9');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>|<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('10');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>&imggap=5&Width=55&Height=55&bgcolor=DEDEDE", "303", "58", "transparent", "#FFFFFF");</script></div> -->
										<img src="./upload/2011/07/07/1310019510-94-0_N_7_56x56_100_2_.jpg" onclick="javascript:Selection('11');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="./upload/2011/07/07/1310019510-86-1_N_7_56x56_100_2_.jpg" onclick="javascript:Selection('2');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="./upload/2011/07/07/1310019510-55-2_N_7_56x56_100_2_.jpg" onclick="javascript:Selection('3');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('4');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('5');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>
										<br>
										<img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('6');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('7');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('8');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('9');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'><img src="img/no_detail_img_icon.gif" onclick="javascript:Selection('10');" width='56' height='56' style='border:1px solid #c9c9c9; margin:0px 2px 2px 0px;'>
				
				
								</td>
							</tr>
							</table>
						</td>
				
				
						<!--중간-->
						<td width="300" style="padding-left:20px; padding-right:20px;" align="center">
							<div id="end_view_layer">
								<div style="padding:10px;"></div>
								<table width="250px;" align="center">
								<tr height="40px;">
									<td width="72"><img src="img/ico_now_price.gif" title="현재가격"></td>
									<td width="178" align="right"><span class="tenwon_price" id="tenwon_price_4">0</span></font> 원</td>
								</tr>
								<tr>
									<td colspan="2" style="background:url(img/bg_detail_ipchal_line.gif); x-repeat; width:100%; height:2px;"></td>
								</tr>
								<tr height="40px;">
									<td width="72"><img src="img/ico_nakchal.gif" title="예상낙찰자"></td>
									<td width="178" align="right"><span class="tenwon_expect" id="tenwon_expect_4">0</span></td>
								</tr>
								<tr>
									<td colspan="2" style="background:url(img/bg_detail_ipchal_line.gif); x-repeat; width:100%; height:2px;"></td>
								</tr>
								</table>
				
								<div style="padding:15px;"></div>
								
								<table  width="250px;">
								<tr>
									<td  align="center">
										<table border='0' width="100%">
										<tr>
											<td align="center" style="padding:5px 5px 0 0;">
												<table style="background:url(img/icon_time_limit_bg.gif); width:28px; height:35px; background-repeat:no-repeat; " class="detail_time_limit">
												<tr>
													<td>0</td>
												</tr>
												</table>
											</td>
											<td align="center"><div class="tenwon_time" id="tenwon_time_4"><div class="tenwon_time_day" style="display:none;" id="tenwon_time_4_day"></div><div class="tenwon_time_day_icon" style="display:none;" id="tenwon_time_4_dayicon"></div><div class="tenwon_time_day_no" id="tenwon_time_4_day_no"></div><div class="tenwon_time_dayicon_no" id="tenwon_time_4_dayicon_no"></div><div class="tenwon_time_hour" id="tenwon_time_4_hour">00</div><div class="tenwon_time_minutes" id="tenwon_time_4_minutes">00</div><div class="tenwon_time_second" id="tenwon_time_4_second">00</div></div></td>
										</tr>
										</table>
									</td>
								</tr>
								</table>
				
							</div>
							
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
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<!--<tr>
										<td align="left" height="25">현재가</td>
										<td>:</td>
										<td align="right"><b>1,100 원</font></b></td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>-->
									<tr>
										<td align="left" height="25">시작가</td>
										<td>:</td>
										<td align="right">1,000 원</td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<tr>
										<td align="left" height="25">즉시구매가</td>
										<td>:</td>
										<td align="right"><font style="color:#4459EA; font-weight:bold;">99,000원</font></td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<tr>
										<td align="left" height="25">배송비</td>
										<td>:</td>
										<td align="right"><font color=#D45602>착불</font><br> (주문시결제가능)
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<tr>
										<td align="left" height="25">배송방법</td>
										<td>:</td>
										<td align="right">택배 </td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<tr>
										<td align="left" height="40">경매기간</td>
										<td>:</td>
										<td align="right" class="smfont" style="line-height:17px;">2011-07-07 15:18:32 <br> <font style="color:#C10000; font-weight:bold;">~ 2015-07-22 17:06:24</font></td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<!--<tr>
										<td align="left" height="25">남은시간</td>
										<td>:</td>
										<td align="right"><SCRIPT LANGUAGE='JavaScript'>
				var day_detail, hour_detail, min_detail, sec_detail;
				
				function Timer(restTime)
				{
					day_detail = Math.floor(restTime/86400);
					restHour = restTime%86400;
					hour_detail = Math.floor(restHour/3600);
					restMin = restHour%3600;
					min_detail = Math.floor(restMin/60);
					sec_detail = Math.floor(restMin%60);
					Timer1();
				}
				
				function Timer1()
				{
					//일:0 시간:0 분:0 초:0 이라면 종료메세지 출력
					if( (sec_detail == 0 && min_detail == 0 && hour_detail == 0 && day_detail == 0) || 85554 <= '0' )
					{
						document.getElementById('counter').value = '경매종료';
						return;
					}
					else
					{
						document.getElementById('counter').value = day_detail + '일 ' + hour_detail + '시간 ' + min_detail + '분 ' + sec_detail + '초 ';
					}
				
				
					//1초식 감소 하다가 -1이되면 1분을 뺀다은 초를 59초로 초기화
					sec_detail=sec_detail-1;
					if(sec_detail == -1)
					{
						sec_detail = 59;
						min_detail = min_detail-1;
					}
				
					//1분씩 감소 하다가 -1이되면 1시간을 뺀다음 분을 59분으로 초기화
					if(min_detail == -1)
					{
						min_detail=59;
						hour_detail = hour_detail - 1;
					}
				
					//1시간씩 감소 하다가 -1이되면 1일을 뺀다음 날짜 초기화
					if(hour_detail == -1)
					{
						hour_detail = 23;
						day_detail = day_detail - 1;
					}
				
					//1초당 한번씩 timer1()을 호출하여 실행
					window.setTimeout('Timer1()',1000);
				}
				
				
				</SCRIPT>
				
				<input type="text" id="counter" name="counter" readonly style="width:130px;background-color:#F0F0F0; border-style:none;color:#000;font-family:돋움;font-weight:bold;font-size:12px;">
				
				</td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>-->
									<tr>
										<td align="left" height="25">판매수량</td>
										<td>:</td>
										<td align="right">3개  <font color="#999999">(구매가능 최대수량:2개)</td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<tr>
										<td align="left" height="25">남은수량</td>
										<td>:</td>
										<td align="right">3 개</td>
									</tr>
									<tr>
										<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
									</tr>
									<tr>
										<td align="left" height="25">입찰수</td>
										<td>:</td>
										<td align="right">2 건 </td>
									</tr>
									</table>
								</td>
							</tr>
							</table>
							<div style="padding:5px;"></div>
				
							<table width="250" align="center">
							<tr>
								<td><a href=view_bid.php?num=4&category=47r09&option=baro><img src='img/btn_direct_pay.gif' border="0" align='absmiddle'></a>
				</td>
								<td width="5"></td>
								<td><a href=view_bid.php?num=4&category=47r09><img src='img/btn_tender_pay2.gif' border="0" align='absmiddle'></a></td>
								<td width="5"></td>
								<td>	<input type=image src="img/btn_mini_add_cart.gif" border="0" title='장바구니담기' align="absmiddle"></td>
								<td width="5"></td>
							</tr>
							</table>
						</td>
						<!--구분선-->
				
						<td style="background:url(img/bg_detail_gubun_line.gif); width:2px; height:100%;"></td>
				
						<!--오른쪽-->
				
						<td width="250" style="padding-left:10px;">
							<!--소셜에 알리기 / 최근입찰가 보기-->
							<table width="100%">
							<tr>
								<td><a href='http://twitter.com/home?status=%ED%99%94%EC%9D%B4%ED%8A%B8+%EC%8A%A4%ED%86%A4+%EB%B1%85%EA%B8%80+-+http%3A%2F%2F10won.cgimall.co.kr%2Fview.php%3Fnum%3D4' target=_blank onfocus='blur();'><img src=img/sns_icon/icon_twitter.png align=absmiddle border=0 alt='트위터로 보내기' width=23 height=23 class=png24></a><a href='#'><img src='img/sns_icon/icon_facebook.png' align='absmiddle' border='0' alt='페이스북으로 보내기' width='23' height='23' onclick="window.open('http://www.facebook.com/sharer.php?s=100&p[url]=http%3A%2F%2F10won.cgimall.co.kr%2Fview.php%3Fnum%3D4%26tb%3D%26count%3D%26category%3D47r09%26pg%3D1&p[title]=%ED%99%94%EC%9D%B4%ED%8A%B8+%EC%8A%A4%ED%86%A4+%EB%B1%85%EA%B8%80&p[summary]=&p[images][0]=http://10won.cgimall.co.kr/upload/2011%2F07%2F07%2F1310019510-94-0.jpg','bad','width=640,height=460,scrollbars=no')" style='cursor:pointer;'></a><a href='http://me2day.net/posts/new?new_post[body]=%22http%3A%2F%2F10won.cgimall.co.kr%2Fview.php%3Fnum%3D4%22%3Ahttp%3A%2F%2F10won.cgimall.co.kr%2Fview.php%3Fnum%3D4&new_post[tags]=%ED%99%94%EC%9D%B4%ED%8A%B8+%EC%8A%A4%ED%86%A4+%EB%B1%85%EA%B8%80' target=_blank onfocus='blur();'><img src=img/sns_icon/icon_me2day.png align=absmiddle border=0 alt='미투데이로 보내기' width=23 height=23 class=png24></a><a href='#'><img style='cursor: pointer;' border='0' align='absmiddle' src='img/sns_icon/icon_cyworld.png' onclick='window.open("http://csp.cyworld.com/bi/bi_recommend_pop_euc.php?url=http%3A%2F%2F10won.cgimall.co.kr%2Fview.php%3Fnum%3D4%26tb%3D%26count%3D%26category%3D47r09%26pg%3D1&title=yK3AzMauIL26xeYgufCx2w%3D%3D&thumbnail=http://10won.cgimall.co.kr/upload/2011/07/07/1310019510-94-0.jpg&summary=&writer=http://10won.cgimall.co.kr", "recom_icon_pop", "width=400,height=364,scrollbars=no,resizable=no");' alt='싸이월드 공감' title='싸이월드 공감' ></a></td>
								<td align="right"><a href="javascript:open_window('auction_ipchal_view','auction_ipchal_view.php?number=4', 0, 0, 400, 400, 0, 0, 0, 1, 0)"><img src="img/iepchar_btn.gif"></a></td>
							</tr>
							</table>
				
							<div style="padding:3px;"></div>
				
							<!--실시간 입찰현황-->
							<table style="background:url(img/bg_realtime_title_bar.gif); background-repeat:x-repeat; width:100%; height:28px; border:1px solid #828282;">
							<tr>
								<td class="detail_realtime_title"> &nbsp;<img src="img/ico_arrow_10.png"> 실시간 입찰현황</td>
								<td align="right" class="detail_realtime_title">최근 15분간 <span class="tenwon_ipchal_cnt" id="tenwon_ipchal_cnt_4">입찰자없음</span> 명 참여 &nbsp;</td>
							</tr>
							</table>
							<table style="border:1px solid #DFDFDF; width:100%;">
							<tr>
								<td style="padding:5px; background-color:#F0F0F0;" align="center">
									<table width="100%">
									<tr>
										<td><script>
								var ex_total = '5';
								var ex_width = '1';
								var ex_template ='rows_ten_ipchal.html';
								</script>
								<div id="tenwon_ipchal_4"></div>
								<script>ipchal_refresh(product_n);</script>
								</td>
									</tr>
									</table>
								</td>
							</table>
							<div style="padding:5px;"></div>
							<!--실시간 입찰현황-->
				
							<table>
							<tr>
								<td class="smfont8"><img src="img/ico_arrow_03.gif" style="margin:0 3px;">만족도 및 문의 </td>
							</tr>
							</table>
				
							<div style="padding:2px;"></div>
				
							<table style="border:1px solid #DFDFDF; width:100%;">
								<tr>
									<td style="padding:10px; background-color:#F0F0F0;" align="center">
									만족도 : <b>100%</b></td>
									<td style="padding:10px; background-color:#F0F0F0;" align="center">
									문의건수 : <b><a href="bbs_list.php?tb=board_onetoone&num=4">0</b> 건</a></td>
								</tr>
							</table>
				
							<div style="padding:5px;"></div>
				
							<table style="border:1px solid #DFDFDF; width:100%; background-color:#F0F0F0;">
								<!--<tr>
									<td colspan="3" style="background:url(img/bg_detail_info_line_02.gif); width:100%; height:2px;"></td>
								</tr>
								<tr height="30">
									<td style="padding:5px 0 0 10px;">경매내역</td>
									<td>:</td>
									<td style="padding:5px 10px 0 0;" align="right"><b><a href="javascript:open_window('auction_ipchal_view','auction_ipchal_view.php?number=4', 0, 0, 400, 400, 0, 0, 0, 1, 0)">2</b> 건</a></td>
								</tr>-->
							</table>
				
							<div style="padding:5px;"></div>
				
							<table>
							<tr>
								<td class="smfont8"><img src="img/ico_arrow_03.gif" style="margin:0 3px;">프리미엄상품</td>
							</tr>
							</table>
				
							<div style="padding:2px;"></div>
				
							<table style="border:1px solid #DFDFDF; width:100%; background-color:#F0F0F0;">
								<tr>
									<td style="padding:5px;"><table width=100%><tr><td colspan=6 align=center>해당매장에 등록된 상품이 없습니다.</td></tr></table></td>
								</tr>
							</table>
				
				
							<div style="padding:5px;"></div>
				
							<table>
							<tr>
								<td class="smfont8"><img src="img/ico_arrow_03.gif" style="margin:0 3px;">신규상품</td>
							</tr>
							</table>
				
							<div style="padding:2px;"></div>
				
							<table style="border:1px solid #DFDFDF; width:100%; background-color:#F0F0F0;">
								<tr>
									<td style="padding:5px;"><table width=100% border=0 cellpadding='0' cellspacing='0'><td valign=top align=center>
				
				<table width="100%">
				<tr>
					<td width="50">
				
						<table>
						<tr>
							<td style="border:1px solid #DEDEDE;">
								<a href='./view.php?num=72&tb=&count=&category=47r09&pg=1'><img src="./upload/2011/09/02/1314939833-40-0_N_7_50x50_100_2_.jpg" width="50" height="50"></a>
							</td>
						</tr>
						</table>
				
					</td>
					<td style="padding-left:5px;" class="smfont">
				
						<table width="100%">
						<tr>
							<td style="padding-left:3px;" align="left"><a href='./view.php?num=72&tb=&count=&category=47r09&pg=1'> 정품가방</a></div></td>
						</tr>
						<tr>
							<td style="padding-top:3px;" align="left"><b><span class="tenwon_price_main" id="main_ex_4_price_72">0</span>원</b></td>
						</tr>
						</table>
				
					</td>
				</tr>
				</table>
				
				
				</td></tr>
				
				</table></td>
								</tr>
							</table>
				
						</td>
					</tr>
					</table>
				
				</td>
				</tr>
				</table>
				
				<div style="padding:5px;"></div>
						
						
		</div>
			
			
	
		

		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	
	</div><!-- div wrap 끝 -->
</body>
</html>


