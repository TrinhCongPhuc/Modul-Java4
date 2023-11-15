<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - JSTL - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %> </h1>
<br/>
<a href="<%=request.getContextPath()%>/CustomerController?action=FINDALL">Danh sách khách hàng</a>

<h2>Demo tải file ảnh</h2>
<form method="post" action="<%=request.getContextPath()%>/uploadfile" enctype="multipart/form-data">
    Select file to upload: <input multiple type="file" name="file" size="100" /><br /><br />
    <input type="submit" value="Upload" />
</form>

</body>
</html>