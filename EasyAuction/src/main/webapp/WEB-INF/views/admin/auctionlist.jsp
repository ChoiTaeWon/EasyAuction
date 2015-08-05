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
            $("#auctionGrid").jqGrid({
                url: 'auctionlist.action',
				editurl: 'aucstate.action',                
                mtype: "POST",
                datatype: "json",
                colNames: ['번호','타입','사진','경매명','카테고리', '경매자','낙찰자','경매상태'],
                colModel: [
                    { name: 'aucNo', key: true, width: 60, align: 'center'},
                    { name: 'aucType', width: 80, align: 'center', formatter: function(cellValue,options,rowObject){
                    	if(cellValue == true){
                    		return "직거래";
                    	}else{
                    		return "일반";
                    	}
                    }},
 					{ name:'auctionImage', jsonmap: 'auctionImage.0.aucImgName', width: 80, search: false, align: 'center', formatter: imageRead },
 					{ name: 'aucTitle', width: 150, align: 'center' },
                    { name: 'aucCategory', width: 150, align: 'center', formatter: category },
                    { name: 'aucWriter', width: 90, align: 'center' },
                    { name: 'aucGetter', width: 90, align: 'center'},
                    { name: 'aucState', width: 90, align: 'center', formatter: 'select', editable:true, edittype:'select', editoptions : {
                    		value:"0:경매시작전;1:경매중;2:경매마감;3:입금대기;4:결제완료;5:거래완료;6:블라인드"} }
                ],
                loadError : function(xhr, status, error) {
                	console.log(error);
                },
                loadComplete: function() {
                    $("tr.jqgrow:even").css("background", "#ffffff");
                    $("tr.jqgrow:odd").css("background", "#E6E6E6");
                    //$("tr.jqgrow:odd").addClass('myAltRowClass');
                    
/*                     $(".delete").click(function(event){
        				
        				//var data2 = $("#jqGrid").getCol('mbId');
        				if(confirm("정말 삭제하시겠습니까?")){
        					event.preventDefault();
                            var data = $(this).attr('value');
        					location.href = '/easyauction/admin/memberdelete.action?mbId='+data;
        				}
        			});	 */	
        			 var t = $("tr.jqgrow:odd td:nth(2)").text();
                },
				loadonce:true, // just for demo purpose
                width: 780,
                height: 500,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'aucNo',
                pager: "#auctionGridPager",
				viewrecords: true
            });
			$("#auctionGrid").jqGrid("navGrid","#auctionGridPager",{add:false, edit:true, del:false},
					{closeAfterEdit: true, reloadAfterSubmit: false}		
			);

			$("#auctionReport").jqGrid({
                url: 'aucreportlist.action',
                mtype: "POST",
                datatype: "json",
                colNames: ['번호','타입','사진','경매명','카테고리', '경매자','신고횟수','경매상태','관리자툴'],
                colModel: [
                    { name: 'aucNo', key: true, width: 60, align: 'center'},
                    { name: 'aucType', width: 80, align: 'center', formatter: function(cellValue,options,rowObject){
                    	if(cellValue == true){
                    		return "직거래";
                    	}else{
                    		return "일반";
                    	}
                    }},
                    { name:'auctionImage', jsonmap: 'auctionImage.0.aucImgName', width: 80, search: false, align: 'center', formatter: imageRead },
 					{ name: 'aucTitle', width: 150, align: 'center' },
                    { name: 'aucCategory', width: 150, align: 'center', formatter: category },
                    { name: 'aucWriter', width: 90, align: 'center' },
                    { name: 'aucReportingCount', width: 90, align: 'center', formatter:function(cellValue,options,rowObject){
                    	if(cellValue >=3 && cellValue <= 9){
                    		return "<font color='#DBA901'>"+cellValue+"회</font>"; 
                    	}else if(cellValue >=10){
                    		return "<font color='red'>"+cellValue+"회</font>";
                    	}else{
                    		return "<font color='black'>"+cellValue+"회</font>";
                    	}
                    }},
                    { name: 'aucState', width: 80, align: 'center', formatter: AuctionState},
                    { name: 'aucNo', width: 70, formatter: blindComplte }
                ],
                loadError : function(xhr, status, error) {
                	console.log(error);
                },
                loadComplete: function() {
                    $("tr.jqgrow:even").css("background", "#ffffff");
                    $("tr.jqgrow:odd").css("background", "#E6E6E6");

        			$(".aucblind").click(function(){
        				if(confirm("블라인드처리 하시겠습니까?")){
        					event.preventDefault();
        					var data = $(this).attr('value');
        					location.href='/easyauction/admin/blind.action?aucNo='+data;
        					alert("처리되었습니다.");
        				}
        			});
                },
				loadonce:true, // just for demo purpose
                width: 780,
                height: 500,
                rowNum: 20,
				rowList:[20,25,50],
				sortname: 'aucNo',
                pager: "#auctionReportPager",
				viewrecords: true
            });
			$("#auctionReport").jqGrid("navGrid","#auctionReportPager",{add:false, edit:false, del:false});			
        });
        function blindComplte(cellValue,options,rowObject){
        	var pat3 = "<a class='aucblind' href='#' value='"+cellValue+"'><img width=60 height=20 src='/easyauction/resources/images/member_icon_08.gif'></a>";
        	return pat3;
        }
        function imageRead(cellValue,options,rowObject){
          var img = "<a href='/easyauction/auction/showdeal.action?aucno="+rowObject.aucNo+"'><img width=80 height=50 src='/easyauction/resources/imagefile/"+cellValue+"'></a>";	
          return img;
        }
        function category(cellValue,options,rowObject){
        	if(cellValue == 1){return "의류/패션용품";}
        	else if(cellValue == 2){return "국내화장품";}
        	else if(cellValue == 3){return "컴퓨터/주변기기/게임";}
        	else if(cellValue == 4){return "해외화장품/향수";}
        	else if(cellValue == 5){return "출산용품/유아용품";}
        	else if(cellValue == 6){return "자연식품/식재료";}
        	else if(cellValue == 7){return "가공식품/건강/음료";}
        	else if(cellValue == 8){return "가구/생활용품";}
        	else if(cellValue == 9){return "악기/음악관련상품";}
        	else if(cellValue == 10){return "프라모델/문구/사무";}
        	else if(cellValue == 11){return "디지털/가전제품";}
        	else if(cellValue == 12){return "스포츠/성인/상품권";}
        	else if(cellValue == 13){return "자동차/관련용품";}
        	else if(cellValue == 14){return "도서/티켓/서비스";}
        	else{return "출력될 매물 디렉토리";}
        }

        function adminTool(){
        	var pat3 = "<a href='/easyauction/admin/black.action?mbId="+cellValue+"'><img src='/easyauction/resources/images/member_icon_08.gif'></a>";
        	return pat3;
        }

		function AuctionState(cellValue,options,rowObject){
        	if(cellValue == 0){return "경매 시작 전";}
        	else if(cellValue == 1){return "경매 중";}
        	else if(cellValue == 2){return "경매 마감";}
        	else if(cellValue == 3){return "입금 대기";}
        	else if(cellValue == 4){return "결제 완료";}	
        	else if(cellValue == 5){return "거래 완료";}
        	else if(cellValue == 6){return "블라인드";}
        	else {return "상태 오류";}
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
   			<li><a href="#tabs-1">경매리스트</a></li>
   			<li><a href="#tabs-2">신고받은경매</a></li>
 		 </ul>
		<div id="tabs-1">	
		 <table id="auctionGrid"></table>
   		 <div id="auctionGridPager"></div>
   		</div>
		<div id="tabs-2">	
		 <table id="auctionReport"></table>
   		 <div id="auctionReportPager"></div>
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