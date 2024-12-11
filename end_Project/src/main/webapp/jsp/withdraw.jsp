<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
    request.setCharacterEncoding("utf-8");
    String uid = request.getParameter("id");
    
    UserDAO dao = new UserDAO();
    if (dao.exists(uid) == false) {
        out.print("NA");
        return;
    }
    
    if (dao.delete(uid)) {
        session.removeAttribute("id");
        out.print("OK");
    }
    else {
        out.print("ER");
    }
%>