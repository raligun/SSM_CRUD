<%--
  Created by IntelliJ IDEA.
  User: 网中鱼
  Date: 2021/8/23
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${PATH}/static/js/jquery-1.7.2.min.js"></script>
    <script src="${PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <tr>
                    <th>编号</th>
                    <th>名字</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.gender=="1"? "男":"女"}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
        <div class="row">
            当前在${pageInfo.pageNum}页 总共${pageInfo.pages}页 共有${pageInfo.total}条信息
        </div>
    <div class="row col-md-offset-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="${PATH}/getAll?pn=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href=""${PATH}/getAll?pn=${pageInfo.pageNum-1}"" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="pn">
                    <c:if test="${pageInfo.pageNum==pn}">
                        <li class="active "><a>${pn}</a></li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=pn}">
                        <li><a href="${PATH}/getAll?pn=${pn}">${pn}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${PATH}/getAll?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="${PATH}/getAll?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>

</body>
</html>
