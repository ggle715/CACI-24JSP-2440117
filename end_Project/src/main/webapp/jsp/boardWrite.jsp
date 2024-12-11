<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDAO"%>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = "manager"; // 로그인 세션에서 가져와야 함 (임시 값)

    if (title == null || content == null) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        out.print("{\"error\":\"제목과 내용을 모두 입력해야 합니다.\"}");
        return;
    }

    try {
        BoardDAO dao = new BoardDAO();
        boolean result = dao.insert(title, content, author);
        if (result) {
            response.sendRedirect("board.jsp");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"게시글 저장에 실패했습니다.\"}");
        }
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.print("{\"error\":\"서버 오류 발생.\"}");
        e.printStackTrace();
    }
%>
