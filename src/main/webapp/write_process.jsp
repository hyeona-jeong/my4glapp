<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // POST 요청 한글 및 이모지 깨짐 방지
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");

    // MariaDB 기준 (MySQL일 경우 mariadb -> mysql 로 변경)
    String url = "jdbc:mariadb://192.168.111.131:3306/boarddb?useUnicode=true&characterEncoding=utf8mb4";
    String dbUser = "boarduser";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver"); // MySQL: com.mysql.cj.jdbc.Driver
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "INSERT INTO board (title, writer, content) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, writer);
        pstmt.setString(3, content);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            // 저장 성공 시 목록 페이지로 이동
            response.sendRedirect("index.jsp");
        } else {
            out.println("<script>alert('글 등록에 실패했습니다.'); history.back();</script>");
        }
    } catch (Exception e) {
        out.println("<h3>오류 발생: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
