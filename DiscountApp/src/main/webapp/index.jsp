<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<form action="${pageContext.request.contextPath}/display-discount" method="post">
  <div class="form-group">
    <label for="productDescription">Product Description:</label>
    <input type="text" class="form-control" id="productDescription" name="productDescription">
  </div>
  <div class="form-group">
    <label for="listPrice">List Price:</label>
    <input type="text" class="form-control" id="listPrice" name="listPrice">
  </div>
  <div class="form-group">
    <label for="discountPercent">Discount Percent:</label>
    <input type="text" class="form-control" id="discountPercent" name="discountPercent">
  </div>
  <button type="submit">Calculate Discount</button>
</form>
</body>
</html>