<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>BOOK LIST</title>
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
</head>

<body>
    <div id="wrap">
        <div id="container">
            <h1 class="text-center">BOOK LIST</h1>

            <table class="table table-striped">
                <colgroup>
                    <col width="8%"/>
                    <col/>
                    <col/>
                    <col/>
                    <col/>
                    <col width="10%"/>
                </colgroup>
                <thead>
                    <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">제목</th>
                        <th class="text-center">저자</th>
                        <th class="text-center">수량</th>
                        <th class="text-center">등록일</th>
                        <th class="text-center">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${fn:length(bookList) > 0}">
                            <c:forEach items="${bookList}" var="book">
                                <tr>
                                    <td class="text-center">${book.rowNum}</td>
                                    <td style="cursor: pointer;" onclick="location.href='${ctx}/detail/${book.idx}'">${book.title}</td>
                                    <td class="text-center">${book.creator}</td>
                                    <td class="text-center">${book.quantity}</td>
                                    <td class="text-center">2025-03-08</td>
                                    <td class="text-center"><button class="btn btn-primary btn-sm del-btn" value="${book.idx}" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td class="text-center" colspan="5">등록된 책이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>

                </tbody>
            </table>

            <div class="flex flex-same">
                <div class="search-wrap">
                    <form action="${ctx}/index" class="flex">
                        <select name="sty">
                            <option value="title"${sty == 'title' ? " selected" : ""}>제목</option>
                            <option value="creator"${sty == 'creator' ? " selected" : ""}>저자</option>
                        </select>
                        <input name="stt" type="text" placeholder="검색어를 입력해주세요." value="${stt}"/>
                        <button class="btn btn-primary flex-end btn-sm" type="submit">검색</button>
                    </form>
                </div>

                <div class="flex justify-content-center">
                    <c:if test="${pagination.endPage > 0}">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" varStatus="status">
                                <c:set var="addClass" value=""/>
                                <c:if test="${pagination.page == status.count}">
                                    <c:set var="addClass" value=" active"/>
                                </c:if>
                                <li class="page-item${addClass}"><a class="page-link" href="${ctx}/index?page=${status.count}">${status.count}</a></li>
                            </c:forEach>

                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </c:if>

                </div>

                <div class="flex flex-end">
                    <button class="btn btn-primary flex-end btn-sm" type="button" onclick="location.href='${ctx}/regist/0'">책 등록</button>
                </div>
            </div>

        </div>
    </div>

<!-- 삭제 모달 (s) -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">책 삭제 알림</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    해당 책을 삭제하시겠습니까?
                    삭제하면 모든 데이터가 <strong>삭제</strong>됩니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary book-modal-delete-btn">삭제</button>
                </div>
            </div>
        </div>
    </div>
<!-- 삭제 모달 (e) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/common.js"></script>

<script type="application/javascript">
    $(document).ready(function( event ) {
        let selectIdx = 0;
        $(".del-btn").on("click", function( event) {
            const $this = $(this);
            selectIdx = $this.val();
        });
       $(".book-modal-delete-btn").on("click", function(event) {
           commonAjax(
               "${ctx}/rest/book/delete/" + selectIdx,
               "post",
               {},
               function( response ) {
                   alert(response.message);
                   if ( response.status == 200 ) {
                       location.reload();
                   }
               }
           );
       });
    });
</script>
</body>
</html>