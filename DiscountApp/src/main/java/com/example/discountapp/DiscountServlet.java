package com.example.discountapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DiscountServlet {
    @WebServlet(name = "DiscountCalculator", value = "/display-discount")
    public static class DiscountCalculator extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // Lấy dữ liệu từ form
            String productDescription = request.getParameter("productDescription");
            double listPrice = Double.parseDouble(request.getParameter("listPrice"));
            double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));

            // Tính toán chiết khấu
            double discountAmount = listPrice * discountPercent * 0.01;
            double discountPrice = listPrice - discountAmount;

            // Đặt các giá trị vào request để hiển thị trên trang kết quả
            request.setAttribute("productDescription", productDescription);
            request.setAttribute("listPrice", listPrice);
            request.setAttribute("discountPercent", discountPercent);
            request.setAttribute("discountAmount", discountAmount);
            request.setAttribute("discountPrice", discountPrice);

            // Chuyển hướng đến trang kết quả
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        }
    }
}
