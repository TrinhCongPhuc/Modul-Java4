<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="ra.academy.model.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 11/13/2023
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>
<%!
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>
<c:set var="f" value='<%=new SimpleDateFormat("yyyy-MM-dd")%>' scope="page"></c:set>
<h1>Thêm mới khách hàng</h1>


<form action="<%=request.getContextPath()%>/CustomerController" method="post">
    <div class="mb-3">
        <label for="id" class="form-label">ID</label>
        <input type="number" min="1" readonly class="form-control" id="id" name="id" value="${customer.id}">
    </div>
    <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text"  value="${customer.name}" class="form-control" id="name" name="name">
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control"  value="${customer.email}" id="email" placeholder="name@example.com" name="email">
    </div>
    <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="text" class="form-control"  value="${customer.phone}" id="phone" placeholder="0987654321" name="phone">
    </div>
    <div class="mb-3">
        <label for="gen" class="form-label">Gender</label>
        <select class="form-select" id="gen" name="gen">
            <option value="true" ${customer.gen?"selected":""}>Nam</option>
            <option value="false" ${!customer.gen?"selected":""}>Nữ</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="birth" class="form-label">Birthday</label>
<%--        <input type="date" name="birthday" value="<%=format.format(((Customer) request.getAttribute("customer")).getBirthday())%>" id="birth">--%>
        <input type="date" name="birthday" value="${f.format(customer.birthday)}" id="birth">
    </div>
    <div class="mb-3">
        <label for="bios" class="form-label">Bios</label>
        <textarea class="form-control" id="bios" rows="3" name="bios">${customer.bios}</textarea>
    </div>
    <div class="mb-3">
        <label for="avatar" class="form-label">Avatar</label>
        <div>
            <img width="200" height="200" style="object-fit: cover"  src="${customer.imageUrl}" alt="#">
        </div>
        <textarea class="form-control" id="avatar" rows="3" name="avatar">${customer.imageUrl}</textarea>
    </div>

    <input class="btn btn-success" type="submit" value="UPDATE" name="action">
</form>
<jsp:include page="../assets/foot.jsp"></jsp:include>
</body>
</html>
