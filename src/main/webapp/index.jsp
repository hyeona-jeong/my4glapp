<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
    body { font-family: sans-serif; margin: 40px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
    th { background-color: #f4f4f4; }
    td.title { text-align: left; }
    .btn { padding: 8px 16px; background: #007bff; color: white; text-decoration: none; border-radius: 4px; }
</style>
</head>
<body>

    <h2>📋 Rocky 10 게시판</h2>
    <a href="write.jsp" class="btn">글쓰기</a>

    <table>
        <thead>
            <tr>
                <th width="10%">번호</th>
                <th width="50%">제목</th>
                <th width="15%">작성자</th>
                <th width="25%">작성일</th>
            </tr>
        </thead>
        <tbody>
        <%
            // MariaDB 기준 (MySQL일 경우 mariadb -> mysql 로 변경)
            String url = "jdbc:mariadb://192.168.111.131:3306/boarddb?useUnicode=true&characterEncoding=utf8mb4";
            String dbUser = "boarduser";
            String dbPass = "1234";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("org.mariadb.jdbc.Driver"); // MySQL: com.mysql.cj.jdbc.Driver
                conn = DriverManager.getConnection(url, dbUser, dbPass);

                String sql = "SELECT id, title, writer, content, reg_date FROM board ORDER BY id DESC";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String writer = rs.getString("writer");
                    String content = rs.getString("content");
                    String regDate = rs.getString("reg_date");
        %>
            <tr>
                <td><%= id %></td>
                <td class="title">
                    <strong><%= title %></strong><br>
                    <small style="color: #666;"><%= content %></small>
                </td>
                <td><%= writer %></td>
                <td><%= regDate %></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='4'>DB 연결 오류: " + e.getMessage() + "</td></tr>");
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
        %>
        </tbody>
    </table>

</body>
</html>
