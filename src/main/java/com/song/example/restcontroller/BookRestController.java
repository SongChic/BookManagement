package com.song.example.restcontroller;

import com.song.example.dao.BookDao;
import com.song.example.dto.BookDto;
import com.song.example.dto.CommonResponse;
import com.song.example.service.BookServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("/rest/book/")
public class BookRestController {
    private final BookServiceImpl bookService;

    @RequestMapping("delete/{idx}")
    @ResponseBody
    public ResponseEntity<CommonResponse> delete(
        @PathVariable( value = "idx") int idx
    ) {
       CommonResponse commonResponse = new CommonResponse();
       int result = bookService.delete(idx);
       if ( result > 0 ) {
           commonResponse.setStatus(200);
           commonResponse.setMessage("삭제되었습니다.");
       } else {
           commonResponse.setStatus(-100);
           commonResponse.setMessage("삭제에 실패했습니다.\n잠시후 다시 시도해주세요.");
       }
       return new ResponseEntity<CommonResponse>(commonResponse, HttpStatus.OK);
    }

    @RequestMapping("regist")
    @ResponseBody
    public ResponseEntity<CommonResponse> regist(
            @RequestBody BookDto bookDto
            ) {
        CommonResponse commonResponse = new CommonResponse();
        int result = bookService.regist(bookDto);
        if ( result > 0 ) {
            commonResponse.setStatus(200);
            commonResponse.setMessage("등록되었습니다.");
            commonResponse.setData(bookDto.getIdx());
        } else {
            commonResponse.setStatus(-100);
            commonResponse.setMessage("등록에 실패했습니다.\n잠시후 다시 시도해주세요.");
        }
        return new ResponseEntity<CommonResponse>(commonResponse, HttpStatus.OK);
    }
}
