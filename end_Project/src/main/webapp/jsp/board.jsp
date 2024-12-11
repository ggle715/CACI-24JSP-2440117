<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="board_session_check.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="../css/core.css">
    <link rel="stylesheet" href="../css/board.css">
</head>
<body>
    <div class="container">
        <!-- 상단 메뉴 -->
        <div class="top-menu">
            <a href="../wave.html" class="menu-item">홈</a>
            <a href="userInfo.jsp" class="menu-item" onclick="goMyPage()">내정보</a>
            <a href="#" class="menu-item" onclick="logout()">로그아웃</a>
        </div>

        <!-- 게시판 목록 -->
        <div class="board-container">
            <div class="board-header">
                <h2>게시판</h2>
                <button class="write-btn" onclick="writePost()">글쓰기</button>
            </div>
            
            <div class="board-list">
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회</th>
                        </tr>
                    </thead>
                    <tbody id="boardList">
                    </tbody>
                </table>
            </div>
            
            <div class="pagination" id="pagination">
            </div>
        </div>
    </div>

	<script>
	    var JSP_PATH = ""; 
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../js/core.js"></script>
	<script src="../js/board.js"></script>
	<script>
	    $(document).ready(function() {
	        AJAX.call("session.jsp", null, function(data) {
	            var uid = data.trim();
	            if (uid == "null") {
	                alert("로그인이 필요한 서비스 입니다.");
	                window.location.href = "../login.html";
	            }
	            else {
	                loadBoardList();
	            }
	        });
	    });
	</script>	
</body>
</html>