<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="board_session_check.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보</title>
    <link rel="stylesheet" href="../css/core.css">
    <link rel="stylesheet" href="../css/userInfo.css">
</head>
<body>
    <div class="container">
        <!-- 상단 메뉴 -->
        <div class="top-menu">
            <a href="board.jsp" class="menu-item">게시판</a>
            <a href="../wave.html" class="menu-item">홈</a>
            <a href="#" class="menu-item" onclick="logout()">로그아웃</a>
        </div>

        <div class="user-container">
            <div class="user-header">
                <h2>내 정보</h2>
            </div>
            
            <div class="user-info">
                <div class="info-item">
                    <label>아이디</label>
                    <span id="userId"></span>
                </div>
                <div class="info-item">
                    <label>닉네임</label>
                    <span id="userNickname"></span>
                </div>
                <div class="info-item">
                    <label>가입일</label>
                    <span id="joinDate"></span>
                </div>
            </div>

            <div class="button-group">
                <button class="update-btn" onclick="updateInfo()">정보 수정</button>
                <button class="delete-btn" onclick="withdrawal()">회원 탈퇴</button>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../js/core.js"></script>
    <script src="../js/userInfo.js"></script>
    <script>
        $(document).ready(function() {
            Page.init(loadUserInfo);
        });
    </script>
</body>
</html>