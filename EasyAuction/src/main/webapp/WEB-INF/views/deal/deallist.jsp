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
			
			
			
 <%for(int i=0; i<10;i++){ %> 
			<table class="href_link" style="width: 955px;" cellpadding="0" cellspacing="0">
				<tr>
					<td valign=top align=center> 
						<table style="width:100%;border-bottom:1px dashed #dbdbdb;border: 0;" cellpadding="0" cellspacing="0">
							<tr>
								<td width="150" style="padding:10px 0 10px 0;" align="center">
									<div style="position:relative; z-index:0;">
										<div style="position:absolute; left:0px; top:0px; z-index:0;"></div>
									</div>
									<div style="width:140px; border:1px solid #DEDEDE;"><a href='showdeal.action'>
											<img src="/easyauction/resources/images/qwerqwerqwer.jpg" style="width:140px; height:120px;" align="absmiddle" ></a>
									</div>
								</td>
	
								<td style="padding-left:10px; text-align:left">
									<a href='showdeal.action'>물품 명</a>
									<div style="padding-top:5px;"></div>
									<font class="smfont"></font>
									<div style="padding-top:5px;"></div> 
									<p>제목 제목 </p>  
								</td>
		
								<td width="145" align="right" style="padding-right:5px;">
									<b><font id="list_now_price">5,000,000</font> 원</b>
									<div style="padding-top:5px;"></div>
									<b>시작가격  5,000 원</b>
								</td>
		
								<td width="120" align="center">
									<!-- <img src=img/ico_baesong_free.gif alt='무료배송' border=0 align=absmiddle>
									<div style="padding-top:5px;"></div>  
									<img src=img/new_product_icon.gif border=0 align=absmiddle alt='새제품'> -->
									<b>대기 중</b>									
								</td>
		
								<td width="70" align="center">
									<b>0 건</b> 
								</td>
		
								<td width="180" align="center">
									<div class="tenwon_time_list" id="main_ex_8_time_27">
										<div class="tenwon_time_list_day" style="display:none;" id="main_ex_8_time_27_day"></div>
										<div class="tenwon_time_list_day_icon" style="display:none;" id="main_ex_8_time_27_dayicon"></div>
										<div class="tenwon_time_list_day_no" id="main_ex_8_time_27_day_no"></div>
										<div class="tenwon_time_list_day_icon_no" id="main_ex_8_time_27_dayicon_no"></div>
										<div class="tenwon_time_list_hour" id="main_ex_8_time_27_hour">00</div>
										<div class="tenwon_time_list_minutes" id="main_ex_8_time_27_minutes">00</div>
										<div class="tenwon_time_list_second" id="main_ex_8_time_27_second">00</div>
									</div>
									<a href="showdeal.action"><img src="/easyauction/resources/images/btn_ipchal_basic.gif" border="0" align="absmiddle" alt="일반경매입찰"></a>
								</td>
							</tr>
							</table>
					</td>
				</tr>
			</table>
 <% } %> 
		
		</div><!-- viewlist div -->
		
		
		
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	
	</div><!-- div wrap 끝 -->
</body>
</html>
