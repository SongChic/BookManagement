package com.song.example.service;

import com.song.example.dao.BookDao;
import com.song.example.dto.BookDto;
import com.song.example.vo.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class BookServiceImpl implements BookService
{
    private final BookDao bookDao;

    @Override
    public List<BookDto> getBookList(Pagination pagination) {
        return bookDao.getBookList(pagination);
    }


    @Override
    public int getAllCount(Pagination pagination) {
        return bookDao.getAllCount(pagination);
    }

    @Override
    public BookDto getData(int idx) {
        return bookDao.getData(idx);
    }

    @Override
    public int delete(int idx) {
        return bookDao.delete(idx);
    }

    @Override
    public int regist(BookDto bookDto) {
        return bookDao.regist(bookDto);
    }
}
