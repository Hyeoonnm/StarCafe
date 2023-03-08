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

            <tfoot>

            </tfoot>

        </table>
    </div>

    <div>
        <a href="dummy" class="btn btn-sm btn-primary">대량 등록</a> <a href="init" class="btn btn-sm btn-danger">초기화</a>
    </div>

    <div>
        <a href="add" class="btn btn-sm btn-primary">등록</a> <a href="../" class="btn btn-sm btn-danger">이전</a>
    </div>
</div>
</body>
</html>
