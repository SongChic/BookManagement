package com.song.example.controller;

import com.song.example.dto.BookDto;
import com.song.example.service.BookService;
import com.song.example.service.BookServiceImpl;
import com.song.example.vo.Pagination;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class MainController {
    private final BookServiceImpl bookService;

    @RequestMapping( value = "/index" )
    public ModelAndView index(
            HttpSession session,
            @RequestParam( value = "page", defaultValue = "1", required = false ) int page,
            @RequestParam( value = "stt", defaultValue = "", required = false ) String stt,
            @RequestParam( value = "sty", defaultValue = "", required = false ) String sty

    ) {
        ModelAndView mav = new ModelAndView("index");

        Pagination pagination = Pagination.builder()
                .searchText(stt)
                .searchType(sty)
                .page(page)
                .build();
        int totalCount = bookService.getAllCount(pagination);
        pagination.setTotalCount(totalCount);
        pagination.calc();

        List<BookDto> bookList = bookService.getBookList(pagination);
        mav.addObject("bookList", bookList);
        mav.addObject("pagination", pagination);
        mav.addObject("stt", stt);
        mav.addObject("sty", sty);
        return mav;
    }

    @RequestMapping( value = {"/detail/{idx}", "/regist/{idx}", "/regist"} )
    public ModelAndView detail(
            HttpServletRequest request,
            @PathVariable( value = "idx", required = false ) Long idx,
            @RequestParam( value = "editType", required = false, defaultValue = "0") int editType
    ) {
        ModelAndView mav = new ModelAndView("detail");

        BookDto book = null;
        if ( idx != null ) {
            book = bookService.getData(idx.intValue());
        }

        boolean registState = false;
        if ( request.getRequestURI().contains("regist") ) {
            registState = true;
        }
        if ( editType == 1 ) {
            registState = true;
        }

        mav.addObject("registState", registState);
        mav.addObject("book", book);
        mav.addObject("idx", idx);
        mav.addObject("editType", editType);

        return mav;
    }
}
