

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator App</title>

</head>
<body>
<h1>Calculator Application - Ứng dụng tính toán đơn giản</h1>
<form action="CalculatorService" method="post">
    <table>
        <tr>
            <td>Tham số thứ 1:</td>
            <td><input type="text" name="firstOperand"/></td>
        </tr>
        <tr>
            <td>Chọn toán tử:</td>
            <td>
                <select name="operator">
                    <option value="+">Cộng</option>
                    <option value="-">Trừ</option>
                    <option value="*">Nhân</option>
                    <option value="/">Chia</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Tham số thứ 2:</td>
            <td><input type="text" name="secondOperand"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Tính toán"/></td>
        </tr>
    </table>
</form>
</body>
</html>