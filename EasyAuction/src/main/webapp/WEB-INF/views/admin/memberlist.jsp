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
    <script type="text/javascript" src="/easyauction/resources/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="/easyauction/resources/js/i18n/grid.locale-en.js"></script>
    <script type="text/javascript"> 
        $(function () {
            $("#jqGrid").jqGrid({
                url: 'memberlist.action',
                mtype: "POST",
                datatype: "json",
                colNames: ['아이디','연락처','이메일','회원명','성별','가입일','관리자툴'],
                colModel: [
                    { name: 'mbId', index:'mbId', key: true, width: 80 },
 					{ name: 'mbPhone2', index:'mbPhone2', width: 150 },
 					{ name: 'mbEmail', index:'mbEmail', width: 150 },
                    { name: 'mbName', index:'mbName', width: 100 },
                    { name: 'mbGender', index:'mbGender', width: 75, formatter: function(cellValue,options,rowObject){
                        if(cellValue == false) {
                        	return '<font color="blue">'+'남자'+'</font>';
                        }else if(cellValue == true){
                        	return '<font color="#FF3399">'+'여자'+'</font>';
                        }
                    }},
                    { name: 'mbRegdate', index:'mbRegdate', width: 150, formatter: 'date', formatoptions: {srcformat:'Y-m-d h:i A',newformat:'Y-m-d'}},
                    { name: 'adminTool', width: 150 }
                ],
                loadError : function(xhr, status, error) {
                	console.log(error);
                },
                loadComplete: function() {
                    $("tr.jqgrow:even").css("background", "#ffffff");
                    $("tr.jqgrow:odd").css("background", "#E6E6E6");
                    //$("tr.jqgrow:odd").addClass('myAltRowClass');
                },
				loadonce:true, // just for demo purpose
                width: 730,
                height: 500,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'mbRegdate',
                pager: "#jqGridPager",
				viewrecords: true
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