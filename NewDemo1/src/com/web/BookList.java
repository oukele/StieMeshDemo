package com.web;

import com.dao.BookDAO;
import com.dao.BookInMemoryDAO;
import com.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class BookList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BookDAO bookDAO = new BookInMemoryDAO();
        List<Book> books = bookDAO.listAll();
        req.setAttribute("books", books);
       req.getRequestDispatcher("/jsp/book_list.jsp").forward(req, resp);
    }
}
