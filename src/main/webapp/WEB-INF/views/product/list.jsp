<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2023-03-08
  Time: PM 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
<html>
<head>
    <jsp:include page="../header.jsp"/>
</head>
<body>
<div class="container">
    <div>
        <h3>제품 목록</h3>
    </div>

    <div>
        <form method="get">
            <select class="form-select" aria-label="Default select example" name="search">
                <option value="1" ${pager.search eq 1 ? 'selected' : ''}>제품 번호</option>
                <option value="2" ${pager.search eq 2 ? 'selected' : ''}>제품명</option>
                <option value="3" ${pager.search eq 3 ? 'selected' : ''}>단가</option>
                <option value="4" ${pager.search eq 4 ? 'selected' : ''}>구분</option>
                <option value="5" ${pager.search eq 5 ? 'selected' : ''}>판매 여부</option>
            </select>

            <div>
            <input name="keyword" type="text" value="${pager.keyword}">
            </div>

            <div>
                <input name="minPrice" type="number" value="${pager.minPrice}" placeholder="하한 금액"> ~
                <input name="maxPrice" type="number" value="${pager.maxPrice}" placeholder="상한 금액">
            </div>

            <div>
                <select class="form-select" aria-label="Default select example" name="keywordCategory">
                    <option value="1">음료</option>
                    <option value="2">푸드</option>
                    <option value="3">상품</option>
                    <option value="4">카드</option>
                </select>
            </div>

            <div>
                <select class="form-select" aria-label="Default select example" name="keywordStatus">
                    <option value="0">판매 중지</option>
                    <option value="1">판매 중</option>
                </select>
            </div>


            <button class="btn btn-sm btn-primary">검색</button>
        </form>
    </div>

    <div>
        <table border="1" class="table table-sm table-dark table-hover">
            <thead>
            <tr>
                <th>제품 번호</th>
                <th>제품명</th>
                <th>단가</th>
                <th>구분</th>
                <th>판매여부</th>
                <th>관리</th>
            </tr>
            </thead>

            <tbody>
            <c:if test="${list.size() < 1}">
                <tr>
                    <td colspan="6">등록 된 제품이 없습니다.</td>
                </tr>
            </c:if>

            <c:forEach var="item" items="${list}">
                <tr>
                    <td>${item.productId}</td>
                    <td>${item.name}</td>
                    <td>${item.price} 원</td>
                    <td>${item.category__}</td>
                    <td>${item.status__}</td>
                    <td>
                        <a href="update/${item.productId}" class="btn btn-sm btn-primary">변경</a>
                        <a href="delete/${item.productId}" class="btn btn-sm btn-danger">삭제</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <tfoot>
        <ul class="pagination" style="justify-content: center">
            <li class="page-item">
                <a class="page-link" href="?page=1${pager.query}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="?page=${pager.prev}${pager.query}">이전</a></li>

            <c:forEach var="page" items="${pager.list}">
                <li class="page-item ${page eq pager.page ? 'active' : ''}"><a class="page-link" href="?page=${page}${pager.query}" >${page}</a></li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="?page=${pager.next}${pager.query}">다음</a></li>
            <li class="page-item">
                <a class="page-link" href="?page=${pager.last}${pager.query}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
        </tfoot>

    </div>

    <div>
        <a href="dummy" class="btn btn-sm btn-primary">대량 등록</a> <a href="init" class="btn btn-sm btn-danger">초기화</a>
    </div>

    <div class="mt-3">
        <a href="add" class="btn btn-sm btn-primary">등록</a> <a href="../" class="btn btn-sm btn-danger">이전</a>
    </div>
</div>
</body>
</html>
