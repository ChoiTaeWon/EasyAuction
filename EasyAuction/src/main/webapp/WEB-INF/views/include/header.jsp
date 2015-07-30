<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript"> 
	var sidebarurl = "http://localhost:8081/easyauction"; // Change as required 
	var sidebartitle = "이지옥션EasyAuction"; // Change as required 
	var url = this.location; 
	var title = document.title; 
	
	function bookmarksite() { 
		if(document.all)
		   {
		       window.external.AddFavorite(url, title); 
		       
		   }
		   // Google Chrome
		   else if(window.chrome){
		      alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
		      
		   }
		   // Firefox
		   else if (window.sidebar) // firefox 
		   {
		       window.sidebar.addPanel(title, url, ""); 
		       
		   }
		   // Opera
		   else if(window.opera && window.print)
		   { // opera 
		      var elem = document.createElement('a'); 
		      elem.setAttribute('href',url); 
		      elem.setAttribute('title',title); 
		      elem.setAttribute('rel','sidebar'); 
		      elem.click(); 
		   }
	 } 
	$(function(){
		$("#message").click(function(event) {
			alert('${loginuser.mbId}');
			var mbId = '${loginuser.mbId}';
			window.open("/easyauction/message/receivemessages.action?mbId=" + mbId, "쪽지함",
				"width=700,height=500,titlebar=no");
		})
		$(".findMember").click(function(event){
			$(location).attr('href','/easyauction/member/email.action?locationurl=' + $(this).attr('id'));
			event.preventDefault();//원래 요소의 이벤트에 대한 기본 동작 수행 막는 코드
		})


		var mbId = '${loginuser.mbId}';
		if(mbId != null && mbId.length > 0){
			var time = 1000 * 60 * 60;           //1초 * 60 * 60
			setInterval("ajaxmessgecount()", time);
		}
	})
	function ajaxmessgecount(mbId){
		var mbId = '${loginuser.mbId}';
		$.ajax({
			url : "/easyauction/ajax/messagecheck.action?mbId=" + mbId,
			async : true,
			data : {},
			method : "GET",
			success : function(result, status, xhr) {
				if (result != 0){
					$("#message").attr("src", "/easyauction/resources/images/ico_mail_on.gif");
				} else {
					$("#message").attr("src", "/easyauction/resources/images/ico_mail.gif");
				}
				
			},
			error : function(xhr, status, ex) {
				//alert(status+ex); 
			}
		})
		$("#message").attr("src", "/easyauction/resources/images/ico_mail_on.gif"); 
	}

 </script>
			<table style="width:960px; height:40px; background-color:#565DD3;">
				<tr>
					<td align="right" style="padding:5px 10px 10px 0;" colspan="3">
						<table class="main_top" >
									<tr>
										 <c:choose><c:when test="${ sessionScope.loginuser ne null }"> 
							                <td class="smfont3">${ loginuser.mbName }
 
							                	<img src="/easyauction/resources/images/ico_mail.gif" id="message" />
							               		</td>
							                <td class="smfont3">│</td>
											<td class="smfont3"><a href="/easyauction/member/viewmypage.action?mbId=${loginuser.mbId}">마이페이지</a></td>
											<td class="smfont3">│</td>
											<td class="smfont3"><a href="/easyauction/account/logout.action"><img src="/easyauction/resources/images/btn_logout.gif"></a></td>
							          </c:when><c:otherwise>
										<td><a href="/easyauction/account/login.action"><img src="/easyauction/resources/images/btn_login.gif" title="로그인"></a>&nbsp;&nbsp;</td>
										<td class="smfont3">│</td>
										<td><a href="/easyauction/member/register.action">회원가입</a></td>
										<td class="smfont3">│</td>
										<td><a href="#" class="findMember" id="findmbId">아이디찾기</a></td>
										<td class="smfont3">│</td>
										<td><a href="#" class="findMember" id="findPasswd">비밀번호찾기</a></td>
										<td class="smfont3">│</td>
										<td><a href="#">상품평보기</a></td>
							         </c:otherwise></c:choose>
									</tr>
						</table>
					</td>
				</tr>
		
				<tr>
					<td style="padding-left:10px; width:170px;"><!-- <img src='banner_view.php?n umber=54' width='167' height='61' border=0 align='absmiddle' style='cursor:hand'> --></td>
					<td style="padding-bottom:10px;"align="center"><a href="/easyauction/home.action" onFocus="this.blur();"><img src="/easyauction/resources/images/mainlogo.png" title="메인으로"></td>
					<td align="right" style="padding:0 10px 5px 0; width:130px;" valign="bottom">
						<a href="#favorite" onclick="javaScript:bookmarksite();"><img src="/easyauction/resources/images/ico_favo.gif" title="즐겨찾기" style="margin-right:10px;"></a>
					</td>
				</tr>
			</table>
			
			
					<table style="margin-top:0.5px; width: 960px;background-color: none; background-image:url('/easyauction/resources/images/topmenu.png');">
						<tr>
							<td style="width: 60%;height:30px;">
								<ul class="main_top_menu">
									<li class="smfont10"><a href="/easyauction/admin/memberlist.action">관리자</a></li>
									<li class="smfont10"><a href="#">경매 2</a></li>
									<li class="smfont10"><a href="/easyauction/board/freeboard.action">커뮤니티</a></li>
									<li class="smfont10"><a href="#">고객센터</a></li>
									<li class="smfont10"><a href="/easyauction/auction/auction.action">경매 ㄱㄱ</a></li>
									<li class="smfont10"><a href="/easyauction/direct/directdeal.action">직거래경매</a></li>
								</ul>
							
							</td>
							
							<td style="width: 28%;">
								<form name='frm_search' method='get' action='' style="margin:0;" onSubmit="return go_search()">
								<input type='hidden' name='action2' value='search'>
								<input type='hidden' name='tb' value=''>
								
									<table>
									<tr>
										<td>
											<div style="position:relative; left:82px; top:25px; z-index:0;">
													<div style="position:absolute; left:0px; top:0px; z-index:;">
														<div id="autoSearchPartWrap"><div id="autoSearchPart"></div></div>
													</div>
											</div>
									
											<select name='search_type' id="search_type">
											<option value='title'>물품명</option>
											<option value='number'>경매번호</option>
											<option value='id'>아이디</option>
											</select>
											<input type='text' id="search_word" name="search_word" value="" class='search'  onkeyup="startMethod(event.keyCode);" onkeydown="moveLayer(event.keyCode);" onmouseup="startMethod();" AUTOCOMPLETE="off">
											<input name="image" type="image" src='/easyauction/resources/images/btn_search_go.gif' title='검색하기' border="0" align="absmiddle">
										</td>
									</tr>
									</table>
								</form>
							</td>	
						</tr>
					</table>
			

