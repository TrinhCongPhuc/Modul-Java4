<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết quả tải ảnh</title>
</head>
<body>
<h2>Upload hình ảnh thành công</h2>

<div class="container-lg">
    <h1>Các File Upload</h1>
    <div class="d-flex gap-2" style="border: 3px solid black">
        <c:forEach items="${listFileNames}" var="f" varStatus="loop">
            <img src="uploads/${f}" width="150" height="150" style="object-fit: cover" alt="true">
        </c:forEach>
    </div>
</div>

</body>
</html>