<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%
    response.setContentType("application/json; charset=UTF-8");
    String userId = request.getParameter("id");

    if (userId == null || userId.isEmpty()) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        out.print("{\"error\":\"User ID is required\"}");
        return;
    }

    try {
        UserDAO dao = new UserDAO();
        String userData = dao.get(userId);
        if (userData == null || userData.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            out.print("{\"error\":\"User not found\"}");
            return;
        }

        // JSON 문자열 반환
        out.print(userData);
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.print("{\"error\":\"Failed to load user information\"}");
        e.printStackTrace();
    }
%>
