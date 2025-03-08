package com.song.example.service;

import com.song.example.dto.BookDto;
import com.song.example.vo.Pagination;

import java.util.List;

public interface BookService {
    List<BookDto> getBookList(Pagination pagination);
    int getAllCount(Pagination pagination);
    BookDto getData( int idx );
    int delete( int idx );
    int regist( BookDto bookDto );
}
