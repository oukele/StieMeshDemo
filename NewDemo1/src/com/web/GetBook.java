package com.web;

import com.dao.BookInMemoryDAO;
import com.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/book/GetBook")
public class GetBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        int id = Integer.parseInt(request.getParameter("id"));
        Book info = new BookInMemoryDAO().getBookById(id);
        String html = "{\"id\":\""+info.getId()+"\",\"name\":\""+info.getName()+"\",\"price\":\""+info.getPrice()+"\",\"author\":\""+info.getAuthor()+"\",\"press\":\""+info.getPress()+"\"}";
        response.getWriter().print(html);

    }
}
