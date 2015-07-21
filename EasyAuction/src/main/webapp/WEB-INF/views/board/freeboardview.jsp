<%@page import="com.easyauction.dto.BoardComment"%>
<%@page import="java.util.List"%>
<%@page import="com.easyauction.dto.Member"%>
<%@page import="com.easyauction.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title>글쓰기</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body_style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
	<script type="text/javascript">
	function deleteBoard(boardNo, pageNo) {
		//1. 삭제 확인 (사용자 선택)
		var yes = confirm("삭제할까요");
		//2. 1의 결과에 따라 삭제하거나 또는 취소
		if (yes) {
			location.href = 'delete.action?boardno=' + boardNo + "&pageno=" + pageNo;
		}
	}
	
	function toggleCommentStatus(commentNo, editable) {
		document.getElementById('commentview' + commentNo).style.display 
		= editable ? "none" : "block";
		document.getElementById('commentedit' + commentNo).style.display 
		= editable ? "block" : "none";
	}
	function deleteComment(commentNo, boardNo, pageNo) {
		var yes = confirm(commentNo + "번 댓글을 삭제할까요?");
		if (yes) {
			location.href = 'deletecomment.action?' + 
				'commentno=' + commentNo + '&boardno=' + boardNo + '&pageno=' + pageNo;
		}
	}
	</script>
</head>
<body>

	<div id="pageContainer">
	
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">게시판 글 내용</div>
		       	<% Board board = (Board)request.getAttribute("board"); %>
		        <table>
		            <tr>
		                <th>제목</th>
		                <td><%= board.getBdTitle() %></td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td><%= board.getBdWriter() %></td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td><%= board.getBdDate() %></td>
		            </tr>
					<tr>
		                <th>조회수</th>
		                <td><%= board.getBdReadCount() %></td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td style="height:200px;vertical-align:top">		                    
		                   <%= board.getBdContent().replace("\r\n", "<br />") %>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">		        
		        <%
		        String pageNo = "1";
		        if (request.getParameter("pageno") != null) {
		        	pageNo = request.getParameter("pageno");
		        }
		        %>
		        	<% Member member = (Member)session.getAttribute("loginuser"); %>
		        	<% if (board.getBdWriter().equals(member.getMbId())) { //글의 작성자만 삭제 또는 편집 가능 %>
		        	[&nbsp;<a href="update.action?boardno=<%= board.getBdNo() %>&pageno=<%= pageNo %>">편집</a>&nbsp;]
		        	[&nbsp;<a href="javascript:deleteBoard(<%= board.getBdNo() %>, <%= pageNo %>);">삭제</a>&nbsp;]
		        	<% } %>
		        	[&nbsp;<a href="reply.action?boardno=<%= board.getBdNo() %>&pageno=<%= pageNo %>">댓글쓰기</a>&nbsp;]
		        	[&nbsp;<a href='list.action?pageno=<%= pageNo %>'>목록보기</a>&nbsp;]
		        </div>
		    </div>
		</div>
		
		<!------------------ comment 쓰기 영역 시작 -------------------->
		
		<br /><br />
		
		
		<form id="commentform" 
			action="writecomment.action" method="post">
			<input type="hidden" name="pageno" value="<%= pageNo %>" />
			<input type="hidden" name="bdno" value="<%= board.getBdNo() %>" />
			<input type="hidden" name="writer" value="<%= member.getMbId() %>" />
			<table style="width:600px;border:solid 1px;margin:0 auto">
	            <tr>
	                <td style="width:550px">	                	
	                    <textarea name="content" 
	                    	style="width:550px" rows="3"></textarea>
	                </td>
	                <td style="width:50px;vertical-align:middle">
	                	<a href="javascript:document.getElementById('commentform').submit();" style="text-decoration:none">
	                		댓글<br />등록
	                	</a>
	                </td>
	            </tr>                    
	        </table>
        </form>
        
        
        <hr align="center" style="width:600px;" />
        
        <!-------------------------------------------------------->
        <% List<BoardComment> comments = board.getComments(); %>
        <% if (comments == null || comments.size() == 0) { %>
        <h4 id="nodata" style="text-align:center">
            작성된 댓글이 없습니다.
        </h4>
        <% } else { %>
		
		<!-- comment 표시 영역 -->
		<table style="width:600px;border:solid 1px;margin:0 auto">
			<% for (BoardComment comment : comments) { %>
        	<tr>
        		<td style="text-align:left;margin:5px;border-bottom: solid 1px">
        		
        		<div id='commentview<%= comment.getBcNo() %>'>
                    <%= comment.getBcWriter() %>&nbsp;&nbsp;
                    [<%= comment.getBcRegdate() %>]
                    <br /><br />
                    <%= comment.getBcContent().replace("\r\n", "<br />") %>
                    <br /><br />
                    <div style='display:<%= member.getMbId().equals(comment.getBcWriter()) ? "block" : "none" %>'>
                    	<a href="javascript:toggleCommentStatus(<%= comment.getBcNo() %>, true);">편집</a>
                    	&nbsp;
                    	<a href="javascript:deleteComment(<%=comment.getBcNo()%>,<%=board.getBdNo()%>,<%= pageNo %>)">삭제</a>
                    </div>
                </div>                
                <div id='commentedit<%= comment.getBcNo() %>' style='display:none'>
                	<%= comment.getBcWriter() %>&nbsp;&nbsp;
                    [<%= comment.getBcRegdate() %>]					
					<br /><br />
					<form id="editcommentform<%= comment.getBcNo() %>" 
						action="updatecomment.action" method="post">
						<input type="hidden" name="commentno" value="<%= comment.getBcNo() %>" />
						<input type="hidden" name="boardno" value="<%= board.getBdNo() %>" />
						<input type="hidden" name="pageno" value="<%= pageNo %>" />
						<textarea name="content" 
							style='width:99%' rows="3"><%= comment.getBcContent() %></textarea>							
					</form>
					<br />
					<div>
						<a href="javascript:document.getElementById('editcommentform<%= comment.getBcNo() %>').submit();">수정</a> 
						&nbsp; 
						<a href="javascript:document.getElementById('editcommentform<%= comment.getBcNo() %>').reset();toggleCommentStatus(<%= comment.getBcNo() %>, false);">취소</a>
					</div>
				</div>
	
				</td>
        	</tr>
			<% } %>
        </table>
        
		<% } %>
		
		<br /><br /><br /><br /><br /><br /><br />
		
		</div>
	</div>

</body>
</html>