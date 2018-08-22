package com.test;

import com.dao.BookInMemoryDAO;

public class Main {
    public static void main(String[] args) {
        System.out.println(new BookInMemoryDAO().listAll());
    }
}
