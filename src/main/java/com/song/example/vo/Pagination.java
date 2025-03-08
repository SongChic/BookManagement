package com.song.example.vo;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Pagination {
    private final int COMMON_PAGE_BLOCK = 10;
    private int page;
    private int startPage;
    private int endPage;
    private int lastPage;
    private long totalCount;
    private int totalPage;
    private int groupIndex;

    private int pageSize = 10;

    private int countState = 0;

    private String searchText;
    private String searchType;

    private boolean prevState = true;
    private boolean nextState = true;

    private boolean firstState = true;
    private boolean lastState = true;

    public void calc() {
        // 총 페이지 수 계산
        totalPage = (int) Math.ceil((double) totalCount / 10);

        // 현재 페이지 그룹 인덱스 계산
        groupIndex = (int) Math.ceil((double) page / COMMON_PAGE_BLOCK);
        if (groupIndex == 0) {
            groupIndex = 1;
        }

        // 시작 페이지와 끝 페이지 계산
        startPage = (groupIndex - 1) * COMMON_PAGE_BLOCK + 1;
        endPage = groupIndex * COMMON_PAGE_BLOCK;

        // 끝 페이지가 총 페이지 수를 넘지 않도록 조정
        if (endPage > totalPage) {
            endPage = totalPage;
        }

        // 이전/다음 버튼 활성화 상태 설정
        firstState = (page > 1);
        prevState = (page > 1);
        nextState = (page < totalPage);
        lastState = (page < totalPage);
    }
}
