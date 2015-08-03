<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>자유게시판</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.bcedit').click(function(event){
			var bcno = $(this).attr('id').substr(1);//두번째 문자부터 끝까지 읽으세요
		
			$("#comment_row_view" + bcno).css("display", "none");
			$("#comment_row_edit" + bcno).css("display", "block");
			
		})
		
		$('.bcedit_cancel').click(function(event){			
			var bcno = $(this).attr('id').substr(1);
			
			$("#comment_row_view" + bcno).css("display", "block");
			$("#comment_row_edit" + bcno).css("display", "none");
		})
		
		$('.bcsujung').click(function(event){			
			var bcNo = $(this).attr('id').substr(1);			
			var bcContent = $("#bcContent" + bcNo).val();//수정하기 위해 입력한 내용
			
			//location.href="/easyauction/board/freeboard.action?bcno=" + bcno +"&bcontent=" + bcContent;
			  $.ajax({
				url : '/easyauction/board/updatefreeboardcomment.action',
				type : "POST",
				async : true,
				data : {
					bcNo : bcNo,
					bcContent : bcContent
					},
				success : function(data) {
					 if (data=="${success}") {
						console.log(data);
					}else{
						$("#vc" + bcNo).text(bcContent);
						$("#comment_row_view" + bcNo).css("display", "block");
						$("#comment_row_edit" + bcNo).css("display", "none");
					} 
					console.log(data);
				},
				error : function(xhr, status, er) {
					alert("error");
				}
			});
		})
	})
	</script>
	
