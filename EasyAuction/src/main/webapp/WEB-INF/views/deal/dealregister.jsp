<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="utf-8" />
	<title>Easy Auction 경매 등록</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body_style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/datetimepicker.min.css"/>
	<script type="text/javascript" src="/easyauction/resources/js/datetimepicker.min.js"></script>
</head>
<body>
		<div id="wrap">
		<div id="top">
			<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		</div>
		<br/>
					
			<div class="registerauction">
				<form action="dealregister.action" method="post" enctype='multipart/form-data' name='regiform' onsubmit="return check_Valid(this);" style="margin:0;">
								<input type="hidden" name="links_number" value="">
								<input type="hidden" name="category" value="57r16">
								
								
								<!-- 상단 이미지  -->
								
								<table style="width: 960px;padding:0px; margin: 0" >
									<tr>
										<td><img src="/easyauction/resources/images/img_title_dealregister.png" style="padding: 0;margin: 0" title="나의상품판매"></td>
									</tr>
									<tr>
										<td><img src="/easyauction/resources/images/ico_check.gif" title="checkicon">
										<img src="/easyauction/resources/images/txt_dealregister.gif" title="txt_dealregister"></td>
									</tr>
								</table>
								
								<div style="padding:5px;"></div>
								
								
								<table style="border:1px solid #DEDEDE;width:960px;">
									<tr>
										<td style="padding:5px;">
											<table width="100%">
											
												<!-- 제목   -->
												<tr height="30">
													<td width="150" style="background-color:#F6F6F6;">
														<img src="img/icon_basis.gif" style="margin-left:10px;" align="absmiddle"><b>제목</b>
													</td>
													<td width="800" style="padding-left:10px;">
														<input type="text" name="aucTitle" value="" style="width:300px;" class="input_style1">
														 제목을 입력하세요 예) OOOO 팝니다.
													</td>
												</tr>
												<tr>
													<td colspan="2" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
												</tr>
												
												<!-- 카테고리  -->
												<tr height="30">
													<td width="150" style="background-color:#F6F6F6;">
														<img src="img/icon_basis.gif" style="margin-left:10px;" align="absmiddle"> <b>카테고리</b>
													</td>
													<td width="800" style="padding-left:10px;">	
													
														<select size=1 name="aucCategory" style="width:150px">
															<option selected="selected">카테고리 선택</option>
															<option value=01>의류/패션용품</option>
															<option value=02>국내화장품</option>
															<option value=03>컴퓨터/주변기기/게임</option>
															<option value=04>해외화장품/향수</option>
															<option value=05>출산용품/유아용품</option>
															<option value=06>자연식품/식재료</option>
															<option value=07>가공식품/건강/음료</option>
															<option value=08>가구/생활용품</option>
															<option value=09>악기/음악관련상품</option>
															<option value=10>프라모델/문구/사무</option>
															<option value=11>디지털/가전제품</option>
															<option value=12>스포츠/성인/상품권</option>
															<option value=13>자동차/관련용품</option>
															<option value=14>도서/티켓/서비스</option>
															<option value=15>출력될 매물 디렉토리</option>
														</select>	
																
														<font> 상품등록 카테고리를 설정 하세요</font>
													</td>
												</tr>
												<tr>
													<td colspan="2" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
												</tr>
												
												
												<!-- 상품명 -->
												
												<tr height="30">
													<td width="150" style="background-color:#F6F6F6;"><img src="img/icon_basis.gif" style="margin-left:10px;" align="absmiddle"><b>상품명</b></td>
													<td width="800" style="padding-left:10px;">
														<input type="text" name="aucItemName" value="" style="width:300px;" class="input_style1"> 
														<font> 판매상품과 관련없는 스팸성 문구일 경우 관리자에 의하여 조기마감될 수 있습니다.</font></td>
												</tr>
												<tr>
													<td colspan="2" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
												</tr>
												
												
												<!-- 홍보 문구 -->
												<tr height="30">
													<td width="150" style="background-color:#F6F6F6;"><img src="img/icon_select.gif" style="margin-left:10px;" align="absmiddle"> <b>홍보 문구</b></td>
													<td width="800" style="padding-left:10px;">
														<input type="text" name="aucAdText" value="" style="width:300px;" class="input_style1">
															<font class="product_add_red"> 거짓문구나 상품과 관계없는 홍보문구 사용시 관리자의 제재가 있을수 있습니다.</font></td>
												</tr>
												<tr>
													<td colspan="2" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
												</tr>
												
												
												<!-- 입찰 시작 일시 -->
												<tr height="60">
													<td width="150" style="background-color:#F6F6F6;"><img src="img/icon_basis.gif" style="margin-left:10px;" align="absmiddle"><b>입찰시작일시</b></td>
													<td width="800" style="padding-left:10px;">
														<!-- <iframe width=188 height=166 name="gToday:datetime:agenda.js:gfPop:plugins_time.js" id="gToday:datetime:agenda.js:gfPop:plugins_time.js" 
															src="./js/time_calrendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
														</iframe> -->
														<div class="well">
															  <div id="datetimepicker1" class="input-append date">
															    <input data-format="dd/MM/yyyy hh:mm:ss" type="text"></input>
															    <span class="add-on">
															      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
															      </i>
															    </span>
															  </div>
														</div>
															<script type="text/javascript">
															  $(function() {
															    $('#datetimepicker1').datetimepicker({
															      language: 'pt-BR'
															    });
															  });
															</script>
														<input type="text" id="aucStartDate" name="aucStartDate" value="" size=18 style="width: 300px" readonly>
														<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.regiform.end_date);return false;" HIDEFOCUS>
														<img class="PopcalTrigger" align="absmiddle" src="calendar/calbtn.gif" width="34" height="22" border="0" alt=""></a>
														<div style="padding-top:5px;"><img src="img/icon_detail_dot.gif"> 
														<font class="product_add_red"> 상품판매 시작일시를 우측의 달력아이콘을 클릭하여 선택해주세요</font></div></td>
												</tr>
												<tr>
													<td colspan="2" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
												</tr>
												
												
												<!-- 입찰 마감 일시 -->
												<tr height="60">
													<td width="150" style="background-color:#F6F6F6;"><img src="img/icon_basis.gif" style="margin-left:10px;" align="absmiddle"> <b>입찰마감일시</b></td>
													<td width="800" style="padding-left:10px;">
															<iframe width=188 height=166 name="gToday:datetime:agenda.js:gfPop:plugins_time.js" id="gToday:datetime:agenda.js:gfPop:plugins_time.js" src="./js/time_calrendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
															</iframe>
															<input type="text" id="aucEndDate" name="aucEndDate"   value="" style="width: 300px" size=18 readonly>
															<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.regiform.end_date);return false;" HIDEFOCUS><img class="PopcalTrigger" align="absmiddle" src="calendar/calbtn.gif" width="34" height="22" border="0" alt=""></a>
															<div style="padding-top:5px;"><img src="img/icon_detail_dot.gif"> <font class="product_add_red"> 상품판매 마감일시를 우측의 달력아이콘을 클릭하여 선택해주세요</font></div></td>
												</tr>
												<tr>
													<td colspan="2" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
												</tr>
											
												<!-- 입찰 시작 가격 -->
												<tr height="60">
													<td width="150" style="background-color:#F6F6F6;"><img src="img/icon_basis.gif" style="margin-left:10px;" align="absmiddle"><b>경매 시작가</b></td>
													<td width="800" style="padding-left:10px;"><input type="text" name="aucStartPrice" value="" style="width: 300px" class="input_style1">원
													<div style="padding-top:5px;">
														<img src="img/icon_detail_dot.gif">
														<font class="product_add_red"> 경매시작가를 입력하세요. 예)1000</font></div></td>
												</tr>
												<tr>
													<td colspan="2" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
								
								
								<div style="padding-top:10px;"></div>
								
							
								
								<!--상품 상세정보 시작-->
								<br />
								<table cellpadding="0" cellspacing="0" style="width:960px;">
									<tr>
										<td><img src="/easyauction/resources/images/ico_check.gif" title="checkicon">
										<img src="/easyauction/resources/images/txt_dealregister_detail.gif" title="txt_dealregister_detail"></td>
									</tr>
								</table>
								
								<div style="padding:5px;"></div>
								
								<table style="border:1px solid #DEDEDE;width: 960px">
								<tr>
									<td style="padding:5px;">
										<table width="100%">
										<tr height="30">
											<td height="30" bgcolor="#f6f6f6" class="smfont" align="center"><b>상세정보</b></td>
										</tr>
										</table>
								
										<div style="padding-top:5px;"></div>
								
										<table width= "100%">
										<tr>
											<td class="smfont"><font color="#888888"><b>직거래 유도문구, 홈페이지 기재 등 직거래 관련 문구는 사용할 수 없으며, 다른 아이디의 만족도, 상품평가 등을 게재할 수 없습니다.</b></td>
										</tr>
										<tr>
											<td class="smfont"><font color="#888888">판매상품의 홍보, 비교 등의 목적으로 '타상표명 + ~style, ~type, ~형' 문구는 법적 제재(상표권 침해)를 받을 수 있습니다</td>
										</tr>
										<tr>
											<td class="smfont"><font color="#888888"><b>품질경영 및 공산품안전관리법</b> 규정에 의해 안전검사대상공산품 및 어린이보호포장대상공산품을 판매하실 경우는 반드시 안전인증을 받은 제품이거나<div style="padding-left:6;">어린이보호포장대상 적용품목인지 확인하여 등록하여야 합니다.</div></td>
										</tr>
										<tr>
											<td class="smfont"><font color="#888888">공산품,전기용품,각종 유무선 통신기기 및 전자파적합 등록을 거쳐야 하는 기자재에 대하여 관련 안전인증 또는 형식인증 번호등을 기재하여 주시기 바랍니다.</td>
										</tr>
										<tr>
											<td class="smfont"><font color="#888888">이용약관 및 현행법을 위반한 경매에 대해 <b>경매 마감 및 회원 자격을 정지</b>가 될 수 있으며, 관계법규에 의해 처벌 받으실 수 있사오니<div style="padding-left:6;">유의하시기 바랍니다.</div></td>
										</tr>
									</table>
									
									<div style="padding-top:5px;"></div>
									
									<div style="padding-top:5px;width:100%;height:300px"></div>
								
									<!-- <SCRIPT language="javascript" src="/easyauction/resources/js/fckeditor.js"></SCRIPT>
										<script type="text/javascript">									
													
													/* var oFCKeditor = new FCKeditor( 'comment' ) ;
													oFCKeditor.ToolbarSet	= 'happycgi' ;
													oFCKeditor.Height	= 600 ;
													oFCKeditor.Value	= '' ;
													oFCKeditor.Create() ; */
													
										</script> -->
								
								
									</td>
								</tr>
								</table>
								
								<!--상품 상세정보 끝-->
								
								<div style="padding:10px;"></div>
								
									<!--플래시 업로드 툴 시작-->
									
									<table cellpadding="0" cellspacing="0" width="960px">
										<tr>
											<td style="padding-left:5px;"><img src="/easyauction/resources/images/ico_check.gif"> 
											<img src="/easyauction/resources/images/txt_dealregister_addImage.gif" title="상품이미지 입력하기"></td>
										</tr>
									</table>
									
									<div style="padding:5px;"></div>
									
	<!-- 								<table  width="100%" style="border:1px solid #DEDEDE;">
									<tr>
										<td style="padding:5px;" align="center">		플래시 업로더 추가로 인한 히든필드
											<input type=hidden name='img0' value='' size=40>
											<input type=hidden name='img1' value='' size=40>
											<input type=hidden name='img2' value='' size=40>
											<input type=hidden name='img3' value='' size=40>
											<input type=hidden name='img4' value='' size=40>
											<input type=hidden name='img5' value='' size=40>
											<input type=hidden name='img6' value='' size=40>
											<input type=hidden name='img7' value='' size=40>
											<input type=hidden name='img8' value='' size=40>
											<input type=hidden name='img9' value='' size=40>
											<input type=hidden name='img10' value='' size=40>
											<input type=hidden name='img11' value='' size=40>
											<input type=hidden name='img12' value='' size=40>
											<input type=hidden name='img13' value='' size=40>
											<input type=hidden name='img14' value='' size=40>
											<input type=hidden name='img15' value='' size=40>
											<input type=hidden name='img16' value='' size=40>
											<input type=hidden name='img17' value='' size=40>
											<input type=hidden name='img18' value='' size=40>
											<input type=hidden name='img19' value='' size=40>
											플래시 업로더 추가로 인한 히든필드
									
									
									
									<div id="swf_upload_layer" width="100%" height="100%">
										<table cellpadding="0" cellspacing="0" width="100%" align="center" >
										<tr>
										<td height="25" bgcolor="#f4f4f4" style='padding:0 0 0 20'><font color="#0e8fea" class="smfont">*첨부 이미지의 경우는 <b>GIF,JPG</b>파일포멧을 가진 이미지만 업로드가 가능하며, 그외에 혹은 <b>PNG,BMP</b>파일등은 업로드가 되지 않습니다</font></td>
										</tr>
										<tr>
										<td height="25" bgcolor="#f4f4f4" style='padding:0 0 0 20'><font color="#0e8fea" class="smfont">*업로드할 사진을 선택하신후 "업로드"버튼을 누르셔서  사진순서를 정해주세요.</font></td>
										</tr>
										<tr>
										<td height="5"></td>
										</tr>
										<tr>
										<td style='padding : 0 10 10 20'>
									
											<script language="JavaScript" type="text/JavaScript" src="./js/swf_upload.js"></script>
											<script language="javascript">
											makeSwfMultiUpload(
											movie_id='img', //파일폼 고유ID
											flash_width='800', //파일폼 너비 (기본값 400, 권장최소 300)
											list_rows='5', // 파일목록 행 (기본값:3)
											limit_size='100', // 업로드 제한용량 (기본값 10)
											file_type_name='상품 사진 선택', // 파일선택창 파일형식명 (예: 그림파일, 엑셀파일, 모든파일 등)
											allow_filetype='*.jpg *.jpeg *.gif', // 파일선택창 파일형식 (예: *.jpg *.jpeg *.gif *.png)
											deny_filetype='*.php *.php3 *.php4 *.html *.inc *.js *.htm *.cgi *.pl *.doc *.jsp *.hwp *.zip *.rar *.tar', // 업로드 불가형식
											upload_exe='flash_upload.php', // 업로드 담당프로그램
											max_file_count='10', //업로드재한
											get_frameHeight = '660', // 드래그 플레쉬 호출할  iframe 세로크기 [여기부터 아래쪽변수 미사용시 아무값이나]
											get_frameSrc = 'flash_upload_drag.php?cntt=20'	// 드래그 플레쉬 호출할 iframe 주소
											);
											</script>
									
										</td>
										</tr>
										</table>
									</div>
									
									</td>
									</tr>
									</table> -->
									
									<!--플래시 업로드 툴 끝-->
								<div style="width: 960px;height: 100px;border:1px solid #DEDEDE;">
									<input type="file" name="attach" style="width:960px;height:20px;" />
								</div>
									
									
									
								<div style="padding:10px;"></div>	
									
									
								
								<table width="960px" style="border:5px solid #DEDEDE;">
								<tr>
									<td width="80" rowspan="4" align="center" style="padding-left:150px;"><img src="/easyauction/resources/images/img_caution.gif"></td>
									<td class="smfont" style="padding-bottom:5px; padding-top:10px;"><b><font color="#C10000">잠깐! 경매정보 및 상품정보를 다시 한번 확인해 주세요!</font></b></td>
								</tr>
								<tr>
									<td class="smfont"><font color="#666666">경매/상품정보에는 사실만을 입력하셔야 합니다.</font></td>
								</tr>
								<tr>
									<td class="smfont"><font color="#666666">부정확한 정보를 입력하시면 구매거부가 발생할 수 있으며, 법적제재를 받으실 수 있습니다.</font></td>
								</tr>
								<tr>
									<td class="smfont" style="padding-bottom:10px;"><font color="#666666">등록상품이 관련볍규위반으로 적발시 모든 법적책임은 판매자가 감수해야 합니다.</font></td>
								</tr>
									
								</table>
								

								
								<div style="padding:10px;"></div>
								
								<div align="center" style="width:960px;">
									<input type=hidden name=gou_number value=''>
									<input type=image src='/easyauction/resources/images/btn_goregister.gif' border='0' alt='일반경매등록'>
									
									 <a href='/auction_add2.php?tb=&pg=&num=&mode=mod_ok&passd=&category=57r16'>
									 <img src='/easyauction/resources/images/btn_resetregister.gif'  border='0'></a> 
								 
									 <a href="javascript:void(0)" onClick="confirm_go('입력된정보가 사라집니다. 정말 이동하시겠습니까?','./list.php?category=57r16&tb=&pg=');">
									 <img src='/easyauction/resources/images/btn_backtolist.gif' border='0'></a>
								</div>
								
								<div style="padding:30px;"></div>
								
				</form>
			</div>
		
		
		<!-- FOOTER -->
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	
	
	</div><!-- div wrap 끝 -->
	
	
	
	
	
	
</body>
</html>
