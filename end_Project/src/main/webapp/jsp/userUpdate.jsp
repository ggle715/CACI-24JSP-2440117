<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="board_session_check.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보 수정</title>
    <link rel="stylesheet" href="../css/core.css">
    <link rel="stylesheet" href="../css/userInfo.css">
</head>
<body>
    <div class="container">
        <div class="user-container">
            <div class="user-header">
                <h2>정보 수정</h2>
            </div>
            
            <div class="user-info">
                <form id="updateForm">
                    <div class="info-item">
                        <label>아이디</label>
                        <span id="userId"></span>
                        <input type="hidden" name="id" id="userIdInput">
                    </div>
                    <div class="info-item">
                        <label>닉네임</label>
                        <input type="text" name="nickname" id="userNickname" required>
                    </div>
                    <div class="info-item">
                        <label>비밀번호</label>
                        <input type="password" name="password" required>
                    </div>
                </form>
            </div>

            <div class="button-group">
                <button class="update-btn" onclick="submitUpdate()">수정하기</button>
                <button class="cancel-btn" onclick="goBack()">취소</button>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../js/core.js"></script>
    <script>
        $(document).ready(function() {
            Page.init(loadUserInfo);
        });

        function loadUserInfo(uid) {
            AJAX.call("userGet.jsp", { id: uid }, function(data) {
                try {
                    const userInfo = JSON.parse(data);
                    $("#userId").text(userInfo.id);
                    $("#userIdInput").val(userInfo.id);
                    $("#userNickname").val(userInfo.name);
                } catch(e) {
                    console.error("사용자 정보 파싱 오류:", e);
                    alert("사용자 정보를 불러오는데 실패했습니다.");
                }
            });
        }

        function submitUpdate() {
            const formData = new FormData($("#updateForm")[0]);
            const jsonData = {};
            formData.forEach((value, key) => jsonData[key] = value);
            
            AJAX.call("userUpdateProc.jsp", {
                id: jsonData.id,
                jsonstr: JSON.stringify(jsonData)
            }, function(data) {
                if(data.trim() === "OK") {
                    alert("정보가 수정되었습니다.");
                    window.location.href = "userInfo.jsp";
                } else {
                    alert("정보 수정에 실패했습니다.");
                }
            });
        }

        function goBack() {
            window.location.href = "userInfo.jsp";
        }
    </script>
</body>
</html>