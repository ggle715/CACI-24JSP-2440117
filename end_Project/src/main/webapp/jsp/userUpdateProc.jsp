<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
    request.setCharacterEncoding("utf-8");
    String uid = request.getParameter("id");
    String jsonstr = request.getParameter("jsonstr");
    
    UserDAO dao = new UserDAO();
    if (dao.update(uid, jsonstr)) {
        out.print("OK");
    }
    else {
        out.print("ER");
    }
%>