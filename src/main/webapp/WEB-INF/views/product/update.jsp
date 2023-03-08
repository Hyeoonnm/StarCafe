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
        <h3>제품 변경</h3>
    </div>

    <form method="post">
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="inputGroup-sizing-sm-name">제품명</span>
            <input type="text" name="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${item.name}">
        </div>

        <div>
            <div class="input-group input-group-sm mb-3">
                <span class="input-group-text" id="inputGroup-sizing-sm-price">단가</span>
                <input type="text" name="price" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${item.price}">
            </div>
        </div>

        <div>
            <label>구분 : </label>
            <select class="form-select" aria-label="Default select example" name="category">
                <option selected>Open this select menu</option>
                <option value="1" ${item.category  == 1 ? "selected" : ""}>음료</option>
                <option value="2" ${item.category  == 2 ? "selected" : ""}>푸드</option>
                <option value="3" ${item.category  == 3 ? "selected" : ""}>상품</option>
                <option value="4" ${item.category  == 4 ? "selected" : ""}>카드</option>
            </select>
        </div>

        <div>
            <label>판매여부 : </label>
            <select class="form-select" aria-label="Default select example" name="status">
                <option value="0" ${item.category  == 0 ? "selected" : ""}>판매 중지</option>
                <option value="1" ${item.category  == 1 ? "selected" : ""}>판매 중</option>
            </select>
        </div>

        <div class="mt-3">
            <button class="btn btn-sm btn-primary">등록</button> <a href="../list"><button type="button" class="btn btn-sm btn-danger">취소</button></a>
        </div>
    </form>

</div>
</body>
</html>
