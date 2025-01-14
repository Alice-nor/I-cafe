<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <style>
    <%@include file="../theme.css"%>
    <%@include file="../my.css"%>
  </style>
</head>

<body>
<%@include file="../parts/navbar.jsp"%>
  <div class="text-center py-2">
    <div class="container">
      <div class="row">
        <div class="col-md-12 p-3">
          <h1 class="mb-0 text-left">留言管理</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"> <a href="<%=request.getContextPath()%>/index.jsp">首頁</a> </li>
            <li class="breadcrumb-item active">留言管理</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="pb-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="table-responsive">
            <table class="table table-bordered ">
                <thead class="thead-dark">
                <tr>
                  <th>顧客名稱</th>
                  <th>E-mail</th>
                  <th>留言</th>
                  <th>留言時間</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="comment" items="${listComment}">
                <tr>
                  <td><c:out value="${comment.name}" /></td>
                  <td><c:out value="${comment.email}" /></td>
                  <td><c:out value="${comment.comment}" /></td>
                  <td><c:out value="${comment.published_at}" /></td>
                  <td><a class="btn btn-link p-0" href="edit?c_id=<c:out value='${comment.c_id}' />">編輯</a>&nbsp;&nbsp;&nbsp;
                    <a class="btn btn-link p-0" onclick="return confirm('確定刪除此筆資料?刪除後無法回復')" href="delete?c_id=<c:out value='${comment.c_id}' />">刪除</a></td>
                </tr>
                
                <c:if test="${comment.m_name != null}">
                <div>
                <thead>
                <tr class="comment-frame">
                  <th><b>↑Re↑</b></th>
                  <th>管理者姓名</th>
                  <th>管理者回覆</th>
                  <th>回覆時間</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tr class="comment-frame">
                  <td>#</td>
                  <td><c:out value="${comment.m_name}" /></td>
                  <td><c:out value="${comment.replyComment}" /></td>
                  <td><c:out value="${comment.published_at}" /></td>
                  <td><a class="btn btn-link p-0" href="edit?c_id=<c:out value='${comment.c_id}' />">編輯</a>&nbsp;&nbsp;&nbsp;
                    <a class="btn btn-link p-0" onclick="return confirm('確定刪除此筆資料?刪除後無法回復')" href="deleteRy?c_id=<c:out value='${comment.c_id}' />">刪除</a></td>
                </tr>
                </div>
                </c:if>
              </c:forEach>

              </tbody>


            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <p class="mb-0">© 2014-2018 MacroViz. All rights reserved</p>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>