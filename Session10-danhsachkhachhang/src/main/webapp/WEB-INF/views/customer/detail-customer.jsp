<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết Khách hàng</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
<h1>THÔNG TIN CHI TIẾT KHÁCH HÀNG</h1>
<table class="table">
    <thead>
    <tr>
        <th>Avatar</th>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Birthday</th>
        <th>Gender</th>
        <th>Bios</th>

    </tr>
    </thead>
    <tbody>
    <tr>
        <td><img width="100" height="100" style="object-fit: cover" src="${customer.imageUrl}" alt="${customer.name}"></td>
        <td>${customer.id}</td>
        <td>${customer.name}</td>
        <td>${customer.email}</td>
        <td>${customer.phone}</td>
        <td>${customer.birthday}</td>
        <td>${customer.gen ? "Nam" : "Nữ"}</td>
        <td>${customer.bios}</td>
    </tr>
    </tbody>
</table>
<a href="<%=request.getContextPath()%>/CustomerController?action=FINDALL" class="btn btn-primary">Quay lại danh sách</a>
<jsp:include page="../assets/foot.jsp"></jsp:include>
</body>
</html>
