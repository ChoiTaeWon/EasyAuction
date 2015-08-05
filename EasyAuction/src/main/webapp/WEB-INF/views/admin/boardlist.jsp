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
            $("#boardGrid").jqGrid({
                url: 'boardlist.action',
                mtype: "POST",
                datatype: "json",
                colNames: ['번호','타입','글제목','게시자','등록일','관리자툴'],
                colModel: [
                    { name: 'bdNo', key: true, width: 60, align: 'center'},
                    { name: 'bdType', width: 60, align: 'center', formatter: stateBoard},
 					{ name:'bdTitle', width: 150, search: false, align: 'center'},
 					{ name: 'bdWriter', width: 100, align: 'center' },
                    { name: 'bdDate', width: 100, align: 'center'},
                    { name: 'bdNo', width: 120, search: false}
                ],
                loadError : function(xhr, status, error) {
                	console.log(error);
                },
                loadComplete: function() {
                    $("tr.jqgrow:even").css("background", "#ffffff");
                    $("tr.jqgrow:odd").css("background", "#E6E6E6");
        			 var t = $("tr.jqgrow:odd td:nth(2)").text();
                },
				loadonce:true, // just for demo purpose
                width: 780,
                height: 500,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'bdDate',
                pager: "#boardGridPager",
				viewrecords: true
            });
			$("#boardGrid").jqGrid("navGrid","#boardGridPager",{add:false, edit:false, del:false},
					{closeAfterEdit: true, reloadAfterSubmit: false});
			
            $("#boardReport").jqGrid({
                url: 'boardreportlist.action',
                mtype: "POST",
                datatype: "json",
                colNames: ['번호','타입','글제목','게시자','신고횟수','관리자툴'],
                colModel: [
                    { name: 'bdNo', key: true, width: 60, align: 'center'},
                    { name: 'bdType', width: 60, align: 'center', formatter: stateBoard},
 					{ name:'bdTitle', width: 150, align: 'center'},
 					{ name: 'bdWriter', width: 100, align: 'center' },
                    { name: 'bdReportingCount', width: 100, align: 'center', formatter: function(cellValue,options,rowObject){
                    	return cellValue + "회";
                    }},
                    { name: 'bdNo', width: 120, search: false}
                ],
                loadError : function(xhr, status, error) {
                	console.log(error);
                },
                loadComplete: function() {
                    $("tr.jqgrow:even").css("background", "#ffffff");
                    $("tr.jqgrow:odd").css("background", "#E6E6E6");
        			 var t = $("tr.jqgrow:odd td:nth(2)").text();
                },
				loadonce:true, // just for demo purpose
                width: 780,
                height: 500,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'bdReportingCount',
                pager: "#boardReportPager",
				viewrecords: true
            });
			$("#boardReport").jqGrid("navGrid","#boardReportPager",{add:false, edit:false, del:false},
					{closeAfterEdit: true, reloadAfterSubmit: false});
        })
        function stateBoard(cellValue,options,rowObject){
        	if(cellValue == "2"){
        		return "자유게시판";
        	}else if(cellValue == "3"){
        		return "포토후기";
        	}
        }

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
   			<li><a href="#tabs-1">게시판리스트</a></li>
   			<li><a href="#tabs-2">신고받은게시판</a></li>
 		 </ul>
		<div id="tabs-1">	
		 <table id="boardGrid"></table>
   		 <div id="boardGridPager"></div>
   		</div>
		<div id="tabs-2">	
		 <table id="boardReport"></table>
   		 <div id="boardReportPager"></div>
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