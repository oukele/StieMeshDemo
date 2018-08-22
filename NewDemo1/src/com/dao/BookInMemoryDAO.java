package com.dao;

import com.entity.Book;

import java.util.ArrayList;
import java.util.List;

public class BookInMemoryDAO implements BookDAO {

    private static List<Book> bookDB = new ArrayList<>();

    static {
        Book b1 = new Book(1, "西游记", 34.5f, "吴承恩", "南方出版社");
        Book b2 = new Book(2, "三国演义", 24.5f, "欧可乐", "北方出版社");
        Book b3 = new Book(3, "水浒传", 44.5f, "欧小乐", "西方出版社");
        Book b4 = new Book(4, "红楼梦", 37.5f, "欧乐乐", "东方出版社");
        Book b5 = new Book(5, "jQuery 从入门到放弃", 111.5f, "欧小笑", "南方出版社");

        bookDB.add(b1);
        bookDB.add(b2);
        bookDB.add(b3);
        bookDB.add(b4);
        bookDB.add(b5);
    }

    @Override
    public List<Book> listAll() {
        return bookDB;
    }

    @Override
    public Book getBookById(int id) {
        for (Book book : bookDB) {
            if(book.getId() == id) {
                return book;
            }
        }
        return null;
    }

    //取出所有数据
    public List<Book> listAll2(String value) {
        List<Book> book = new ArrayList<>();
        for (Book books:bookDB) {
            if(value!=""|| value!=null) {
                if (books.getName().contains(value)
                        || books.getAuthor().contains(value)
                        || String.valueOf(books.getPrice()).contains(value)
                        || String.valueOf(books.getId()).contains(value)
                        || String.valueOf(books.getPress()).contains(value)) {
                    book.add(books);
                }
            }else{
                return bookDB;
            }
        }
        return book;
    }

    @Override
    public List<Book> getBooksByName(String name) {
        ArrayList<Book> books = new ArrayList<>();
        for (Book book : bookDB) {
            String realName = book.getName().toLowerCase();
            if (realName.contains(name.toLowerCase())) {
                books.add(book);
            }
        }
        return books;
    }

    @Override
    public boolean update(Book book) {

        for (Book bookNew : bookDB){
            if(bookNew.getId() == book.getId()){
                bookNew.setName(book.getName());
                bookNew.setAuthor(book.getAuthor());
                bookNew.setPrice(book.getPrice());
                bookNew.setPress(book.getPress());
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        for (Book book : bookDB) {
            if(book.getId()==id){
                return bookDB.remove(book);
            }
        }
        return false;
    }

    @Override
    public Book add(Book book) {
        if(bookDB.add(book)){
            return book;
        }
        return null;
    }
}
