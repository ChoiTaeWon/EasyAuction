<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
</head>

<body>
<table>
	<div id="wrap"> <!-- A 시작 -->
		<div id="top"><!-- 헤더 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div><!-- 헤더 끝 -->
	<div style="width: 1200px; "><!-- 헤더밑 부분 margin:0 auto;-->
	<div align="center">
	<tr>
		<td><img src="/easyauction/resources/images/freeboardmain.png" align="absmiddle" border="0">

			<div style="padding: 0px;"></div>

			<table width="727px" align="center" cellpadding="0" cellspacing="1"	bgcolor="#dcdcdc">
				<tr>
					<td bgcolor="#FFFFFF">

			<table width="100%" border="0" cellspacing="0" cellpadding="0"	align="center">
				<tr>
					<td style="padding-left: 5px;" height="20" background="color:gray"><h3>게시물 등록하기</h3></td>
				</tr>
			</table>

				<div style="padding: 5px;"></div> <!--구분-->

				<form action='register.action' method='post'><!-- 상대경로표시 -->
		    <table>
		       	<tr>
		        	<th>아이디(ID)</th>
		            	<td>
		            		<input type='text' id="id" name='memberId' style='width:200px' readonly="readonly" />
		            	</td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type='password' name='passwd' style='width:200px' />
		                </td>
		            </tr>
		            <tr>
		                <th>이메일</th>
		                <td>
		                	<input type='text' name='email' style='width:200px' />
		                </td>
		            </tr>
		            <tr>
		                <th>첨부자료1</th>
		                <td>
		                	<input type='text' name='email' style='width:200px' />
		                </td>
		            </tr>
		            <tr>
		                <th>첨부자료2</th>
		                <td>
		                	<input type='text' name='email' style='width:200px' />
		                </td>
		            </tr>
		            <tr>
		                <th>첨부자료3</th>
		                <td>
		                	<input type='text' name='email' style='width:200px' />
		                </td>
		            </tr>
		            <tr>
		                <th>제목</th>
		                <td>
		                	<input type='text' name='title' style='width:200px' />
		                </td>
		            </tr>
		            <tr>
						<th>내용</th>
						<td>		                    
							<textarea 
								name="content" cols="60" rows="12"></textarea>
						</td>
					</tr>
		        </table>
		        
				<div class='buttons' align="center">
		        	<input type='submit' value='등록' style='height:25px' />
		        	&nbsp;
		        	<input type='button' value='취소' style='height:25px'
		        		onclick="location.href='freeboard.action';" />
		        </div>
				</td>
			</tr>
		</table>
	</div>
</table>
<!-- 푸터  -->
<%-- <div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
</div>
<div style="width: 960px; ">
</div> --%>
<!-- 푸터 끝 -->
</body>
</HTML>