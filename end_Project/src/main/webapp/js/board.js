$(document).ready(function() {
    Page.init(loadBoardList);
});

function loadBoardList() {
    $.ajax({
        url: 'boardList.jsp',
        type: 'GET',
        success: function(data) {
            if (data.trim() === "ER") {
                alert("게시글을 불러오는데 실패했습니다.");
                return;
            }
            
            try {
                const posts = JSON.parse(data);
                displayPosts(posts.list);
                if (posts.totalPages > 1) {
                    displayPagination(posts.totalPages, posts.currentPage);
                }
            } catch(e) {
                console.error("JSON 파싱 에러:", e);
            }
        },
        error: function() {
            alert("서버 통신 중 오류가 발생했습니다.");
        }
    });
}

function displayPosts(posts) {
    const tbody = $("#boardList");
    tbody.empty();
    
    if (!posts || posts.length === 0) {
        tbody.append(`
            <tr>
                <td colspan="5" class="text-center">등록된 게시글이 없습니다.</td>
            </tr>
        `);
        return;
    }

    posts.forEach((post) => {
        tbody.append(`
            <tr onclick="viewPost(${post.id})">
                <td>${post.id}</td>
                <td>${post.title}</td>
                <td>${post.author}</td>
                <td>${formatDate(post.createDate)}</td>
                <td>${post.viewCount || 0}</td>
            </tr>
        `);
    });
}

function displayPagination(totalPages, currentPage) {
    const pagination = $("#pagination");
    pagination.empty();

    for (let i = 1; i <= totalPages; i++) {
        pagination.append(`
            <button class="page-btn ${i === currentPage ? 'active' : ''}"
                    onclick="loadBoardList(${i})">${i}</button>
        `);
    }
}

function goHome() {
    window.location.href = '../wave.html';
}

function goMyPage() {
    window.location.href = "userInfo.jsp";
}

function logout() {
    location.href = 'logout.jsp';
}

function writePost() {
    window.location.href = 'boardWrite.jsp';
}

function viewPost(id) {
    window.location.href = 'boardView.jsp?id=' + id;
}

function formatDate(dateStr) {
    if (!dateStr) return '';
    const date = new Date(dateStr);
    return date.getFullYear() + '-' + 
           String(date.getMonth() + 1).padStart(2, '0') + '-' + 
           String(date.getDate()).padStart(2, '0');
}