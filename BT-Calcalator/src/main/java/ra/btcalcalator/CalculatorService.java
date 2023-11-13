package ra.btcalcalator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CalculatorService", value = "/CalculatorService")
public class CalculatorService extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Calculator</h1>");
        out.println("<form method='post'>");
        out.println("First operand: <input type='text' name='firstOperand'><br>");
        out.println("Operator (+, -, *, /): <input type='text' name='operator'><br>");
        out.println("Second operand: <input type='text' name='secondOperand'><br>");
        out.println("<input type='submit' value='Calculate'>");
        out.println("</form>");
        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String firstOperandStr = request.getParameter("firstOperand");
        String secondOperandStr = request.getParameter("secondOperand");
        String operator = request.getParameter("operator");
        if (firstOperandStr != null && secondOperandStr != null && operator != null &&
                !firstOperandStr.isEmpty() && !secondOperandStr.isEmpty() && !operator.isEmpty()) {
            try {
                float firstOperand = Float.parseFloat(firstOperandStr);
                float secondOperand = Float.parseFloat(secondOperandStr);

                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h1>Kết quả:</h1>");
                try {
                    float result = calculate(firstOperand, secondOperand, operator);
                    out.println(firstOperand + " " + operator + " " + secondOperand + " = " + result);
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
                out.println("</body></html>");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Toán tử không hợp lệ");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tham số hoặc tham số không tồn tại");
        }
    }

    private float calculate(float firstOperand, float secondOperand, String operator) {
        float result = 0;
        switch (operator) {
            case "+":
                result = firstOperand + secondOperand;
                break;
            case "-":
                result = firstOperand - secondOperand;
                break;
            case "*":
                result = firstOperand * secondOperand;
                break;
            case "/":
                if (secondOperand != 0) {
                    result = firstOperand / secondOperand;
                } else {
                    throw new ArithmeticException("Không thể thực hiện phép chia với tham số thứ 2 là 0");
                }
                break;
            default:
                throw new IllegalArgumentException("Toán tử không hợp lệ : " + operator);
        }
        return result;
    }
}