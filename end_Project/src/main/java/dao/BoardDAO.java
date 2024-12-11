package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.ConnectionPool;

public class BoardDAO {

    public boolean insert(String title, String content, String author) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO board (title, content, author) VALUES (?, ?, ?)";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setString(3, author);
            int count = stmt.executeUpdate();
            return count == 1;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    public String getList(int currentPage) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        StringBuilder jsonData = new StringBuilder();

        try {
            String sql = "SELECT * FROM board LIMIT ?, ?";
            int pageSize = 10;
            int start = (currentPage - 1) * pageSize;

            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, start);
            stmt.setInt(2, pageSize);
            rs = stmt.executeQuery();

            jsonData.append("[");
            while (rs.next()) {
                jsonData.append("{");
                jsonData.append("\"no\":\"").append(rs.getInt("no")).append("\",");
                jsonData.append("\"title\":\"").append(rs.getString("title")).append("\",");
                jsonData.append("\"author\":\"").append(rs.getString("author")).append("\",");
                jsonData.append("\"created_date\":\"").append(rs.getTimestamp("created_date")).append("\"");
                jsonData.append("},");
            }
            if (jsonData.charAt(jsonData.length() - 1) == ',') {
                jsonData.deleteCharAt(jsonData.length() - 1);
            }
            jsonData.append("]");
            return jsonData.toString();

        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    
    
    
    
}

