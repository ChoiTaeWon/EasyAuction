<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원리스트</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<link rel="stylesheet" media="screen" href="/easyauction/resources/js/css/ui.jqgrid.css" />
    <link rel="stylesheet" media="screen" href="/easyauction/resources/js/css/ui-redmond/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript" src="/easyauction/resources/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="/easyauction/resources/js/i18n/grid.locale-en.js"></script>
    <script type="text/javascript"> 
        $(function () {
        	$ ( "#tabs" ).tabs ();
            $("#memberReport").jqGrid({
                url: 'repmember.action',
                mtype: "POST",
                datatype: "json",
                colNames: ['신고번호','신고자','신고일','신고대상(번호)','내용'],
                colModel: [
                    { name: 'mrpNo', key: true, width: 60, align: 'center'},
                    { name: 'mrpRepoter', width: 80, align: 'center'},
 					{ name:'mrpDate', width: 80, search: false, align:'center', formatter: 'date', formatoptions: {newformat:'Y-m-d'} },
 					{ name: 'mrpTarget', width: 150, align: 'center' },
                    { name: 'mrpContent', width: 250, search: false, align: 'center'}
                ],
                loadError : function(xhr, status, error) {
                	console.log(error);
                },
                loadComplete: function() {
                    $("tr.jqgrow:even").css("background", "#ffffff");
                    $("tr.jqgrow:odd").css("background", "#E6E6E6");	
				
                },
				loadonce:true, // just for demo purpose
                width: 780,
                height: 500,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'mrpNo',
                pager: "#memberReportPager",
				viewrecords: true,
            });
			$("#memberReport").jqGrid("navGrid","#memberReportPager",{add:false, edit:false, del:false, view:true});
            
			$("#auctionReport").jqGrid({
                url: 'repauction.action',
                mtype: "POST",
                datatype: "json",
                colNames: ['신고번호','신고자','신고일','신고대상(번호)','내용'],
                colModel: [
                    { name: 'arpNo', key: true, width: 60, align: 'center'},
                    { name: 'arpRepoter', width: 80, align: 'center'},
 					{ name:'arpDate', width: 80, search: false, align:'center', formatter: 'date', formatoptions: {newformat:'Y-m-d'} },
 					{ name: 'arpTagetNo', width: 150, align: 'center' },
                    { name: 'arpContent', width: 250, search: false, align: 'center'}
                ],
                loadError : function(xhr, status, error) {
                	console.log(error);
                },
                loadComplete: function() {
                    $("tr.jqgrow:even").css("background", "#ffffff");
                    $("tr.jqgrow:odd").css("background", "#E6E6E6");	
				
                },
				loadonce:true, // just for demo purpose
                width: 780,
                height: 500,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'arpNo',
                pager: "#auctionReportPager",
				viewrecords: true,
            });
			$("#auctionReport").jqGrid("navGrid","#auctionReportPager",{add:false, edit:false, del:false, view:true});       
        });

    </script>
</head>
<body>
	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
	<br />
	<div style="width: 960px; "><!-- 헤더밑 부분 margin:0 auto;-->
		<div style="width:150px;float: left; margin:0 0 0 0;"><!-- 사이드메뉴 -->
			<c:import url="/WEB-INF/views/admin/sidemenu.jsp" />
		</div><!-- 사이드메뉴 끝 -->
	</div>
		<div style="width: 800px; float:right;"><!-- list -->
			<table width="100%">
			 <tr>
			  <td align="center"><a href="#"><img width="800" src="/easyauction/resources/images/admin_image.png"></td>
			 </tr>
			</table>
		<div style="padding:5px;"></div>
			<table width="100%">
			 <tr height="30">
				<td align="left">&nbsp;</td>
				<td align="right"><img src='/easyauction/resources/images/ico_home.gif'>관리자 페이지</td>
			 </tr>
			</table>
		<div id="tabs">
		  <ul>
   			<li><a href="#tabs-1">회원신고리스트</a></li>
  			<li><a href="#tabs-2">경매신고리스트</a></li>
   			<li><a href="#tabs-3">게시판신고리스트</a></li> 
 		 </ul>
		<div id="tabs-1">	
		 <table id="memberReport"></table>
   		 <div id="memberReportPager"></div>
   		</div>
		<div id="tabs-2">	
		 <table id="auctionReport"></table>
   		 <div id="auctionReportPager"></div>
   		</div>
		<div id="tabs-3">	
   		</div>
   		</div>
		</div><!-- list 끝 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
		<div style="width: 960px;">
	</div>
</body>
</html>