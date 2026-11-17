<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String now = sdf.format(new Date());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>4glapp 배포 테스트</title>
    <style>
        body {
            font-family: 'Malgun Gothic', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f6f9;
        }
        .card {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 { color: #2c3e50; margin-bottom: 10px; }
        p { color: #555; font-size: 16px; }
        .badge {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 16px;
            background-color: #2ecc71;
            color: white;
            border-radius: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>4glapp Web Application</h1>
        <p>JSP IS ACTIVE.</p>
        <p><strong>Server Present Time:</strong> <%= now %></p>
        <div class="badge">Deploy Success</div>
    </div>
</body>
</html>