</head>
<body>

	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
		<br /><br />
		<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
			<div style="width:216px;float: left; margin:0 0 0 0;"><!-- 사이드메뉴 -->
			  <c:import url="/WEB-INF/views/board/sidemenu.jsp" />
			</div><!-- 사이드메뉴 끝 -->
			<div style="width: 730px; float:right;"><!-- list -->
			
			<!--내용-->
			<div id="contents_wrap">
				
			<table cellpadding="0" cellspacing="0" border="0" width="730" height="96" background="#">
			<tr>
				<td style="padding-left:25px;"><img src="/easyauction/resources/images/freeboardmain.png"></td>
			</tr>
			</table>
				
				
			<div style="padding:5px;"></div>
			
			<table width="100%">
			<tr height="30">
				<!-- 오른쪽 위 자유게시판 -->
				<td align="left">&nbsp;</td>
								  
				<td align="right"><a href='/easyauction/board/freeboard.action'><img src='/easyauction/resources/images/housefreeboard.png'></a>  
								  <a href='/easyauction/board/freeboard.action'><img src='/easyauction/resources/images/freeboardsmall.png'></a>
				</td>
			</tr>
				
				<table width="100%">
					<tr>
						<td height="1" bgcolor="#e6e6e6"></td>
					</tr>
					<tr>
						<td height="26" bgcolor="#f8f8f8">
							<table width="100%">
								<tr>
									<td align="center" class="smfont"><font color="#666666">제목</font></td>
									<td width="1" bgcolor="#e6e6e6"></td>
									<td align="center" class="smfont" width="90"><font color="#666666">작성자</font></td>
									<td width="1" bgcolor="#e6e6e6"></td>
									<td align="center" class="smfont" width="90"><font color="#666666">작성일자</font></td>
									<td width="1" bgcolor="#e6e6e회"></td>
									<td align="center" class="smfont" width="40"><font color="#666666">조회</font></td>
								</tr>
							</table>
						</td>		
					</tr>
					<tr>
						<td height="1" bgcolor="#e6e6e6"></td>
					</tr>		
				 </table>
				 <div style="padding:3px;"></div>
				 <table width="100%">
				 	<tr height="26">
				 	  <td align="left" style="padding-left:10px;"><b>${ view.bdTitle }</b></td>
				 	  <td width="1"></td>
				 	  <td width="90" align="center">${ view.bdWriter }</td>
				 	  <td width="1"></td>
				 	  <td width="90" align="center">${ view.bdDate }</td>
				 	  <td width="1"></td>
				 	  <td align="center" width="40">${ view.bdReadCount }</td>
				 	 <%--  <td width="1"></td>
				 	  <td align="center" width="40">${ view.bdBlindCheck }</td> --%>
				 	</tr>
				 	
				 	<table border='0' width='100%' cellspacing='0' cellpadding='0'>
					<tr>
						<td width='140' style='padding-top:10px;padding-bottom:10px;'><img src='bbs_img/bbs_reply_manicon.gif' border='0' align='absmiddle'> <b>${ comment.bcWriter }</b></td>
						<td width='600' align='left'>${ comment.bcContent }&nbsp;&nbsp;<font color='#cacaca' style='font-size:11px;'>${ comment.bcRegdate }</font>
						<!-- 내용 옆 수정 삭제 -->
						<td align="right"><a href='/easyauction/board/updatefreeboard.action?bdno=${ view.bdNo }&pageno=${ pageno }'><img src='/easyauction/resources/images/sujung.png'></a>
										  <a href='/easyauction/board/deletefreeboard.action?bdno=${ view.bdNo }&pageno=${ pageno }'><img src='/easyauction/resources/images/delete.png'></a>
						</td>
						
						</td>
						<td width='50'></td>
					</tr>
					<tr>
						<td colspan="3" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
					</tr>
				</table>
				    <tr>
						<td height="3" colspan="14" background="/easyauction/resources/images/bg_line_dot.gif"></td>
					</tr>
					<tr>
						<td style="padding:15 0 20 0;">
						<div  id="ct" class="WYS" align="justify" style="font-size:12px; line-height:21px; border:0px solid red; word-break:break-all;">
							<div style="border-bottom: red 0px solid; border-left: red 0px solid; line-height: 1.6; font-size: 14px; word-break: break-all; border-top: red 0px solid; border-right: red 0px solid" id="ct" align="justify"><br />
							<table>
								<tr>
								 <c:forEach var="images" items="${ view.boardImage }">
								  <td><img src="/easyauction/resources/imagefile/${ images.bdImgName }"><br /></td>
								 </c:forEach>
								</tr>
								<tr>
								  <td>${ view.bdContent }</td>
								</tr>
							</table>
							</div>
						</div>
						</td>
					</tr>
				 </table>
				 <div style="padding:3px;"></div>
				<!-- 댓글 // 시작 -->
				<table width="100%" border="0">
					<tr>
						<td height="2px" bgcolor="#EBEBEB"></td>
					</tr>
					<tr>
						<td height="20px" align="left" style="background-color:#F4F4F4;"><font color="">&nbsp;&nbsp;<img src="/easyauction/resources/images/ico_arrow_01.gif" width="9px" height="9px" border="0" align="absmiddle">&nbsp;&nbsp;comment</b></font></td>
					</tr>
					<tr>
						<td height="2px"  bgcolor="#EBEBEB"></td>
					</tr>
				</table>
				<c:forEach var="comment" items="${ view.comments }">
				<table border='0' width='100%' cellspacing='0' cellpadding='0'>
					<tr id="comment_row_view${ comment.bcNo }" style="display: block">
						<td width='140' style='padding-top:10px;padding-bottom:10px;'>
							<img src='bbs_img/bbs_reply_manicon.gif' border='0' align='absmiddle' />
							<b>${ comment.bcWriter }</b>
						</td>
						<td width='600' align='left' class="bccontent">
							<span id="vc${ comment.bcNo }">${ comment.bcContent }</span>&nbsp;&nbsp;
							<font color='#cacaca' style='font-size:11px;'>${ comment.bcRegdate }</font>
						</td>
						<!-- 댓글 옆 수정 삭제 -->
						<td align="right">
							<%-- <a href='/easyauction/board/updatefreeboardcomment.action?bdno=${ view.bdNo }&bcno=${ comment.bcNo }&pageno=${ pageno }'> --%>
							<img src='/easyauction/resources/images/sujung.png' id="e${ comment.bcNo }" class='bcedit'><!-- </a> -->
							<a href='/easyauction/board/deletefreeboardcomment.action?bdno=${ view.bdNo }&bcno=${ comment.bcNo }&pageno=${ pageno }'>
								<img src='/easyauction/resources/images/delete.png'>
							</a>
						</td>
						<td width='50'></td>
					</tr>
					<tr id="comment_row_edit${ comment.bcNo }" style="display:none">
						<td width='140' style='padding-top:10px;padding-bottom:10px;'>
							<img src='bbs_img/bbs_reply_manicon.gif' border='0' align='absmiddle' /> 
							<b>${ comment.bcWriter }</b>
						</td>
						<td width='600' align='left' class="bccontent">
							<textarea name="bcContent" id="bcContent${ comment.bcNo }">${ comment.bcContent }</textarea>
						</td>
						<!-- 댓글 옆 수정 삭제 -->
						<td align="right">
							<img src='/easyauction/resources/images/sujung.png' id='u${ comment.bcNo }' class="bcsujung">
							<img src='/easyauction/resources/images/list1.png' id="c${ comment.bcNo }" class="bcedit_cancel">							
						</td>
						<td width='50'></td>
					</tr>
					<tr>
						<td colspan="3" style="height:1px; background:url(img/line_02.gif); width:100%;"></td>
					</tr>
				</table>
				</c:forEach>
				<form action='freeboardcomment.action' method='post'>
					<input type="hidden" name="bdno" value="${ view.bdNo }" /> 
					<input type="hidden" name="writer" value="${ view.bdWriter }" />
					<input type="hidden" name="pageno" value="${ pageno }" />
					<%-- <input type="hidden" name="pageno" value="${ pageno }" /> --%>
					<table border='0' width='100%' cellspacing='0' cellpadding='0'>
						<tr>
							<td>
								<textarea style='width:95%' rows=4 name=content style='font-size:12px; height:35;'></textarea>
							</td>
							<td align=right  width=80>
								<input type=image src=/easyauction/resources/images/memo_add.gif onclick="document.forms[0].submit();" />
							</td>
						</tr>
					</table>
				</form>
				<!-- 댓글 // 끝 -->
			</div><!-- list 끝 -->
		</div>
	</div> <!-- A 끝 -->	
</body>
</html>