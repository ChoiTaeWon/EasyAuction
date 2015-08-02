<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div style='float: left;' class='herf_link'>
<table style="border-collapse: collapse; width: 216px;"><!-- 사이드메뉴 헤더 -->
	<tr>
		<td><a href="#" onFocus="this.blur();"><img src="/easyauction/resources/images/tit_community.gif" title="커뮤니티"></a></td>
	</tr>
</table>
<!-- 사이드메뉴헤더끝 -->
<table style="border:1px solid #DEDEDE; border-collapse: collapse; background-color:#F8F8F8;" width="216"><!-- 사이드메뉴 몸통 -->
	<tr>
		<td>
		  <table cellspacing='0' cellpadding='0' border='0' width='100%'>
		   <tr>
		    <td>
		     <table width='100%'>
		      <tr>
		       <td style="padding-top: 10px">
		        <img src="/easyauction/resources/images/ico_dot_02.gif" style="margin:0 10px 0 20px;">
		         <a href="#" onFocus="this.blur();">
		           <b><a href="/easyauction/member/viewmypage.action?mbId=${ loginuser.mbId }" class="bbs_menu_name">마이페이지</b>
		         </a>
		       </td>
		       <tr>
		       <td style="padding-top: 10px">
		        <img src="/easyauction/resources/images/ico_dot_02.gif" style="margin:0 10px 0 20px;">
		         <a href="#" onFocus="this.blur();">
		           <b><a href="/easyauction/member/viewmyauctionpage.action?mbId=${ loginuser.mbId }" class="bbs_menu_name">내 경매물품</b>
		         </a>
		       </td>
		       </tr>
		       <tr>
		       <td style="padding-top: 10px">
		        <img src="/easyauction/resources/images/ico_dot_02.gif" style="margin:0 10px 0 20px;">
		         <a href="#" onFocus="this.blur();">
		           <b><a href="/easyauction/member/viewmygetauctionpage.action?mbId=${ loginuser.mbId }" class="bbs_menu_name">낙찰된 경매</b>
		         </a>
		       </td>
		       <tr>
		       <td style="padding-top: 10px">
		        <img src="/easyauction/resources/images/ico_dot_02.gif" style="margin:0 10px 0 20px;">
		         <a href="#" onFocus="this.blur();">
		           <b><a href="/easyauction/member/view.action?mbId=${ loginuser.mbId }" class="bbs_menu_name">내 정보 수정</b>
		         </a>
		       </td>
		      </tr>
		      <tr>
	       		<td style="padding-top: 10px">
		        <img src="/easyauction/resources/images/ico_dot_02.gif" style="margin:0 10px 0 20px;">
		         <a href="#" onFocus="this.blur();">
		           <b><a href="/easyauction/member/deletemember.action?mbId=${ loginuser.mbId }" class="bbs_menu_name">회원탈퇴</b>
		         </a>
		       	</td>
		       </tr>
		     </table>
		    </td>
		   </tr>
		  </table>
		</td>
	</tr>
</table>		
</div>
<!-- 사이드 메뉴 -->
