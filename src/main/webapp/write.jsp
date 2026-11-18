<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성</title>
<style>
    body { font-family: sans-serif; margin: 40px; }
    .form-group { margin-bottom: 15px; }
    label { display: block; font-weight: bold; margin-bottom: 5px; }
    input[type="text"], textarea { width: 100%; max-width: 500px; padding: 8px; box-sizing: border-box; }
    textarea { height: 150px; }
    button { padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
    a { margin-left: 10px; color: #555; text-decoration: none; }
</style>
</head>
<body>

    <h2>✏️ 새 게시글 작성</h2>
    <form action="write_process.jsp" method="post">
        <div class="form-group">
            <label>제목</label>
            <input type="text" name="title" placeholder="제목을 입력하세요 (이모지 가능 🚀)" required>
        </div>
        <div class="form-group">
            <label>작성자</label>
            <input type="text" name="writer" placeholder="작성자 이름" required>
        </div>
        <div class="form-group">
            <label>내용</label>
            <textarea name="content" placeholder="내용을 입력하세요" required></textarea>
        </div>
        <button type="submit">등록하기</button>
        <a href="index.jsp">취소</a>
    </form>

</body>
</html>
