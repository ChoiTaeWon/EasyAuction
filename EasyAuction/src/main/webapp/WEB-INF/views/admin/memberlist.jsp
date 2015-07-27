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
	<!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="../../../js/jquery-1.7.2.min.js"></script> 
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="../../../js/trirand/i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="../../../js/trirand/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
    <link rel="stylesheet" type="text/css" media="screen" href="../../../css/jquery-ui.css" />
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="../../../css/trirand/ui.jqgrid.css" />
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
		  
		</div><!-- list 끝 -->
	</div>
</body>
</html>