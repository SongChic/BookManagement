package com.song.example.dao;

import com.song.example.service.BookService;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookDao extends BookService {
}
