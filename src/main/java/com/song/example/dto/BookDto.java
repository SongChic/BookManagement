package com.song.example.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BookDto {
    private int idx;
    private String title;
    private String content;
    private Date created;
    private String creator;
}
