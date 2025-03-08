package com.song.example.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommonResponse {
    private int status;
    private String message;
    private Object data;
}
