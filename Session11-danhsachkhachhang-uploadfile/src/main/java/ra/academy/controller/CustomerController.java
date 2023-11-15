package ra.academy.controller;

import ra.academy.model.Customer;
import ra.academy.service.ICustomerService;
import ra.academy.serviceimpl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "CustomerController", value = "/CustomerController")
public class CustomerController extends HttpServlet {
    private SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request,response);
        }else {
            switch (action){
                case "FINDALL":
                    showListCustomer(customerService.findAll(),request,response);
                    break;
                case "ADD":
                    request.getRequestDispatcher("/WEB-INF/views/customer/add-customer.jsp").forward(request,response);
                    break;
                case "EDIT":
                    Long idEdit = Long.parseLong(request.getParameter("id"));
                    Optional<Customer> optionalCustomer = customerService.findById(idEdit);
                    optionalCustomer.ifPresent(cus->{
                        request.setAttribute("customer",cus);
                        try {
                            request.getRequestDispatcher("/WEB-INF/views/customer/edit-customer.jsp").forward(request,response);
                        } catch (ServletException | IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
                    break;
                case "DELETE":
                    Long idDel = Long.parseLong(request.getParameter("id"));
                    customerService.deleteById(idDel);
                    showListCustomer(customerService.findAll(),request,response);
                    break;
                case "DETAIL":
                    Long idDetail = Long.parseLong(request.getParameter("id"));
                    optionalCustomer = customerService.findById(idDetail);
                    optionalCustomer.ifPresent(customer -> {
                        request.setAttribute("customer", customer);
                        try {
                            request.getRequestDispatcher("/WEB-INF/views/customer/detail-customer.jsp").forward(request, response);
                        } catch (ServletException | IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
                    break;
            }
        }
    }

    protected void showListCustomer(List<Customer> list , HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
        req.setAttribute("list",list);
        req.getRequestDispatcher("/WEB-INF/views/customer/list-customer.jsp").forward(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null){
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request,response);
        }else {
            switch (action){
                case "ADD":
                case "UPDATE":
                    // lấy ra toàn bộ thông in nhập vào
                    Long idNew = Long.parseLong(request.getParameter("id"));
                    String newName  = request.getParameter("name");
                    String emailNew  = request.getParameter("email");
                    String phoneNew  = request.getParameter("phone");
                    String biosNew  = request.getParameter("bios");
                    String imageUrlNew  = request.getParameter("avatar");
                    boolean genNew  = Boolean.parseBoolean(request.getParameter("gen"));
                    Date birthdayNew  = null;
                    try {
                        birthdayNew = sim.parse(request.getParameter("birthday"));
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                    Customer customer = new Customer(idNew,newName,emailNew,phoneNew,genNew,birthdayNew,biosNew,imageUrlNew);
                    customerService.save(customer);
                    showListCustomer(customerService.findAll(),request,response);
                    break;
            }
        }
    }
}