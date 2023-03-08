<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2023-03-08
  Time: PM 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../header.jsp"/>
<html>
<head>
    <jsp:include page="../header.jsp"/>
</head>
<body>
<div class="container">
    <div>
        <h3>제품 등록</h3>
    </div>

    <form method="post">
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="inputGroup-sizing-sm-name">제품명</span>
            <input type="text" name="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
        </div>

        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="inputGroup-sizing-sm-price">단가</span>
            <input type="number" name="price" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
        </div>

        <div>
            <label>구분 : </label>
            <select class="form-select" aria-label="Default select example" name="category">
                <option selected>Open this select menu</option>
                <option value="1">음료</option>
                <option value="2">푸드</option>
                <option value="3">상품</option>
                <option value="4">카드</option>
            </select>
        </div>

        <div>
            <label>판매여부 : </label>
            <select class="form-select" aria-label="Default select example" name="status">
                <option selected>Open this select menu</option>
                <option value="0">판매 중지</option>
                <option value="1">판매 중</option>
            </select>
        </div>

        <div class="mt-3">
            <button class="btn btn-sm btn-primary">등록</button> <a href="list"><button type="button" class="btn btn-sm btn-danger">취소</button></a>
        </div>
    </form>

</div>
</body>
</html>
