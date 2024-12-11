<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    try {
        request.setCharacterEncoding("utf-8");

        String uid = request.getParameter("id");
        String upw = request.getParameter("ps");
        String uname = request.getParameter("nickname");
        
        System.out.println("받은 데이터 - id: " + uid + ", pw: " + upw + ", name: " + uname);  // 데이터 확인용
        
        // JSON 객체 생성
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("id", uid);
        jsonObj.put("password", upw);
        jsonObj.put("name", uname);
        jsonObj.put("ts", new java.util.Date().getTime());
        
        System.out.println("생성된 JSON: " + jsonObj.toJSONString());  // JSON 확인용
        
        UserDAO dao = new UserDAO();
        if (dao.exists(uid)) {
            out.print("EX"); // 이미 존재하는 아이디
        }
        else {
            if (dao.insert(uid, jsonObj.toJSONString())) {
                out.print("OK");
            }
            else {
                System.out.println("insert 실패");  // insert 실패 확인용
                out.print("ER"); // 회원가입 실패
            }
        }
    } catch(Exception e) {
        System.out.println("에러 발생: " + e.getMessage());  // 예외 확인용
        e.printStackTrace();
        out.print("ER");
    }
%>