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
	
    <link rel="stylesheet" href="/easyauction/resources/js/css/ui-redmond/jquery-ui.css" />
    <link rel="stylesheet" href="/easyauction/resources/js/css/ui.jqgrid.css" />		
    <script src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="/easyauction/resources/js/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="/easyauction/resources/js/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                url: 'data.json',
                mtype: "GET",
                datatype: "json",
                colModel: [
                    { label: '회원번호', name: '', key: true, width: 75 },
 					{ label: '아이디', name: '', width: 150 },
                    { label: '회원명', name: '', width: 150 },
                    { label: '성별', name: '', width: 75 },
                    { label: '이메일', name: '', width: 150 },
                    { label: '연락처', name: '', width: 150 },
                    
                ],
				loadonce:true, // just for demo purpose
                width: 730,
                height: 250,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'OrderDate',
                pager: "#jqGridPager",
				viewrecords: true,
            });
			$("#jqGrid").jqGrid("navGrid","#jqGridPager",{add:false, edit:false, del:false});
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
		<div style="width:216px;float: left; margin:0 0 0 0;"><!-- 사이드메뉴 -->
			<c:import url="/WEB-INF/views/admin/sidemenu.jsp" />
		</div><!-- 사이드메뉴 끝 -->
	</div>
		<div style="width: 730px; float:right;"><!-- list -->
		 <table id="jqGrid"></table>
   		 <div id="jqGridPager"></div>    
		</div><!-- list 끝 -->
	</div>
</body>
</html>