function loadUserInfo(uid) {
    AJAX.call("userGet.jsp", { id: uid }, function(data) {
        try {
            const userInfo = JSON.parse(data);
            if (userInfo.error) {
                alert(userInfo.error);
                return;
            }
            $("#userId").text(userInfo.id);
            $("#userNickname").text(userInfo.nickname);
            $("#joinDate").text(userInfo.joinDate); // 가입일자 출력
        } catch (e) {
            console.error("사용자 정보 파싱 오류:", e);
            alert("사용자 정보를 불러오는 중 오류가 발생했습니다.");
        }
    });
}


function updateInfo() {
    // 정보 수정 페이지로 이동
    window.location.href = "userUpdate.jsp";
}

function withdrawal() {
    if(confirm("정말 탈퇴하시겠습니까?\n모든 데이터가 삭제됩니다.")) {
        const uid = $("#userId").text();
        AJAX.call("withdraw.jsp", { id: uid }, function(data) {
            if(data.trim() === "OK") {
                alert("탈퇴가 완료되었습니다.");
                window.location.href = "../wave.html";
            } else {
                alert("탈퇴 처리 중 오류가 발생했습니다.");
            }
        });
    }
}

function formatDate(timestamp) {
    const date = new Date(parseInt(timestamp));
    return date.getFullYear() + '-' + 
           String(date.getMonth() + 1).padStart(2, '0') + '-' + 
           String(date.getDate()).padStart(2, '0');
}