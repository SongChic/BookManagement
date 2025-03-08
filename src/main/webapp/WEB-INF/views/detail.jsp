<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: song
  Date: 2025-03-08
  Time: 오후 10:16
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <style type="text/css">
        table tr th {
            background: rgba(0, 0, 0, .05) !important;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div id="container">
            <h1 class="text-center">BOOK DETAIL</h1>

            <table class="table">
                <colgroup>
                    <col width="15%"/>
                    <col/>
                </colgroup>
                <tbody>
                    <input name="idx" type="hidden" value="${idx}"/>
                    <c:set var="state" value=""/>
                    <c:if test="${!registState}">
                        <c:set var="state" value=" disabled"/>
                    </c:if>
                    <tr>
                        <th>책 제목</th>
                        <td><input type="text" name="title" value="${book.title}"${state}/> </td>
                    </tr>
                    <tr>
                        <th>저자</th>
                        <td><input type="text" name="creator" value="${book.creator}"${state}/> </td>
                    </tr>
                    <c:if test="${!registState}">
                        <tr>
                            <th>작성일</th>
                            <td><input type="text" value="<fmt:formatDate value="${book.created}" pattern="yyyy-MM-dd"/>" disabled/> </td>
                        </tr>
                    </c:if>

                    <tr style="min-height: 400px;">
                        <th>내용</th>
                        <td><textarea name="content"${state}>${book.content}</textarea> </td>
                    </tr>
                </tbody>
            </table>
            <div class="flex flex-end">
                <c:if test="${registState}">
                    <button style="margin-right: 10px;" type="button" class="regist-btn btn btn-primary">${book == null ? "등록" : "수정"}</button>
                </c:if>
                <c:if test="${!registState and editType == 0}">
                    <button style="margin-right: 10px;" type="button" class="btn btn-primary" onclick="location.href='${ctx}/regist/${book.idx}?editType=1'">수정</button>
                </c:if>

                <button class="btn btn-outline-primary" onclick="location.href='${ctx}/index'">목록</button>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">책 ${book == null ? "등록" : "수정"} 알림</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    책을 ${book == null ? "등록" : "수정"}하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary book-modal-regist-btn">${book == null ? "등록" : "수정"}</button>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/common.js"></script>
<script type="text/javascript">
    $(".regist-btn").on("click", function( event ) {
        if ( $("input[name=title]").val() == "" ) {
            alert("책 제목을 입력해주세요.");
            return;
        }
        if ( $("input[name=creator]").val() == "" ) {
            alert("저자를 입력해주세요.");
            return;
        }

        $("#exampleModal").modal("show");
    });
    $(".book-modal-regist-btn").on("click", function( event ) {
        commonAjaxJson(
            "${ctx}/rest/book/regist",
            "post",
            {
                idx : $("input[name=idx]").val(),
                title : $("input[name=title]").val(),
                content : $("textarea[name=content]").val(),
                creator : $("input[name=creator]").val()
            },
            function( response ) {
                alert(response.message);
                if ( response.status == 200 ) {
                    location.href = "${ctx}/detail/" + response.data;
                }
            }
        );

    });
</script>
</html>
