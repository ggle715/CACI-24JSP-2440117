<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDAO"%>
<%
    response.setContentType("application/json; charset=UTF-8");

    String pageParam = request.getParameter("page");
    int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam); // 변수명 변경

    try {
        BoardDAO dao = new BoardDAO();
        String jsonData = dao.getList(currentPage); // 변경된 변수명 사용
        out.print(jsonData);
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.print("{\"error\":\"Failed to load board list\"}");
        e.printStackTrace();
    }
%>
